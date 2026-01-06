<?php
// auth_check.php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

// Optional: specific role check
function check_role($role) {
    if ($_SESSION['role'] !== $role) {
        // user does not have permission
        header("Location: dashboard.php");
        exit();
    }
}
?>
