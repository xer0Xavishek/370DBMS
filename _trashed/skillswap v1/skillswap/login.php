<?php
session_start();
include 'includes/db.php';

$error = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = $conn->real_escape_string($_POST['email']);
    $password = $_POST['password']; 

    $sql = "SELECT user_id, first_name, role, is_suspended FROM user WHERE email = '$email' AND password = '$password'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();
        
        // Suspended Check
        if ($user['is_suspended'] == 1) {
            $error = "Your account has been suspended due to multiple warnings. Contact admin.";
        } else {
            $_SESSION['user_id'] = $user['user_id'];
            $_SESSION['role'] = $user['role'];
            $_SESSION['name'] = $user['first_name'];
            
            if($user['role'] == 'admin') {
                header("Location: admin_dashboard.php");
            } else {
                header("Location: dashboard.php");
            }
            exit();
        }
    } else {
        $error = "Invalid email or password!";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - SkillSwap</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body style="display:flex; justify-content:center; align-items:center; min-height:100vh;">

<div class="card" style="width: 100%; max-width: 400px;">
    <h2 style="text-align:center; color: var(--primary);">Welcome Back</h2>
    
    <?php if($error): ?>
        <p style="color: red; text-align: center; margin-bottom: 10px;"><?php echo $error; ?></p>
    <?php endif; ?>

    <form method="POST" action="">
        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" required>
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" required>
        </div>

        <button type="submit" class="btn btn-primary" style="width: 100%;">Login</button>
    </form>
    <p style="text-align:center; margin-top:15px;">
        New to SkillSwap? <a href="register.php">Create valid account</a>
    </p>

</div>

</body>
</html>
