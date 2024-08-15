<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Con_Auth extends CI_Controller
{
    public function  __construct()
    {
        parent::__construct();
       $this->load->library('form_validation');
       // $this->load->helper('form');
    }

    public function index()
    {
        $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email');
        $this->form_validation->set_rules('password', 'Password', 'required|trim');
        
        if ($this->form_validation->run() == false) {
            $data['title'] = 'Login';

            $this->load->view('templates/auth_header', $data);
            $this->load->view('auth/login');
            $this->load->view('templates/auth_footer');
        }
        else{
            $this->_login();
        }
    }

    private function _login(){

        $email=$this->input->post('email');
        $password=$this->input->post('password');

        $user = $this->db->get_where('users',['email' => $email])->row_array();
      


        if($user != null){
            //cek user sudah aktivasi atau tidak
            if ($user['email_status'] == 1) {

                //cek password sama dengan database
                if (password_verify($password, $user['password'])) {
                    //set data session
                    $data = 
                    [   
                        'nama' => $user['nama'],
                        'email' => $user['email'],
                        'role' => $user['role']
                    ];
                    $this->session->set_userdata($data);
                    //end set data session
                    
                    //alihkan ke kontroler user atau view user
                    redirect('Con_User');
                }else {
                    $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert"> Password Salah!</div>');
                    redirect('Con_Auth');
                }
                
            }else {
                $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert"> Email tersebut belum di Aktifkan. Silakan cek inbox email !</div>');
            redirect('Con_Auth');
            }

        }
        else{
            $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert"> Email tersebut belum terdaftar !</div>');
            redirect('Con_Auth');
        }
        
    }

    public function registration()
    {
        $this->form_validation->set_rules('name', 'Name', 'required|trim');
        $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email|is_unique[users.email]',["is_unique" => "Email sudah pernah didaftarkan. Silakan Login !"]);

        $this->form_validation->set_rules(
            'password1',
            'Password',
            'required|trim|min_length[8]|matches[password2]',
            [
                "matches" => "password dont match",
                "min_length" => "password too short"
            ]
        );

        $this->form_validation->set_rules('password2', 'Password', 'required|trim|matches[password1]');

        if ($this->form_validation->run() == false) {

            $data['title'] = 'Registration';
            $this->load->view('templates/auth_header', $data);
            $this->load->view('auth/registration');
            $this->load->view('templates/auth_footer');
        } 
        //proses tanpa upload
        // else {
        //     $data = [
        //         'name' => htmlspecialchars($this->input->post('name',true)),
        //         'email' => htmlspecialchars($this->input->post('email',true)),
        //         'image' => 'avatar_default.jpg',
        //         'password' => password_hash($this->input->post('password1'), PASSWORD_DEFAULT),
        //         'role_id' => 2,
        //         'is_active' => 1,
        //         'date_created' => time()
        //     ];

        //     $this->db->insert('user', $data);
        //     $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"> Akun Berhasil Dibuat!. Silakan Login!</div>');
        //     redirect('index.php/Con_Auth');
        //     //echo "User Berhasil di Daftarkan";
        // }

        else{

        // proses dengan upload photo
                $config['upload_path']          = './assets/images/avatar';
                $config['allowed_types']        = 'gif|jpg|png|jpeg|JPG|PNG|JPEG';
                $config['max_size']             = 2048;
                $config['max_width']            = 10000;
                $config['max_height']           = 10000;

                $this->load->library('upload', $config);

                if ( !$this->upload->do_upload('userfile'))
                {
                       echo "Gagal Upload Gambar";
                       $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert"> Gagal Upload Gambar !!!</div>');
                    redirect('Con_Auth/registration');
                }
                else
                {
                    $gambar = $this->upload->data();
                    $gambar=$gambar['file_name'];
                    $name = htmlspecialchars($this->input->post('name',true));
                    $email = htmlspecialchars($this->input->post('email',true));
                    $password = password_hash($this->input->post('password1'), PASSWORD_DEFAULT);
                    $masjid_id = 3;
                    $login_session_key = "";
                    $email_status = "1";
                    $password_expired_date = "";
                    $password_reset_key ="";
                    $role = $this->input->post('role');

                    /////////

                    $data = [
                    'nama' => $name,
                    'email' => $email,
                    'password' => $password,
                    'masjid_id'=> $masjid_id,
                    'foto'=>$gambar,
                    'login_session_key'=> NULL,
                    'email_status' => $email_status,
                    'password_expire_date'=>NULL,
                    'password_reset_key' => NULL,
                    'role'=>$role
                       // $data = array('upload_data' => $this->upload->data());
                    ];


                    $this->db->insert('users', $data);

                    $error = $this->db->error(); // Akan mengembalikan array
                    if (!empty($error['code'])) {
                        // Jika ada error, tampilkan errornya
                       echo "Error Code: " . $error['code'];
                       echo "<br>Error Message: " . $error['message'];
                        die;
                    }

                                     

                    
                    //$this->db->insert('users', $data);
                    // echo "<pre>";
                    // // var_dump($data);
                    // // die;

                    // echo "Query yang dijalankan: " . $this->db->last_query();
                    // echo "<br>Data yang di-insert: ";
                    // print_r($data);
                    // die;

                    $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"> Akun Berhasil Dibuat!. Silakan Login!</div>');
                    redirect('Con_Auth');

                }
            }
    }
    
    
    public function logout(){
        $this->session->unset_userdata('email');
        $this->session->unset_userdata('role');
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"> Berhasil Logout!</div>');
        redirect('Con_Auth');

    }
}
