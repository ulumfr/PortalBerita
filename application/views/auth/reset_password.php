<?php $this->load->view('auth/templates/header') ?>

	<main class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
					<h5 class="card-title text-center"><?= lang('reset_password_heading');?></h5>

					<!-- Alert -->
					<div class="row">
						<div class="col">
							<?php if($this->session->flashdata('message')) : ?>
								<div class="alert alert-warning alert-dismissible fade show text-center" role="alert">
								<?= $this->session->flashdata('message') ?>
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
											<span aria-hidden="true">&times;</span>
									</button>   
								</div>
							<?php endif ?>
						</div>
					</div>

					<?= form_open('auth/reset_password/' . $code, ['class' => 'form-signin']) ?>
						<div class="form-label-group">
							<input type="password" name="new" value="" class="form-control" id="new_password" placeholder="New Password" required autofocus>  
							<label for="new_password">New Password</label>
							<small class="text-danger">min length is 8 character</small>
						</div>

						<div class="form-label-group">
							<input type="password" name="new_confirm" id="new_password_confirm" value="" class="form-control" placeholder="New Password Confirmation" required>
							<label for="new_password_confirm">New Password Confirmation</label>
						</div>

						<?php echo form_input($user_id);?>
						<?php echo form_hidden($csrf); ?>

						<button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit"><?= lang('reset_password_submit_btn') ?></button>
						
					<?= form_close() ?>
					</div>
				</div>
			</div>
		</div>
  </main>
  
<?php $this->load->view('auth/templates/footer') ?>
