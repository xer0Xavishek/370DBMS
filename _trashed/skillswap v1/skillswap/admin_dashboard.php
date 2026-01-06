<?php
session_start();
include 'includes/db.php';

// strict admin check
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'admin') {
    header("Location: login.php");
    exit();
}

// Handle Actions
if (isset($_GET['action'])) {
    $action = $_GET['action'];
    
    if ($action == 'warn_user' && isset($_GET['user_id'])) {
        $uid = intval($_GET['user_id']);
        $conn->query("UPDATE user SET warning_count = warning_count + 1 WHERE user_id = $uid");
        // Auto-suspend check
        $u = $conn->query("SELECT warning_count FROM user WHERE user_id = $uid")->fetch_assoc();
        if ($u['warning_count'] >= 3) {
            $conn->query("UPDATE user SET is_suspended = 1 WHERE user_id = $uid");
        }
        header("Location: admin_dashboard.php?msg=UserWarned");
        exit();
    }
    
    if ($action == 'suspend_user' && isset($_GET['user_id'])) {
        $uid = intval($_GET['user_id']);
        $conn->query("UPDATE user SET is_suspended = 1 WHERE user_id = $uid");
        header("Location: admin_dashboard.php?msg=UserSuspended");
        exit();
    }
    
    if ($action == 'resolve_report' && isset($_GET['report_id'])) {
        $rid = intval($_GET['report_id']);
        $resolution = isset($_GET['resolution']) ? $_GET['resolution'] : 'resolved';
        $admin_id = $_SESSION['user_id'];
        
        // Handle Logic before closing
        if ($resolution == 'Refunded') {
            // Fetch session info via report
            $rep = $conn->query("SELECT r.*, s.duration_hours, s.teacher_id, s.learner_id 
                                 FROM report r 
                                 JOIN session s ON r.session_teacher_id = s.teacher_id AND r.session_no = s.session_no 
                                 WHERE r.report_id = $rid")->fetch_assoc();
            
            if ($rep) {
                // Calculate original points (10 per hour)
                $points = $rep['duration_hours'] * 10;
                
                // Refund: Take from Teacher, Give to Learner
                $conn->query("UPDATE user SET skillpoints = skillpoints - $points WHERE user_id = " . $rep['session_teacher_id']);
                $conn->query("UPDATE user SET skillpoints = skillpoints + $points WHERE user_id = " . $rep['reporter_user_id']); // Assuming reporter is learner, usually safe for disputes
            }
        }
        
        $conn->query("UPDATE report SET status = 'closed', resolution_text = '$resolution', resolved_by_user_id = $admin_id, resolved_at = NOW() WHERE report_id = $rid");
        header("Location: admin_dashboard.php?msg=ReportClosed");
        exit();
    }
}

// Fetch Data
$stats = [
    'users' => $conn->query("SELECT COUNT(*) as c FROM user")->fetch_assoc()['c'],
    'sessions' => $conn->query("SELECT COUNT(*) as c FROM session")->fetch_assoc()['c'],
    'reports' => $conn->query("SELECT COUNT(*) as c FROM report WHERE status = 'open'")->fetch_assoc()['c']
];

$reports = $conn->query("SELECT r.*, u.first_name, u.last_name FROM report r JOIN user u ON r.reporter_user_id = u.user_id WHERE r.status = 'open'");
$users = $conn->query("SELECT * FROM user ORDER BY warning_count DESC LIMIT 10");

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - SkillSwap</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .admin-card { background: white; padding: 20px; border-radius: 10px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); }
        .danger-text { color: #e74c3c; font-weight: bold; }
        .btn-sm { padding: 5px 10px; font-size: 0.8rem; }
    </style>
</head>
<body style="background: #f4f6f8;">

<header style="background: #2c3e50;">
    <div class="container">
        <nav>
            <a href="index.php" class="logo" style="color:white;">SkillSwap Admin</a>
            <div class="nav-links">
                <a href="index.php" style="color:#bdc3c7;">Main Site</a>
                <a href="logout.php" style="color:#bdc3c7;">Logout</a>
            </div>
        </nav>
    </div>
</header>

<div class="container" style="margin-top: 40px;">
    <h1>Admin Control Panel</h1>
    
    <!-- Stats -->
    <div class="grid-3" style="margin-bottom: 30px;">
        <div class="admin-card">
            <h3>Total Users</h3>
            <p style="font-size: 2rem;"><?php echo $stats['users']; ?></p>
        </div>
        <div class="admin-card">
            <h3>Total Sessions</h3>
            <p style="font-size: 2rem;"><?php echo $stats['sessions']; ?></p>
        </div>
        <div class="admin-card">
            <h3 style="color: #e74c3c;">Open Reports</h3>
            <p style="font-size: 2rem;"><?php echo $stats['reports']; ?></p>
        </div>
    </div>

    <div class="grid-2">
        <!-- Dispute Resolution -->
        <div>
            <h2>🚨 Start Dispute Resolution</h2>
            <?php if($reports->num_rows > 0): ?>
                <?php while($r = $reports->fetch_assoc()): ?>
                    <div class="admin-card" style="margin-bottom: 15px; border-left: 5px solid #e74c3c;">
                        <h4>Report #<?php echo $r['report_id']; ?></h4>
                        <p><strong>Reporter:</strong> <?php echo $r['first_name'] . ' ' . $r['last_name']; ?></p>
                        <p><strong>Session:</strong> Teacher ID <?php echo $r['session_teacher_id']; ?> (Session #<?php echo $r['session_no']; ?>)</p>
                        <p style="background: #eee; padding: 10px; border-radius: 5px;">"<?php echo $r['description']; ?>"</p>
                        <div style="margin-top: 10px;">
                            <a href="admin_dashboard.php?action=resolve_report&report_id=<?php echo $r['report_id']; ?>&resolution=Dismissed" class="btn btn-outline btn-sm">Dismiss</a>
                            <a href="admin_dashboard.php?action=warn_user&user_id=<?php echo $r['session_teacher_id']; ?>" class="btn btn-primary btn-sm" style="background:#e67e22;">Warn Teacher</a>
                             <a href="admin_dashboard.php?action=resolve_report&report_id=<?php echo $r['report_id']; ?>&resolution=Refunded" class="btn btn-primary btn-sm">Refund & Close</a>
                        </div>
                    </div>
                <?php endwhile; ?>
            <?php else: ?>
                <div class="admin-card"><p>No open disputes.</p></div>
            <?php endif; ?>
        </div>

        <!-- User Management -->
        <div>
            <h2>👥 User Management (Top Risky)</h2>
            <div class="admin-card">
                <table style="width: 100%; border-collapse: collapse;">
                    <thead>
                        <tr style="text-align: left; border-bottom: 1px solid #eee;">
                            <th>User</th>
                            <th>Role</th>
                            <th>Warnings</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php while($u = $users->fetch_assoc()): ?>
                            <tr style="border-bottom: 1px solid #f9f9f9;">
                                <td style="padding: 10px 0;"><?php echo $u['first_name']; ?></td>
                                <td><?php echo $u['role']; ?></td>
                                <td style="color: #e74c3c; font-weight: bold;"><?php echo $u['warning_count']; ?></td>
                                <td>
                                    <?php echo $u['is_suspended'] ? '<span style="color:red;">Suspended</span>' : '<span style="color:green;">Active</span>'; ?>
                                </td>
                                <td>
                                    <?php if(!$u['is_suspended']): ?>
                                        <a href="admin_dashboard.php?action=suspend_user&user_id=<?php echo $u['user_id']; ?>" style="color: red; text-decoration: none;">Suspend</a>
                                    <?php endif; ?>
                                </td>
                            </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>
