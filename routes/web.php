<?php

use App\Http\Controllers\KategoriController;
use App\Http\Controllers\LevelController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

// level
Route::get('/level', [LevelController::class, 'index']);
// kategori
Route::get('/kategori', [KategoriController::class, 'index']);
//user
Route::get('/user', [UserController::class, 'index']);

Route::get('/user/tambah', [UserController::class, 'tambah']);
Route::post('/user/tambah_simpan', [UserController::class, 'tambah_simpan']);

Route::get('/user/ubah/{id}', [UserController::class, 'ubah']);
Route::put('/user/ubah_simpan/{id}', [UserController::class, 'ubah_simpan']);
Route::get('/user/hapus/{id}', [UserController::class, 'hapus']);

use App\Http\Controllers\WelcomeController;


Route::group(['prefix' => 'user'], function () {
Route::get('/', [UserController::class, 'index']);
Route::post('/list', [UserController::class, 'list']);
// displays the user's home page
Route::get('/create', [UserController::class, 'create']);
// display user data in json format for datatables
Route::post('/', [UserController::class, 'store']);
// display the add user form page
Route::get('/{id}', [UserController::class, 'show']); 
Route::get('/{id}/edit', [UserController::class, 'edit']);
// save new user data
// display user details
Route::put('/{id}', [UserController::class, 'update']);
// display the user edit form page
Route::delete('/{id}', [UserController::class, 'destroy']);
// save user data changes
// delete user data
});


