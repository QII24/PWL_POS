<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request; // Perbaikan "lluminate" menjadi "Illuminate"
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function login()
    {
        // Jika user sudah login, maka redirect ke halaman utama
        if (Auth::check()) {
            return redirect('/');
        }

        return view('auth.login');
    }

    public function postlogin(Request $request)
    {
        // Memeriksa apakah permintaan adalah AJAX atau JSON
        if ($request->ajax() || $request->wantsJson()) { // Perbaikan "wants]son()" menjadi "wantsJson()"
            $credentials = $request->only('username', 'password');

            // Autentikasi user
            if (Auth::attempt($credentials)) {
                return response()->json([
                    'status' => true,
                    'message' => 'Login Berhasil',
                    'redirect' => url('/')
                ]);
            }

            return response()->json([
                'status' => false,
                'message' => 'Login Gagal'
            ]);
        }

        return redirect('login');
    }

    public function logout(Request $request)
    {
        // Melakukan logout
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect('login');
    }
}
