<!--================ Home Banner Area =================-->
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
   <div class="carousel-inner">
      <?php $no = 0; ?>
      <?php foreach ($featured as $f) : ?>
         <?php $no++;  ?>
         <div class="carousel-item <?php if ($no <= 1) {
                                       echo "active";
                                    } ?> ">
            <div class="row align-items-center my-5">
               <div class="col-lg-8">
                  <img class="img-fluid mb-4 mb-lg-6 " src="<?= base_url("images/posting/$f->photo") ?>" alt="">
               </div>
               <div class="col-lg-4">
                  <div class="container">
                     <div class="date text-center">
                        <a class="genric-btn success circle small" href="<?= base_url("blog/category/$f->slug") ?>"><?= $f->category_name ?></a>
                        <a href="<?= base_url("blog/read/$f->seo_title") ?>"><i class="fa fa-calendar" aria-hidden="true"></i><?= mediumdate_indo($f->date) ?></a>
                     </div>
                     <h1 class="font-weight-light text-center"><?= $f->title ?></h1>
                     <p><?= character_limiter($f->content, 200) ?></p>
                     <div class="row">
                        <div class="col text-center">
                           <a href="<?= base_url("blog/read/$f->seo_title") ?>" class="genric-btn danger circle arrow">Read More<span class="lnr lnr-arrow-right"></span></a>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      <?php endforeach ?>
   </div>
   <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
   </a>
   <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
   </a>
</div>
<!--================ End Home Banner Area =================-->

<!--==================== Most Popular =====================-->
<section class="Most_pop mt-4 bg-light">
   <div class="container ">
      <div class="main_title2">
         <h2>Most Popular News</h2>
      </div>
      <div class="row choice_inner">
         <?php foreach ($popular as $c) : ?>
            <div class="col-lg-3">
               <div class="choice_item">
                  <img class="img-fluid choice" src="<?= base_url("images/posting/small/$c->photo") ?>" alt="">
                  <div class="choice_text">
                     <div class="date">
                        <a class="gad_btn" href="<?= base_url("blog/category/$c->slug") ?>"><?= $c->category_name ?></a>
                        <a href="<?= base_url("blog/read/$c->seo_title") ?>" class="float-right">
                           <i class="fa fa-calendar" aria-hidden="true"></i><?= mediumdate_indo($c->date) ?>
                        </a>
                     </div>
                     <a href="<?= base_url("blog/read/$c->seo_title") ?>">
                        <h4><?= character_limiter($c->title, 55) ?></h4>
                     </a>
                     <p><?= character_limiter($c->content, 70) ?></p>
                  </div>
               </div>
            </div>
         <?php endforeach ?>
      </div>
   </div>
</section>
<!--=============== End Most Popular ======================-->

<!--================ Choice Area =================-->
<section class="choice_area mt-4 bg-light">
   <div class="container ">
      <div class="main_title2">
         <h2>Editor's Choice</h2>
      </div>
      <div class="row choice_inner">
         <?php foreach ($choice as $c) : ?>
            <div class="col-lg-3">
               <div class="choice_item">
                  <img class="img-fluid choice" src="<?= base_url("images/posting/small/$c->photo") ?>" alt="">
                  <div class="choice_text">
                     <div class="date">
                        <a class="gad_btn" href="<?= base_url("blog/category/$c->slug") ?>"><?= $c->category_name ?></a>
                        <a href="<?= base_url("blog/read/$c->seo_title") ?>" class="float-right">
                           <i class="fa fa-calendar" aria-hidden="true"></i><?= mediumdate_indo($c->date) ?>
                        </a>
                     </div>
                     <a href="<?= base_url("blog/read/$c->seo_title") ?>">
                        <h4><?= $c->title ?></h4>
                     </a>
                     <p><?= character_limiter($c->content, 70) ?></p>
                  </div>
               </div>
            </div>
         <?php endforeach ?>
      </div>
   </div>
</section>
<!--================End Choice Area =================-->

<!--================News Area =================-->
<section class="news_area mt-4 bg-light">
   <div class="container">
      <div class="col-lg-15">
         <!-- Last News -->
         <div class="main_title2">
            <h2>Last News</h2>
         </div>
         <div class="latest_news">
            <?php foreach ($lastNews as $ln) : ?>
               <div class="media">
                  <div class="d-flex">
                     <img class="img-fluid" src="<?= base_url("images/posting/medium/$ln->photo") ?>" alt="">
                  </div>
                  <div class="media-body">
                     <div class="choice_text">
                        <div class="date">
                           <a class="gad_btn" href="<?= base_url("blog/category/$ln->slug") ?>"><?= $ln->category_name ?></a>
                           <a href="<?= base_url("blog/read/$ln->seo_title") ?>" class="float-right"><i class="fa fa-calendar" aria-hidden="true">
                              </i><?= mediumdate_indo($ln->date) ?>
                           </a>
                        </div>
                        <a href="<?= base_url("blog/read/$ln->seo_title") ?>">
                           <h4><?= $ln->title ?></h4>
                        </a>
                        <p><?= character_limiter($ln->content, 100) ?></p>
                     </div>
                  </div>
               </div>
            <?php endforeach ?>
         </div>
      </div>
      <div class="row mt-5">
         <div class="col text-center">
            <a href="<?= base_url('blog') ?>" class="genric-btn danger-border circle arrow">More View<span class="lnr lnr-arrow-right"></span></a>
         </div>
      </div>
   </div>
</section>
<!--================End News Area =================-->