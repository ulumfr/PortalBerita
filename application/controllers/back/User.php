<?php
defined('BASEPATH') or exit('No direct script access allowed');

class User extends CI_Controller
{

    var $table = 'user';
    var $id = 'id';
    var $tableJoin = '';
    var $column_order = [];
    var $column_search = [];

    public function __construct()
    {
        parent::__construct();
        $this->load->model('my_model', 'my', true);
    }

    public function ajax_list()
    {
        $list = $this->my->get_datatables();
        $data = [];
        $no = $_POST['start'];

        foreach ($list as $li) {
            $no++;
            $row = [];
            $row[] = $no++;
            $row[] = $li->name;
            $row[] = $li->username;
            $row[] = $li->level;
            $row[] =
                '<a class="btn btn-sm btn-warning text-white" href="#" 
         title="Edit" onclick="edit_contact(' . "'" . $li->id . "'" . ')">
         <i class="fa fa-pencil-alt mr-1"></i> Edit</a>';
            $data[] = $row;
        }

        $output = [
            'draw'            => $_POST['draw'],
            'recordsTotal'    => $this->my->count_all(),
            'recordsFiltered' => $this->my->count_filtered(),
            'data'            => $data
        ];

        echo json_encode($output);
    }

    public function get_data()
    {
        $data = $this->my->get_by_id($this->input->post('id', true));
        echo json_encode($data);
    }

    public function update()
    {
        $this->form_validation->set_rules('contact_name', 'Contact', 'trim|required');
        $this->form_validation->set_rules('description', 'Description', 'required');

        if ($this->form_validation->run() != false) {
            $data = [
                'nama' => htmlspecialchars($this->input->post('nama', true)),
                'username' => htmlspecialchars($this->input->post('username', true)),
                'password' => password_hash($this->input->post('password1'), PASSWORD_DEFAULT),
                'level' => $this->input->post('level', true)
            ];

            $id = $this->input->post('id');
            $this->my->update([$this->id, $id], $data);
            echo json_encode(['status' => TRUE]);
        }
    }
}

/* End of file Contact.php */
