<?php
include 'includes/auth_check.php';
include 'includes/db.php';

// Need both keys to identify session for review
if (!isset($_GET['teacher_id']) || !isset($_GET['session_no'])) {
    header("Location: dashboard.php");
    exit();
}

$teacher_id = intval($_GET['teacher_id']);
$session_no = intval($_GET['session_no']);
$learner_id = $_SESSION['user_id'];
$msg = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $rating = intval($_POST['rating']);
    $comment = $conn->real_escape_string($_POST['comment']);
    
    // Verify session
    $check = $conn->query("SELECT * FROM session WHERE teacher_id = $teacher_id AND session_no = $session_no AND learner_id = $learner_id AND status = 'completed'");
    
    if ($check->num_rows > 0) {
        // Insert Review (COMPOSITE FK)
        $sql = "INSERT INTO review (teacher_id, learner_id, session_no, rating, comment, created_at) 
                VALUES ($teacher_id, $learner_id, $session_no, $rating, '$comment', NOW())";
        
        if ($conn->query($sql)) {
            // Update Teacher Average
            $conn->query("UPDATE teacher SET average_rating = (SELECT AVG(rating) FROM review WHERE teacher_id = $teacher_id) WHERE teacher_id = $teacher_id");
            $msg = "Review submitted! Thank you.";
        } else {
            $msg = "Error submitting review: " . $conn->error;
        }
    } else {
        $msg = "Invalid session or not completed yet.";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Leave Review - SkillSwap</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body style="display:flex; justify-content:center; align-items:center; min-height:100vh;">

<div class="card" style="width: 100%; max-width: 500px;">
    <h2 style="text-align: center;">Rate your Session</h2>
    <?php if($msg): ?>
        <div style="text-align: center;">
            <p style="color: var(--success); margin-bottom: 20px; font-weight: bold;"><?php echo $msg; ?></p>
            <a href="dashboard.php" class="btn btn-primary">Back to Dashboard</a>
        </div>
    <?php else: ?>
        <form method="POST" action="">
            <div class="form-group" style="text-align: center;">
                <label>Rating (1-5)</label>
                <div style="font-size: 2rem; color: #f1c40f;">
                    <input type="number" name="rating" min="1" max="5" value="5" style="width: 60px; text-align: center;">
                </div>
            </div>

            <div class="form-group">
                <label>Comment</label>
                <textarea name="comment" rows="4" required placeholder="How was the teacher?"></textarea>
            </div>

            <button type="submit" class="btn btn-primary" style="width: 100%;">Submit Review</button>
        </form>
    <?php endif; ?>
</div>

</body>
</html>
