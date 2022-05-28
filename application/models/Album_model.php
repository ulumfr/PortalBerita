<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Album_model extends CI_Model {

   protected $table = 'album';

   public function getAlbum()
   {
      return $this->db->get($this->table)->result();
   }

   public function uploadImage()
   {
		$fileName = slugify($this->input->post('album_name', true));

      $config = [
        'upload_path'     => './images/album',
        'file_name'       => $fileName . '-' . round(microtime(true) * 10),
        'allowed_types'   => 'jpg|jpeg|gif|png|JPG|PNG',
        'max_size'        => '3000',
        'max_width'       => 0,
        'max_height'      => 0,
        'overwrite'       => true,
        'file_ext_tolower'=> true
      ];

      $this->load->library('upload', $config);

      if(!$this->upload->do_upload('photo')){
         $data['error_string'] = 'Upload error: '.$this->upload->display_errors('',''); 
         exit();
		}
		return $this->upload->data('file_name');
	}

   public function deleteImage($fileName){
      if(file_exists("./images/album/$fileName")){
         unlink("./images/album/$fileName");
      }
   }
}

/* End of file Album_model.php */
