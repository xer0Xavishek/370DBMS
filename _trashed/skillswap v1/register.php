<?php
session_start();
include 'includes/db.php';

$error = '';
$success = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $first_name = $conn->real_escape_string($_POST['first_name']);
    $last_name = $conn->real_escape_string($_POST['last_name']);
    $email = $conn->real_escape_string($_POST['email']);
    $password = $_POST['password']; // No hashing as requested
    $role = $_POST['role']; // 'user' or 'admin'
    $city = $conn->real_escape_string($_POST['city']);
    $country = $conn->real_escape_string($_POST['country']);
    
    // Check if email exists
    $check = $conn->query("SELECT user_id FROM user WHERE email = '$email'");
    if ($check->num_rows > 0) {
        $error = "Email already registered!";
    } else {
        // Insert into User table
        $sql = "INSERT INTO user (first_name, last_name, email, password, role, city, country) 
                VALUES ('$first_name', '$last_name', '$email', '$password', '$role', '$city', '$country')";
        
        if ($conn->query($sql) === TRUE) {
            $user_id = $conn->insert_id;
            
            // Initialize Teacher and Learner tables for this user (Since everyone can be both)
            $conn->query("INSERT INTO teacher (teacher_id) VALUES ($user_id)");
            $conn->query("INSERT INTO learner (learner_id) VALUES ($user_id)");
            
            $_SESSION['user_id'] = $user_id;
            $_SESSION['role'] = $role;
            $_SESSION['name'] = $first_name;
            
            header("Location: dashboard.php");
            exit();
        } else {
            $error = "Error: " . $conn->error;
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register - SkillSwap</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body style="display:flex; justify-content:center; align-items:center; min-height:100vh;">

<div class="card" style="width: 100%; max-width: 500px;">
    <h2 style="text-align:center; color: var(--primary);">Join SkillSwap</h2>
    
    <?php if($error): ?>
        <p style="color: red; text-align: center;"><?php echo $error; ?></p>
    <?php endif; ?>

    <form method="POST" action="">
        <div class="grid-2">
            <div class="form-group">
                <label>First Name</label>
                <input type="text" name="first_name" required>
            </div>
            <div class="form-group">
                <label>Last Name</label>
                <input type="text" name="last_name" required>
            </div>
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" required>
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" required>
        </div>

        <div class="grid-2">
            <div class="form-group">
                <label>City</label>
                <input type="text" name="city" required>
            </div>
            <div class="form-group">
                <label>Country</label>
                <input type="text" name="country" required value="Bangladesh">
            </div>
        </div>

        <div class="form-group">
            <label>I want to join as:</label>
            <select name="role">
                <option value="user">Regular User (Learner/Teacher)</option>
                <option value="admin">Administrator</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary" style="width: 100%;">Create Account</button>
    </form>
    <p style="text-align:center; margin-top:15px;">
        Already have an account? <a href="login.php">Login here</a>
    </p>
</div>

</body>
</html>
