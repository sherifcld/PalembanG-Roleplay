<?php
session_start();
include 'config.php';
include 'functions.php';

$error = '';
$success = '';

if (isset($_SESSION['ucp_logged_in']) && $_SESSION['ucp_logged_in'] === true) {
    header("Location: dashboard.php");
    exit;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = cleanInput($_POST['username']);
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];
    $email = cleanInput($_POST['email']);

    if (empty($username) || empty($password) || empty($confirm_password) || empty($email)) {
        $error = "Mohon isi semua bidang.";
    } elseif ($password !== $confirm_password) {
        $error = "Konfirmasi kata sandi tidak cocok.";
    } elseif (strlen($password) < 6) {
        $error = "Kata sandi harus minimal 6 karakter.";
    } else {
        // Check if username already exists
        $sql = "SELECT * FROM accounts WHERE pName = '$username' LIMIT 1";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $error = "Nama pengguna sudah terdaftar.";
        } else {
            // Generate salt (5 chars as per GM.pwn pass_salt length 6)
            $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
            $salt = '';
            for ($i = 0; $i < 5; $i++) {
                $salt .= $characters[rand(0, strlen($characters) - 1)];
            }

            $hashed_password = hashit($salt, $password);
            $ip = $_SERVER['REMOTE_ADDR'];
            $date = date("Y.m.d");

            // Default values
            $referal = 0;
            $sex = 1; // Default male
            $skin = 29; // Default skin

            $sql = "INSERT INTO `accounts` 
                    (`pName`, `pPassword`, `pass_salt`, `pMail`, `pDataReg`, `pIpReg`, `pIp`, `pOnline`, `pReferal`, `pSex`, `pSkin`, `pLogin`) 
                    VALUES ('$username', '$hashed_password', '$salt', '$email', '$date', '$ip', '$ip', '$date', $referal, $sex, $skin, 0)";

            if ($conn->query($sql) === TRUE) {
                $success = "Pendaftaran berhasil! Silakan login.";
            } else {
                $error = "Kesalahan saat mendaftar: " . $conn->error;
            }
        }
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PalembanG Roleplay - UCP Registrasi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #e9ecef;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-container {
            max-width: 450px;
            width: 100%;
        }
        .card {
            border: none;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .card-header {
            background-color: #fff;
            border-bottom: 1px solid #f0f0f0;
            padding: 1.5rem 1rem;
            text-align: center;
        }
        .card-header h4 {
            margin: 0;
            color: #333;
            font-weight: 600;
        }
        .card-body {
            padding: 2rem;
        }
        .form-control {
            padding: 0.75rem;
            border-radius: 4px;
            border: 1px solid #ced4da;
        }
        .form-control:focus {
            box-shadow: 0 0 0 0.2rem rgba(13, 110, 253, 0.15);
        }
        .btn-primary {
            width: 100%;
            padding: 0.75rem;
            font-weight: 600;
            border-radius: 4px;
            background-color: #0d6efd;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0b5ed7;
        }
        .alert {
            font-size: 0.9rem;
            border-radius: 4px;
        }
        .footer-text {
            text-align: center;
            margin-top: 1.5rem;
            font-size: 0.85rem;
            color: #6c757d;
        }
        .footer-text a {
            color: #0d6efd;
            text-decoration: none;
        }
    </style>
</head>
<body>

<div class="login-container">
    <div class="card">
        <div class="card-header">
            <h4>Buat Akun UCP</h4>
        </div>
        <div class="card-body">
            <?php if ($error): ?>
                <div class="alert alert-danger"><?php echo $error; ?></div>
            <?php endif; ?>
            <?php if ($success): ?>
                <div class="alert alert-success"><?php echo $success; ?></div>
            <?php endif; ?>

            <form action="" method="POST">
                <div class="mb-3">
                    <label class="form-label">Nama Pengguna (UCP)</label>
                    <input type="text" name="username" class="form-control" placeholder="Masukkan nama pengguna" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" placeholder="Masukkan alamat email" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Kata Sandi</label>
                    <input type="password" name="password" class="form-control" placeholder="Masukkan kata sandi" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Konfirmasi Kata Sandi</label>
                    <input type="password" name="confirm_password" class="form-control" placeholder="Ulangi kata sandi" required>
                </div>
                <button type="submit" class="btn btn-primary">Daftar Sekarang</button>
            </form>
            <div class="footer-text">
                Sudah punya akun? <a href="index.php">Login di sini</a>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>