<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class My_Model extends CI_Model {

   public function get_datatables_query()
   {
      if($this->tableJoin != ''){
         $this->db->select($this->select);
         $this->db->from($this->table);
         $this->db->join($this->tableJoin, $this->tableJoin . '.id = ' . $this->table . '.id_' . $this->tableJoin);
      }else{
         $this->db->from($this->table);
      }

      $i = 0;

      foreach($this->column_search as $item){
         if($_POST['search']['value']){
            if($i === 0){
               $this->db->group_start();
               $this->db->like($item, $_POST['search']['value']);
            }else{
               $this->db->or_like($item, $_POST['search']['value']);
            }

            if(count($this->column_search) - 1 === $i){
               $this->db->group_end();
            }
         }

         $i++;
      }

      if(isset($_POST['order'])){
         $this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
      }else if(isset($this->order)){
         $order = $this->order;
         $this->db->order_by(key($order), $order[key($order)]);
      }
   }

   public function get_datatables()
   {
      $this->get_datatables_query();
      
      if($_POST['length'] != -1){
         $this->db->limit($_POST['length'], $_POST['start']);
      }

      return $this->db->get()->result();
   }

   public function count_filtered()
   {
      $this->get_datatables_query();
      return $this->db->get()->num_rows();
   }

   public function count_all()
   {
      $this->db->from($this->table);
      return $this->db->count_all_results();
   }

   public function countRows($table)
   {
      return $this->db->get($table)->num_rows();
   }

   public function get_by_id($id)
   {
      $this->db->from($this->table);
      $this->db->where($this->id, $id);
      return $this->db->get()->row();
   }

   public function delete($id){
      $this->db->where($this->id, $id);
      $this->db->delete($this->table);
   }

   public function save($data){
      $this->db->insert($this->table, $data);
   }

   public function update($where, $data){
      $this->db->update($this->table, $data, $where);
      return $this->db->affected_rows();
   }   

}

/* End of file My_Model.php */
