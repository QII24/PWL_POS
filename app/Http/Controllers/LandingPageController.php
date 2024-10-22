<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class LandingPageController extends Controller
{
    public function index()
    {
        return view('landing.index'); // Pastikan untuk menyesuaikan nama tampilan sesuai dengan file Anda
    }
}