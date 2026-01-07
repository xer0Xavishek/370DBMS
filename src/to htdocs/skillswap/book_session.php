<?php
session_start();
include 'includes/auth_check.php'; //  user is logged in???
include 'includes/db.php';// db connection file

if (!isset($_GET['teacher_id']) || !isset($_GET['skill_id'])) {  //url params check 
    header("Location: skills.php"); //go back to skills page if t id and s id isnull
    exit();
}

$teacher_id = intval($_GET['teacher_id']);
$skill_id = intval($_GET['skill_id']);
$learner_id = $_SESSION['user_id']; //current logged in user is learner

// Get details
$sql = "SELECT u.first_name, u.last_name, s.title, s.est_learning_time 
        FROM user u, skill s 
        WHERE u.user_id = $teacher_id AND s.skill_id = $skill_id"; //join user and skill table to get teacher name and skill title
$info = $conn->query($sql)->fetch_assoc(); //fetch the query result as associative array(string keys) 

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $scheduled_time = $_POST['scheduled_time']; //from form input
    $duration = intval($_POST['duration']);
    
    // GENERATE SESSION_NO MANUALLY (Composite Key Logic)
    // Find the current max session_no for this teacher
    $max_query = $conn->query("SELECT MAX(session_no) as max_no FROM session WHERE teacher_id = $teacher_id");
    $row = $max_query->fetch_assoc();
    $next_session_no = ($row['max_no'] ?? 0) + 1; //increment session no by 1
    
    $stmt = $conn->prepare("INSERT INTO session (teacher_id, learner_id, session_no, skill_id, scheduled_time, duration_hours, status) VALUES (?, ?, ?, ?, ?, ?, 'pending')");
    $stmt->bind_param("iiiisi", $teacher_id, $learner_id, $next_session_no, $skill_id, $scheduled_time, $duration);
    
    if ($stmt->execute()) {
        // Send Message to Teacher 
        $msg_content = " New Request: I would like to learn **" . $info['title'] . "** on " . $scheduled_time;
        // ins into message table
        $msg_stmt = $conn->prepare("INSERT INTO message (sender_id, receiver_id, content, timestamp, session_teacher_id, session_learner_id, session_no) VALUES (?, ?, ?, NOW(), ?, ?, ?)");
        $msg_stmt->bind_param("iisiii", $learner_id, $teacher_id, $msg_content, $teacher_id, $learner_id, $next_session_no);
        $msg_stmt->execute();
        
        header("Location: dashboard.php?msg=RequestSent");
        exit();
    } else {
        $error = "Failed to book session: " . $conn->error;
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Book Session - SkillSwap</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body style="display:flex; justify-content:center; align-items:center; min-height:100vh;">

<div class="card" style="width: 100%; max-width: 500px;">
    <h2>Confirm Request</h2>
    <p>Skill: <strong><?php echo $info['title']; ?></strong></p>
    <p>Teacher: <strong><?php echo $info['first_name'] . ' ' . $info['last_name']; ?></strong></p>
    
    <form method="POST" action="" style="margin-top: 20px;">
        <div class="form-group">
            <label>Proposed Date & Time</label>
            <input type="datetime-local" name="scheduled_time" required>
        </div>
        
        <div class="form-group">
            <label>Duration (Hours)</label>
            <input type="number" name="duration" value="<?php echo $info['est_learning_time'] ? $info['est_learning_time'] : 1; ?>" min="1" max="5">
        </div>
        
        <button type="submit" class="btn btn-primary" style="width: 100%;">Send Request</button>
        <a href="skills.php" class="btn btn-outline" style="width: 100%; text-align: center; margin-top: 10px; display:block;">Cancel</a>
    </form>
</div>

</body>
</html>
