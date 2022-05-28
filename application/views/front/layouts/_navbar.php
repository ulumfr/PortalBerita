<?php
$this->load->model('category_model', 'category', true);
$navbar   = $this->category->getCategory();

$category = $this->uri->segment(3);
?>

<header class="mt-0 pt-0">
   <div class="bg-cover clearfix pt-3">
      <h2 class="logo">Shahala</h2>
      <input type="text" id="nav-search" class="nav-search mx-auto" name="" class="form-control">
      <div class="ml-0 mr-0 pb-1">
         <nav class="navbar navbar-expand-md">

            <button class="navbar-toggler ml-auto" data-target="#my-nav" data-toggle="collapse" aria-controls="my-nav" aria-expanded="false" onclick="myFunction(this)" aria-label="Toggle navigation">
               <span class="bar1"></span> <span class="bar2"></span> <span class="bar3"></span>
            </button>
            <div id="my-nav" class="collapse navbar-collapse">
               <ul class="navbar-nav mx-auto">
                  <?php foreach ($navbar as $n) : ?>
                     <li class="nav-item <?php if ($n->slug === $category) {
                                             echo "active";
                                          } ?> ">
                        <a class="nav-link" href="<?= base_url("blog/category/$n->slug") ?>"><?= $n->category_name ?></a>
                     </li>
                  <?php endforeach ?>

               </ul>
            </div>
         </nav>
      </div>
   </div>