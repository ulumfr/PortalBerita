<script type="text/javascript">
    let tableUser;

    $(document).ready(function() {
        tableUser = $('#tableUser').DataTable({
            processing: true,
            serverSide: true,
            order: [],
            ajax: {
                'url': "<?= base_url('back/user/ajax_list') ?>",
                'type': "POST"
            },
            columnDefs: [{
                'targets': [0, 1, 2, 3],
                'orderable': false,
            }],
        });
    });

    // Reload Table
    function reload_table() {
        tableUser.ajax.reload(null, false);
    }

    // Save Button Modal
    function save() {
        $('#btn_save').text('Saving...');
        $('#btn_save').attr('disabled', true);

        $.ajax({
            type: 'post',
            dataType: 'json',
            url: '<?= base_url('back/user/action') ?>',
            data: $('#form').serialize(),
            success: function(data) {
                if (data.status) {
                    $('#modalUser').modal('hide');
                    location.reload();
                }
                $('#btn_save').text('Simpan');
                $('#btn_save').attr('disabled', false);
            },
            error: function() {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Terjadi Suatu Kesalahan!',
                    showConfirmButton: true
                });
                $('#modalUser').modal('hide');
                $('#btn_save').text('Simpan');
                $('#btn_save').attr('disabled', false);
            }
        });
    }


    function add_user() {
        $('#form')[0].reset();
        $('.modal-title').text('Tambah User');
        $('#modalUser').modal('show');
    }

    //Edit  
    function edit_User(id) {
        $('#form')[0].reset();

        $.ajax({
            url: '<?= base_url('back/user/get_data/') ?>',
            data: {
                id: id
            },
            type: 'post',
            dataType: 'json',
            success: function(data) {
                $('[name="id"]').val(data.id);
                $('[name="nama"]').val(data.nama);
                $('[name="username"]').val(data.username);
                $('[name="password"]').val(data.password);
                $('[name="level"]').val(data.level);

                $('.modal-title').text('Edit User Access Website');
                $('#modalUser').modal('show');
            },
        });
    }

    // Save Button Modal
    function save() {
        $('#btn_save').text('Saving...');
        $('#btn_save').attr('disabled', true);

        $.ajax({
            type: 'post',
            dataType: 'json',
            url: '<?= base_url('back/user/update') ?>',
            data: $('#form').serialize(),
            success: function(data) {
                if (data.status) {
                    $('#modalUser').modal('hide');
                    Swal.fire({
                        icon: 'success',
                        title: 'Success',
                        showConfirmButton: true
                    });
                    tableUser.draw();
                }
                $('#btn_save').text('Simpan');
                $('#btn_save').attr('disabled', false);
            },
            error: function() {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Terjadi Suatu Kesalahan!',
                    showConfirmButton: true
                });
                $('#modalUser').modal('hide');
                $('#btn_save').text('Simpan');
                $('#btn_save').attr('disabled', false);
            }
        });
    }
</script>