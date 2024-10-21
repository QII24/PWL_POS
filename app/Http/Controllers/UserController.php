<?php

namespace App\Http\Controllers;

use App\Models\levelmodel;
use App\Models\usermodel;
use Illuminate\support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\Validator;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use Barryvdh\DomPDF\Facade\Pdf;

class UserController extends Controller
{
    //menampilkan halaman awal user
    public function index()
    {
        $breadcrumb = (object)[
            'title' => 'Daftar user',
            'list' => ['Home', 'user'],
        ];

        $page = (object)[
            'title' => 'Daftar user yang terdaftar dalam sistem'
        ];

        $activeMenu = 'user'; //set menu yang aktif
        $level = levelmodel::all(); //mengambil data level untuk filter level
        return view('user.index', ['breadcrumb' => $breadcrumb, 'page' => $page, 'activeMenu' => $activeMenu, 'level'=>$level]);
    }

    public function list(Request $request)
    {
        $user = UserModel::select('user_id', 'username', 'nama', 'level_id')
            ->with('level');

        if ($request->level_id){
            $user->where('level_id',$request->level_id);
        }
        return DataTables::of($user)
            // Ambil data user dalam bentuk json untuk datables
            // menambahkan kolom index / no urut (default nama kolom: DT_RowIndex)
            ->addIndexColumn()
            ->addColumn('aksi', function ($user) { // menambahkan kolom aksi
                $btn = '<a href="' . url('/user/' . $user->user_id) . '" class="btn btn-info btnsm">Detail</a> ';
                $btn .= '<a href="' . url('/user/' . $user->user_id . '/edit') . '" class="btn btn-warning btn-sm">Edit</a> ';
                $btn .= '<form class="d-inline-block" method="POST" action="' .
                    url('/user/' . $user->user_id) . '">'
                    . csrf_field() . method_field('DELETE') .
                    '<button type="submit" class="btn btn-danger btn-sm" onclick="return confirm(\'Apakah Anda yakit menghapus data ini?\');">Hapus</button></form>';
                $btn = '<button onclick="modalAction(\'' . url('/user/' . $user->user_id .
                    '/show_ajax') . '\')" class="btn btn-info btn-sm">Detail</button> ';
                $btn .= '<button onclick="modalAction(\'' . url('/user/' . $user->user_id .
                    '/edit_ajax') . '\')" class="btn btn-warning btn-sm">Edit</button> ';
                $btn .= '<button onclick="modalAction(\'' . url('/user/' . $user->user_id .
                    '/delete_ajax') . '\')" class="btn btn-danger btn-sm">Hapus</button> ';
                return $btn;
            })
            ->rawColumns(['aksi']) // memberitahu bahwa kolom aksi adalah html
            ->make(true);
    }

    public function create(){
        $breadcrumb = (object)[
            'title' => 'Tambah User',
            'list' => ['Home','User','Tambah']
        ];

        $page = (object)[
            'title' => 'Tambah User Baru'
        ];

        $level = levelmodel::all();
        $activeMenu ='user';

        return view('user.create',['breadcrumb' => $breadcrumb, 'page' => $page, 'level' => $level, 'activeMenu' =>$activeMenu]);
    }

    public function store(Request $request){
        $request->validate([
            'username' => 'required|string|min:3|unique:m_user,username',
            'nama'=>'required|string|max:100',
            'password'=>'required|min:5',
            'level_id'=>'required|integer',
        ]);

        usermodel::create([
            'username'=>$request->username,
            'nama'=>$request->nama,
            'password'=>bcrypt($request->password),
            'level_id'=> $request->level_id
        ]);

        return redirect('/user')->with('success','Data user berhasil disimpan');
    }

    public function show(string $id){
        $user = usermodel::with('level')->find($id);

        $breadcrumb = (object) [
            'title' => 'Detail user',
            'list' => ['Home','User','Detail']
        ];

        $page = (object)[
            'title'=>'Detail user'
        ];

        $activeMenu = 'user';
        return view('user.show',['breadcrumb' =>$breadcrumb,'page'=>$page,'user'=>$user, 'activeMenu'=>$activeMenu]);
    }

    public function show_ajax($id){
        $user = usermodel::with('level')->find($id);

        $breadcrumb = (object) [
            'title' => 'Detail user',
            'list' => ['Home','User','Detail']
        ];

        $page = (object)[
            'title'=>'Detail user'
        ];

        $activeMenu = 'user';
        return view('user.show_ajax',['breadcrumb' =>$breadcrumb,'page'=>$page,'user'=>$user, 'activeMenu'=>$activeMenu]);
    }

