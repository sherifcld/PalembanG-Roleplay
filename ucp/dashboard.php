<?php
session_start();
if (!isset($_SESSION['ucp_logged_in']) || $_SESSION['ucp_logged_in'] !== true) {
    header("Location: index.php");
    exit;
}

include 'config.php';

$user_id = $_SESSION['ucp_userid'];
$sql = "SELECT * FROM accounts WHERE pID = $user_id";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $user_data = $result->fetch_assoc();
} else {
    echo "Error fetching user data.";
    exit;
}

// Helper to format money
function formatMoney($amount) {
    return '$' . number_format($amount, 0, ',', '.');
}

// Helper for job name (basic mapping, extend as needed)
function getJobName($jobId) {
    $jobs = [
        0 => 'Unemployed',
        1 => 'Detective',
        2 => 'Lawyer',
        3 => 'Whore',
        4 => 'Drug Dealer',
        5 => 'Car Jacker',
        6 => 'News Reporter',
        7 => 'Trucker',
        8 => 'Bodyguard',
        9 => 'Arms Dealer',
        10 => 'Car Dealer',
        11 => 'Boxer',
        12 => 'Bus Driver',
        13 => 'Paper Boy',
        14 => 'Trucker',
        15 => 'Pizza Boy',
        16 => 'Farmer',
        17 => 'Garbage Man',
        18 => 'Street Sweeper',
        19 => 'Miner',
        20 => 'Product Dealer'
    ];
    return isset($jobs[$jobId]) ? $jobs[$jobId] : 'Unknown';
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - PalembanG Roleplay UCP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f4f6f9;
        }
        .sidebar {
            height: 100vh;
            background-color: #343a40;
            color: #fff;
            padding-top: 20px;
            position: fixed;
            width: 250px;
        }
        .sidebar a {
            color: #adb5bd;
            text-decoration: none;
            display: block;
            padding: 10px 20px;
            font-size: 16px;
        }
        .sidebar a:hover {
            color: #fff;
            background-color: #495057;
        }
        .sidebar .active {
            background-color: #0d6efd;
            color: white;
        }
        .main-content {
            margin-left: 250px;
            padding: 20px;
        }
        .stat-card {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            margin-bottom: 20px;
            border-left: 4px solid #0d6efd;
        }
        .stat-card h5 {
            color: #6c757d;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .stat-card h2 {
            font-size: 28px;
            font-weight: 700;
            color: #343a40;
        }
        .profile-header {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .profile-info h4 {
            margin: 0;
            color: #343a40;
        }
        .profile-info p {
            margin: 0;
            color: #6c757d;
        }
    </style>
</head>
<body>

<div class="sidebar">
    <div class="text-center mb-4">
        <h4>PalembanG RP</h4>
        <small>User Control Panel</small>
    </div>
    <a href="dashboard.php" class="active"><i class="fas fa-tachometer-alt me-2"></i> Dashboard</a>
    <a href="#"><i class="fas fa-user me-2"></i> Profile Settings</a>
    <a href="#"><i class="fas fa-cog me-2"></i> Account Settings</a>
    <a href="logout.php" class="mt-5"><i class="fas fa-sign-out-alt me-2"></i> Logout</a>
</div>

<div class="main-content">
    <div class="profile-header">
        <div class="profile-info">
            <h4>Welcome back, <?php echo htmlspecialchars($user_data['pName']); ?>!</h4>
            <p>Last login: <?php echo htmlspecialchars($user_data['pDataReg']); // Assuming pDataReg is registration date, maybe check pLogin/pIp for last login info if available ?></p>
        </div>
        <div class="profile-actions">
            <span class="badge bg-success">Online Status: <?php echo ($user_data['pOnline'] ? 'Online' : 'Offline'); ?></span>
        </div>
    </div>

    <div class="row">
        <div class="col-md-3">
            <div class="stat-card" style="border-left-color: #28a745;">
                <h5>Cash</h5>
                <h2><?php echo formatMoney($user_data['pCash']); ?></h2>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stat-card" style="border-left-color: #17a2b8;">
                <h5>Bank Balance</h5>
                <h2><?php echo formatMoney($user_data['pBank']); ?></h2>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stat-card" style="border-left-color: #ffc107;">
                <h5>Level</h5>
                <h2><?php echo $user_data['pLevel']; ?></h2>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stat-card" style="border-left-color: #dc3545;">
                <h5>VIP Status</h5>
                <h2><?php echo ($user_data['pVip'] > 0 ? 'VIP Level ' . $user_data['pVip'] : 'None'); ?></h2>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-white">
                    <h5 class="mb-0">Character Information</h5>
                </div>
                <div class="card-body">
                    <table class="table table-striped">
                        <tbody>
                            <tr>
                                <th scope="row">Job</th>
                                <td><?php echo getJobName($user_data['pJob']); ?></td>
                            </tr>
                            <tr>
                                <th scope="row">Organization/Family</th>
                                <td><?php echo ($user_data['pMember'] > 0 ? 'Member of Org ID ' . $user_data['pMember'] : 'Civilian'); ?></td>
                            </tr>
                            <tr>
                                <th scope="row">Phone Number</th>
                                <td><?php echo ($user_data['pNumber'] > 0 ? $user_data['pNumber'] : 'None'); ?></td>
                            </tr>
                            <tr>
                                <th scope="row">Warnings</th>
                                <td><?php echo $user_data['pWarn']; ?> / 3</td>
                            </tr>
                            <tr>
                                <th scope="row">Playing Hours</th>
                                <td><?php echo $user_data['pExp']; ?> Exp Points</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-header bg-white">
                    <h5 class="mb-0">Quick Actions</h5>
                </div>
                <div class="card-body">
                    <div class="d-grid gap-2">
                        <button class="btn btn-outline-primary" type="button">Change Password</button>
                        <button class="btn btn-outline-secondary" type="button">View Property</button>
                        <button class="btn btn-outline-secondary" type="button">View Vehicles</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
