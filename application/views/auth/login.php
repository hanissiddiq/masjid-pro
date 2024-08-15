<?php echo $this->session->flashdata('message'); ?>
<form action="<?= base_url('Con_Auth'); ?>" method="post">

    <label for="email">E-mail</label>
    <input type="email" name="email" value="<?= set_value('email'); ?>">
    <?= form_error('email', '<small class="text-danger" style="color:red;">', '</small>'); ?>
    <br>
    <label for="password">Password</label>
    <input type="password" name="password" placeholder="minimal 8 karakter">
    <?= form_error('password1', '<small class="text-danger" style="color:red;">', '</small>'); ?>
    <br>
    <button>LOGIN</button>
</form>
<p>You Don't Have Account ? <a href="<?= base_url('Con_Auth/registration'); ?>">Klik Here to REGISTER</a> </p>