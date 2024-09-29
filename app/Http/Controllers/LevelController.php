<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LevelController extends Controller
{
    public function index()
    {
        // Mengambil semua data level dari tabel m_level
        $data = DB::table('m_level')->get();

        // Mengembalikan tampilan dengan data level yang diambil
        return view('level', ['data' => $data]);
    }

    // Jika Anda ingin menambahkan fungsi lain seperti create, update, delete, Anda dapat melakukannya di sini
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'level_kode' => 'required|string|max:255',
            'level_nama' => 'required|string|max:255',
        ]);

        DB::table('m_level')->insert([
            'level_kode' => $validatedData['level_kode'],
            'level_nama' => $validatedData['level_nama'],
            'created_at' => now(),
        ]);

        return redirect()->route('level.index')->with('success', 'Data baru berhasil ditambahkan.');
    }

    public function update(Request $request, $kode)
    {
        $validatedData = $request->validate([
            'level_nama' => 'required|string|max:255',
        ]);

        $row = DB::table('m_level')
            ->where('level_kode', $kode)
            ->update(['level_nama' => $validatedData['level_nama']]);

        return redirect()->route('level.index')->with('success', 'Data berhasil diperbarui. Jumlah data yang diupdate: ' . $row . ' baris.');
    }

    public function destroy($kode)
    {
        $row = DB::table('m_level')->where('level_kode', $kode)->delete();

        return redirect()->route('level.index')->with('success', 'Data berhasil dihapus. Jumlah data yang dihapus: ' . $row . ' baris.');
    }
}
