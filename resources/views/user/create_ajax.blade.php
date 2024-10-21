<form action="{{ url('user/ajax') }}" method="POST" id="form-tambah" enctype="multipart/form-data"> <!-- Tambahkan enctype untuk form upload -->
    @csrf
    <div id="modal-master" class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Tambah Data User</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="level_id">Level Pengguna</label>
                    <select name="level_id" id="level_id" class="form-control" required>
                        <option value="">- Pilih Level -</option>
                        @foreach($level as $l)
                            <option value="{{ $l->level_id }}">{{ $l->level_nama }}</option>
                        @endforeach
                    </select>
                    <small id="error-level_id" class="error-text text-danger"></small>
                </div>
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" name="username" id="username" class="form-control" required>
                    <small id="error-username" class="error-text text-danger"></small>
                </div>
                <div class="form-group">
                    <label for="nama">Nama</label>
                    <input type="text" name="nama" id="nama" class="form-control" required>
                    <small id="error-nama" class="error-text text-danger"></small>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" class="form-control" required>
                    <small id="error-password" class="error-text text-danger"></small>
                </div>
                <div class="form-group">
                    <label for="avatar">Pilih Foto Profil</label>
                    <input type="file" name="avatar" id="avatar" class="form-control">
                    <small id="error-avatar" class="error-text text-danger"></small>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn btn-warning">Batal</button>
                <button type="submit" class="btn btn-primary">Simpan</button>
            </div>
        </div>
    </div>
</form>

<script>
    $(document).ready(function() {
        $("#form-tambah").validate({
            rules: {
                level_id: {
                    required: true,
                    number: true
                },
                username: {
                    required: true,
                    minlength: 3,
                    maxlength: 20
                },
                nama: {
                    required: true,
                    minlength: 3,
                    maxlength: 100
                },
                password: {
                    required: true,
                    minlength: 6,
                    maxlength: 20
                },
                avatar: {
                    extension: "jpg|jpeg|png"
                }
            },
            messages: {  // Menambahkan pesan custom
                level_id: {
                    required: "Silakan pilih level pengguna.",
                    number: "Nilai level harus berupa angka."
                },
                username: {
                    required: "Username harus diisi.",
                    minlength: "Username minimal 3 karakter.",
                    maxlength: "Username maksimal 20 karakter."
                },
                nama: {
                    required: "Nama harus diisi.",
                    minlength: "Nama minimal 3 karakter.",
                    maxlength: "Nama maksimal 100 karakter."
                },
                password: {
                    required: "Password harus diisi.",
                    minlength: "Password minimal 6 karakter.",
                    maxlength: "Password maksimal 20 karakter."
                },
                avatar: {
                    extension: "Format file yang diizinkan: jpg, jpeg, png."
                }
            },
            submitHandler: function(form) {
                var formData = new FormData(form); // Gunakan FormData untuk file upload
                var file_avatar = $("#avatar").prop('files')[0]
                formData.append('avatar',file_avatar);

                $.ajax({
                    url: form.action,
                    type: form.method,
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function(response) {
                        if (response.status) {
                            $('#myModal').modal('hide');

                            // Menampilkan notifikasi berhasil
                            Swal.fire({
                                icon: 'success',
                                title: 'Berhasil',
                                text: response.message
                            }).then(function() {
                                if (typeof dataUser !== 'undefined') {
                                    dataUser.ajax.reload(); // Reload data table jika ada
                                } else {
                                    location.reload(); // Reload halaman jika tidak ada dataUser
                                }
                            });
                        } else {
                            // Menampilkan error dari validasi field
                            $('.error-text').text('');
                            $.each(response.msgField, function(prefix, val) {
                                $('#error-' + prefix).text(val[0]);
                            });

                            Swal.fire({
                                icon: 'error',
                                title: 'Terjadi Kesalahan',
                                text: response.message
                            });
                        }
                    }
                });
            },
            errorElement: 'span',
            errorPlacement: function(error, element) {
                error.addClass('invalid-feedback');
                element.closest('.form-group').append(error);
            },
            highlight: function(element, errorClass, validClass) {
                $(element).addClass('is-invalid');
            },
            unhighlight: function(element, errorClass, validClass) {
                $(element).removeClass('is-invalid');
            }
        });
    });
</script>
