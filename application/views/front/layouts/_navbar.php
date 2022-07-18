<?php
$this->load->model('category_model', 'category', true);
$navbar   = $this->category->getCategory();

$category = $this->uri->segment(3);
?>

<nav class="navbar navbar-light navbar-expand-lg navbar-light fixed-top home" style="background-color: #FAD4D4">
   <div class="container">
      <a href="<?= base_url() ?>" class="navbar-brand d-flex w-50 mr-auto">
         <img src="<?= base_url('images/brand/red.png') ?>" alt="Logo">
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsingNavbar3">
          <span class="navbar-toggler-icon"></span>
      </button>
      <div class="navbar-collapse collapse w-100" id="collapsingNavbar3">
         <ul class="navbar-nav w-100 justify-content-center">
            <?php foreach($navbar as $n) : ?>
               <li class="nav-item <?php if($n->slug === $category ) { echo "active"; } ?> ">
                  <a class="nav-link" href="<?= base_url("blog/category/$n->slug") ?>"><?= $n->category_name ?></a>
               </li>
            <?php endforeach ?>
         </ul> 
         <ul class="nav navbar-nav ml-auto w-100 justify-content-end">
            <li class="nav-item">
               <a class="nav-link" href="https://www.twitter.com">
                  <i class="fab fa-twitter"></i>
               </a>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="https://www.instagram.com">
                  <i class="fab fa-instagram"></i>
               </a>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="https://www.facebook.com">
                  <i class="fab fa-facebook"></i>
               </a>
            </li>
      </div>
   </div>
</nav>