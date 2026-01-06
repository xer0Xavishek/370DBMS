<?php
include 'includes/auth_check.php';
include 'includes/db.php';

if (!isset($_GET['teacher_id']) || !isset($_GET['session_no'])) {
    header("Location: dashboard.php");
    exit();
}

$teacher_id = intval($_GET['teacher_id']);
$session_no = intval($_GET['session_no']);
$session_label = "#" . $teacher_id . "-" . $session_no; // Visual ID
$msg = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $reporter_id = $_SESSION['user_id'];
    $description = $conn->real_escape_string($_POST['description']);
    
    // Insert Report (COMPOSITE FK)
    $sql = "INSERT INTO report (session_teacher_id, session_no, reporter_user_id, description, status, created_at) 
            VALUES ($teacher_id, $session_no, $reporter_id, '$description', 'open', NOW())";
    
    if ($conn->query($sql)) {
        $msg = "Report submitted successfully. Admins will review it.";
    } else {
        $msg = "Error submitting report: " . $conn->error;
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Report Issue - SkillSwap</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body style="display:flex; justify-content:center; align-items:center; min-height:100vh;">

<div class="card" style="width: 100%; max-width: 500px;">
    <h2 style="color: var(--danger);">Report an Issue</h2>
    <?php if($msg): ?>
        <p style="background: #ffebee; color: #c62828; padding: 10px; border-radius: 5px; margin-bottom: 20px;"><?php echo $msg; ?></p>
        <a href="dashboard.php" class="btn btn-outline" style="width: 100%; text-align: center;">Return to Dashboard</a>
    <?php else: ?>
        <p>Please describe the issue with Session <?php echo $session_label; ?>.</p>
        <form method="POST" action="">
            <div class="form-group">
                <label>Description</label>
                <textarea name="description" rows="5" required placeholder="Describe what went wrong..."></textarea>
            </div>
            <button type="submit" class="btn btn-primary" style="background: var(--danger); border: none; width: 100%;">Submit Report</button>
            <a href="dashboard.php" class="btn btn-outline" style="width: 100%; text-align: center; margin-top: 10px; display:block;">Cancel</a>
        </form>
    <?php endif; ?>
</div>

</body>
</html>
