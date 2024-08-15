<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>

<body>
<?php echo $this->session->flashdata('message'); ?>
    <!-- <form action="<?php // echo base_url('index.php/Con_Auth/registration'); ?>" method="post"> -->
    <?php// echo form_open_multipart('index.php/Con_Auth/registration');?> 
    <form action="<?php // echo base_url('index.php/Con_Auth/registration'); ?>" method="post" enctype="multipart/form-data">
        <label for="name">Name</label>
        <input type="text" name="name" value="<?= set_value('name'); ?>">

        <?= form_error('name', '<small class="text-danger" style="color:red;">', '</small>'); ?>

        <br>
        <label for="email">E-mail</label>
        <input type="email" name="email" value="<?= set_value('email'); ?>">
        <?= form_error('email', '<small class="text-danger" style="color:red;">', '</small>'); ?>

        <br>
        <label for="password">Password</label>
        <input type="password" name="password1" placeholder="Password Minimal 8 Karakter">
        <?= form_error('password1', '<small class="text-danger" style="color:red;">', '</small>'); ?>
        <br>
        <label for="password">Confirm Password</label>
        <input type="password" name="password2">
        <br>
        <label for="role">Role</label>
        <select name="role" id="role">
            <option value="admin">Admin</option>
            <option value="admin-masjid">Admin Masjid</option>
            <option value="user">User</option>
        </select>
        <br>
        <label for="userfile">Foto</label>
        <input type="file" name="userfile" size="20" required="">
        <br>
        <button type="submit" value="upload">REGISTER</button>
        
        <p>You Have Account ? <a href="<?= base_url('Con_Auth'); ?>">Klik Here to LOGIN</a> </p>
    </form>
</body>

</html>