    // Menampilkan halaman form edit user Ajax
    public function edit_ajax(string $id)
    {
        $user = UserModel::find($id);
        $level = LevelModel::select('level_id', 'level_nama')->get();
        return view('user.edit_ajax', ['user' => $user, 'level' => $level]);
    }

        // Menyimpan perubahan data user Ajax
    // Menyimpan perubahan data user dengan AJAX termasuk file gambar
    public function update_ajax(Request $request, $id)
    {
        // Periksa jika request berasal dari AJAX atau JSON
        if ($request->ajax() || $request->wantsJson()) {
            $rules = [
                'level_id' => 'required|integer',
                'username' => 'required|max:20|unique:m_user,username,' . $id . ',user_id',
                'nama' => 'required|max:100',
                'password' => 'nullable|min:5|max:20',
                'avatar' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048', // Avatar tidak wajib
            ];

            // Validator untuk validasi data yang dikirim
            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return response()->json([
                    'status' => false, // Respon JSON, true: berhasil, false: gagal
                    'message' => 'Validasi gagal.',
                    'msgField' => $validator->errors(), // Menunjukkan field mana yang error
                ]);
            }

            // Cari user berdasarkan ID
            $user = UserModel::find($id);
            if ($user) {
                // Jika password tidak diisi, hapus dari request agar tidak di-update
                if (!$request->filled('password')) {
                    $request->request->remove('password');
                }

                if (!$request->filled('avatar')) {
                    $request->request->remove('avatar');
                }

                // Cek jika ada file avatar yang diunggah
                if ($request->hasFile('avatar')) {
                    // Dapatkan file avatar
                    $file = $request->file('avatar');
                    // Buat nama unik untuk file avatar tersebut
                    $filename = 'profile_' . Auth::user()->user_id . '.' . $request->avatar->getClientOriginalExtension();
                    // Tentukan path penyimpanan
                    $path = public_path('gambar');
                    // Simpan file di direktori 'gambar'
                    $file->move($path, $filename);

                    // Simpan nama file avatar baru di database
                    $user->avatar = $filename;
                }

                // Update data user kecuali avatar (avatar sudah di-handle di atas)
                $user->update($request->except('avatar'));

                return response()->json([
                    'status' => true,
                    'message' => 'Data berhasil diupdate',
                ]);
            } else {
                return response()->json([
                    'status' => false,
                    'message' => 'Data tidak ditemukan',
                ]);
            }
        }
        return redirect('/');
    }

    // Menampilkan halaman form tambah_ajax user
    public function create_ajax() {
        $level = LevelModel::select('level_id', 'level_nama')->get();
        return view('user.create_ajax')->with('level', $level);
    }

    public function store_ajax(Request $request)
    {
        if ($request->ajax() || $request->wantsJson()) {
            $rules = [
                'level_id' => 'required|integer',
                'username' => 'required|string|min:3|unique:m_user,username',
                'nama' => 'required|string|max:100',
                'password' => 'required|min:5',
                'avatar' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
            ];

            // use iluminate/support/facades/validator
            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => 'Validasi Gagal',
                    'msgField' => $validator->errors(),
                ]);
            }

            $input = $request->all();
            $fileName = '';
            // Jika avatar ada, simpan gambar, jika tidak ada gunakan default
            if ($request->hasFile('avatar')) {
                $fileName = 'profile_' . $input['username'] . '.' . $request->avatar->getClientOriginalExtension();

                // Check if an existing profile picture exists and delete it
                $oldFile = 'gambar/' . $fileName;
                if (Storage::disk('public')->exists($oldFile)) {
                    Storage::disk('public')->delete($oldFile);
                }

                $request->avatar->move(public_path('gambar'), $fileName);
            } else {
                $fileName = 'profil-pic.png'; // default avatar
            }

            UserModel::create([
                'level_id' => $input['level_id'],
                'username' => $input['username'],
                'nama' => $input['nama'],
                'avatar' => $fileName, // Simpan nama file gambar
                'password' => bcrypt($input['password']),
            ]);

            return response()->json([
                'status' => true,
                'message' => 'Data User berhasil disimpan',
            ]);

        }

        redirect('/');
    }
    public function confirm_ajax($id)
    {
        $user = UserModel::find($id);
        return view('user.confirm_ajax',['user'=>$user]);
    }

    public function delete_ajax($id){
        $userRes = UserModel::destroy($id);
        
        if($userRes) {
            return response()->json([
'status' => true,
'message'=> "Data User berhasil dihapus"
            ]);
        }


        redirect('/');
    }

    public function import()
    {
        return view('user.import');
    }
    public function import_ajax(Request $request)
    {
        if ($request->ajax() || $request->wantsJson()) {
            $rules = [
                // validasi file harus xls atau xlsx, max 1MB
                'file_user' => ['required', 'mimes:xlsx', 'max:1024']
            ];
            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => 'Validasi Gagal',
                    'msgField' => $validator->errors()
                ]);
            }
            $file = $request->file('file_user'); // ambil file dari request
            $reader = IOFactory::createReader('Xlsx'); // load reader file excel
            $reader->setReadDataOnly(true); // hanya membaca data
            $spreadsheet = $reader->load($file->getRealPath()); // load file excel
            $sheet = $spreadsheet->getActiveSheet(); // ambil sheet yang aktif
            $data = $sheet->toArray(null, false, true, true); // ambil data excel
            $insert = [];
            if (count($data) > 1) { // jika data lebih dari 1 baris
                foreach ($data as $baris => $value) {
                    if ($baris > 1) { // baris ke 1 adalah header, maka lewati
                        $insert[] = [
                            'level_id' => $value['A'],
                            'username' => $value['B'],
                            'nama' => $value['C'],
                            'password' => Hash::make($value['D']),
                            'created_at' => now(),
                        ];
                    }
                }
                if (count($insert) > 0) {
                    // insert data ke database, jika data sudah ada, maka diabaikan
                    UserModel::insertOrIgnore($insert);
                }
                return response()->json([
                    'status' => true,
                    'message' => 'Data berhasil diimport'
                ]);
            } else {
                return response()->json([
                    'status' => false,
                    'message' => 'Tidak ada data yang diimport'
                ]);
            }
        }
        return redirect('/');
    }

    public function export_excel()
    {
        $user = usermodel::select('level_id', 'username', 'nama', 'password')
            ->orderBy('level_id')
            ->with('level')
            ->get();
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet(); //ambil sheet yang aktif
        // Set Header Kolom
        $sheet->setCellValue('A1', 'No');
        $sheet->setCellValue('B1', 'username');
        $sheet->setCellValue('C1', 'nama');
        $sheet->setCellValue('D1', 'password');
        $sheet->setCellValue('F1', 'level');
        // Buat header menjadi bold
        $sheet->getStyle('A1:F1')->getFont()->setBold(true);
        $no = 1; // Nomor data dimulai dari 1
        $baris = 2; // Baris data dimulai dari baris ke-2
        foreach ($user as $key => $value) {
            $sheet->setCellValue('A' . $baris, $no);
            $sheet->setCellValue('B' . $baris, $value->username);
            $sheet->setCellValue('C' . $baris, $value->nama);
            $sheet->setCellValue('D' . $baris, $value->password);
            $sheet->setCellValue('E' . $baris, $value->level->level_nama);
            $baris++;
            $no++;
        }
        // Set ukuran kolom otomatis untuk semua kolom
        foreach (range('A', 'F') as $columnID) {
            $sheet->getColumnDimension($columnID)->setAutoSize(true);
        }
        // Set judul sheet
        $sheet->setTitle('Data user');
        // Buat writer
        $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
        $filename = 'Data user ' . date('Y-m-d H:i:s') . '.xlsx';
        // Atur Header untuk Download File Excel
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="' . $filename . '"');
        header('Cache-Control: max-age=0');
        header('Cache-Control: max-age=1');
        header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
        header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT');
        header('Cache-Control: cache, must-revalidate');
        header('Pragma: public');
        // Simpan file dan kirim ke output
        $writer->save('php://output');
        exit;
    }

    public function export_pdf(){
        $user = usermodel::select('level_id','username','nama')
        ->orderBy('level_id')
        ->with('level')->get();
        $pdf = Pdf::loadView('user.export_pdf',['user'=>$user]);
        $pdf->setPaper('a4','portrait'); //set ukuran kertas dan orientasi
        $pdf->setOption("isRemoteEnabled", true); //set true jika ada gambar
        $pdf->render();
        return $pdf->stream('Data user '.date('Y-m-d H:i:s').'.pdf');
    }
}