@extends('layouts.template')

@section('content')
                <div class="card card-outline card-primary">
                    <div class="card-header">
                        <h3 class="card-title">{{ $page->title }}</h3>
                    </div>
                    <div class="card-body">
                        @empty($kategori)
                            <div class="alert alert-danger alert-dismissible">
                                <h5><i class="icon fas fa-ban"></i> Kesalahan!</h5>
                                Data yang Anda cari tidak ditemukan.
                            </div>
                        @else
                        <div class="d-flex align-items-start"> <!-- Menggunakan d-flex untuk layout -->
                            <div>
                                <div class="d-flex mb-6"> <!-- Menggunakan d-flex untuk membuat baris ID dan Nama -->
                                    <div class="me-4"> <!-- Menambahkan margin ke kanan -->
                                        <label>ID Kategori</label>
                                        <div class="border rounded p-3" style="min-width: 200px;">{{ $kategori->kategori_id }}</div>

                                    </div>
                                    <div>
                                        <label>Nama Kategori</label>
                                        <div class="border rounded p-3" style="min-width: 200px;">{{ $kategori->kategori_nama }}</div>
                                    </div>
                                </div>
                                <div class="d-flex mb-6"> <!-- Menggunakan d-flex untuk membuat baris Level dan Username -->
                                    <div class="me-4"> <!-- Menambahkan margin ke kanan -->
                                        <label>Kategori Kode</label>
                                        <div class="border rounded p-3" style="min-width: 200px;">{{ $kategori->kategori_kode }}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        @endempty
                        <a href="{{ url('kategori') }}" class="btn btn-sm btn-info">Kembali</a> <!-- Menambahkan margin atas pada tombol -->
                    </div>
                </div>

@endsection

@push('css')
<style>
    /* Optional custom styles */
    .img-circle {
        border: 3px solid #ddd; /* Add border to the avatar */
        box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1); /* Add shadow for better visual effect */
        margin-right: 40px;
    }

    .list-group-item {
        display: flex;
        justify-content: space-between; /* Align items properly */
    }

    .card {
        margin-left: 20px;
        margin-right: 20px;
        padding: 5px; /* Menambahkan padding pada card */
    }

    .me-4{
        margin-right: 40px;
        margin-bottom: 40px;
    }

    h3 {
        margin-bottom: 0.5rem; /* Menambahkan jarak bawah pada nama pengguna */
    }

    p {
        margin-bottom: 0.5rem; /* Menambahkan jarak bawah pada deskripsi pengguna */
    }
</style>
@endpush

@push('js')

@endpush