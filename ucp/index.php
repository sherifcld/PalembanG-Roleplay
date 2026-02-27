<?php
session_start();
include 'config.php';
include 'functions.php';

$error = '';

if (isset($_SESSION['ucp_logged_in']) && $_SESSION['ucp_logged_in'] === true) {
    header("Location: dashboard.php");
    exit;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = cleanInput($_POST['username']);
    $password = $_POST['password'];

    if (empty($username) || empty($password)) {
        $error = "Mohon isi semua bidang.";
    } else {
        $sql = "SELECT * FROM accounts WHERE pName = '$username' LIMIT 1";
        $result = $conn->query($sql);

        if ($result->num_rows == 1) {
            $row = $result->fetch_assoc();
            $salt = $row['pass_salt'];
            $db_password = $row['pPassword'];

            $hashed_password = hashit($salt, $password);

            if ($hashed_password === $db_password) {
                $_SESSION['ucp_logged_in'] = true;
                $_SESSION['ucp_username'] = $row['pName'];
                $_SESSION['ucp_userid'] = $row['pID'];
                header("Location: dashboard.php");
                exit;
            } else {
                $error = "Kata sandi salah.";
            }
        } else {
            $error = "Pengguna tidak ditemukan.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PalembanG Roleplay - UCP Login</title>
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
            max-width: 400px;
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
        .forgot-password {
            text-align: right;
            margin-bottom: 1rem;
        }
        .forgot-password a {
            color: #6c757d;
            text-decoration: none;
            font-size: 0.9rem;
        }
        .forgot-password a:hover {
            color: #0d6efd;
        }
        .footer-text {
            text-align: center;
            margin-top: 1.5rem;
            color: #6c757d;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

<div class="login-container">
    <div class="card">
        <div class="card-header">
            <h4>PalembanG:UCP - Log Masuk</h4>
        </div>
        <div class="card-body">
            <?php if($error): ?>
                <div class="alert alert-danger py-2 text-center" role="alert">
                    <small><?php echo $error; ?></small>
                </div>
            <?php endif; ?>

            <form method="POST" action="">
                <div class="mb-3">
                    <label for="username" class="form-label text-muted small fw-bold">NAMA PENGGUNA</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label text-muted small fw-bold">KATA SANDI</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                
                <div class="forgot-password">
                    <a href="#">Lupa nama pengguna?</a>
                </div>

                <button type="submit" class="btn btn-primary">Login ke UCP</button>
            </form>
            <div class="footer-text">
                Belum punya akun? <a href="register.php">Daftar sekarang</a>
            </div>
        </div>
    </div>
    <div class="footer-text">
        &copy; 2025 PalembanG Roleplay. All rights reserved.
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
