<nav class="Most_pop mt-4 bg-light">
   <div class="container">
      <div class="row choice_inner">
         <div class="col-lg-3">
                  <div class="main_title2">
                     <h2>Most Popular News</h2>
                  </div>
                  <div class="choice_item">
                     <img class="img-fluid" src="<?= base_url("images/posting/large/$popular->photo") ?>" alt="">
                     <div class="choice_text">
                        <div class="date">
                           <a class="gad_btn" href="<?= base_url("blog/category/$popular->slug") ?>"><?= $popular->category_name ?></a>
                           <a href="#" class="float-right"><i class="fa fa-calendar" aria-hidden="true"></i><?= mediumdate_indo($popular->date) ?></a>
                        </div>
                        <a href="<?= base_url("blog/read/$popular->seo_title") ?>"><h4><?= $popular->title ?></h4></a>
                        <p><?= character_limiter($popular->content, 70) ?></p>
                     </div>
                  </div>
               </div>
         </div>
      </div>
   </div>
</nav>