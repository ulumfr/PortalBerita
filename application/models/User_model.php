<?php
defined('BASEPATH') or exit('No direct script access allowed');

class User_model extends CI_Model
{

    public function getUser()
    {
        return $this->db->get('user')->row();
    }
}

/* End of file Contact_model.php */
