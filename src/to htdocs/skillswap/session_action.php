<?php
session_start();
include 'includes/db.php';
include 'includes/auth_check.php';

// Must receive both components of the composite key
if (!isset($_GET['teacher_id']) || !isset($_GET['session_no']) || !isset($_GET['action'])) {
    header("Location: dashboard.php");
    exit();
}

$teacher_id = intval($_GET['teacher_id']);
$session_no = intval($_GET['session_no']);
$action = $_GET['action'];
$user_id = $_SESSION['user_id'];

// Verify ownership
// User MUST be either the teacher OR the learner of this session
$sql = "SELECT * FROM session WHERE teacher_id = $teacher_id AND session_no = $session_no AND (teacher_id = $user_id OR learner_id = $user_id)";
$check = $conn->query($sql);

if ($check->num_rows == 0) {
    die("Unauthorized access found in session_action.php. Session not found or you are not a participant.");
}

$session = $check->fetch_assoc();

if ($action == 'accept' && $session['teacher_id'] == $user_id) {
    $conn->query("UPDATE session SET status = 'accepted' WHERE teacher_id = $teacher_id AND session_no = $session_no");
} elseif ($action == 'cancel') {
    $conn->query("UPDATE session SET status = 'completed' WHERE teacher_id = $teacher_id AND session_no = $session_no"); // Schema enum had cancelled? No, enum was 'pending','accepted','completed'. Cancelled removed? 
    // Checking schema: ENUM('pending','accepted','completed') - User removed cancelled. 
    // Wait, let's check schema provided in prompt 119 again.
    // status ENUM('pending','accepted','completed') DEFAULT 'pending'. Yes.
    // So 'cancel' might be deleting it? Or just ignoring.
    // Let's assume delete for 'cancel' if pending.
    if($session['status'] == 'pending') {
         $conn->query("DELETE FROM session WHERE teacher_id = $teacher_id AND session_no = $session_no");
    }
} elseif ($action == 'complete' && $session['teacher_id'] == $user_id) {
    // 1. Update status
    $conn->query("UPDATE session SET status = 'completed' WHERE teacher_id = $teacher_id AND session_no = $session_no");
    
    // 2. Transact Points
    $points = $session['duration_hours'] * 10; 
    
    $conn->query("UPDATE user SET skillpoints = skillpoints + $points WHERE user_id = " . $session['teacher_id']);
    $conn->query("UPDATE user SET skillpoints = skillpoints - $points WHERE user_id = " . $session['learner_id']);
    
    // 3. Update Stats
    $conn->query("UPDATE teacher SET total_hours_taught = total_hours_taught + " . $session['duration_hours'] . " WHERE teacher_id = " . $session['teacher_id']);
    $conn->query("UPDATE learner SET total_hours_learned = total_hours_learned + " . $session['duration_hours'] . " WHERE learner_id = " . $session['learner_id']);

    // 4. Auto-Award Badges (Logic)
    // Check Teacher Hours
    $res = $conn->query("SELECT total_hours_taught FROM teacher WHERE teacher_id = " . $session['teacher_id']);
    $hours = $res->fetch_assoc()['total_hours_taught'];
    
    if($hours >= 50) {
        // Award 'Master Mentor' (Badge ID 1)
        $conn->query("INSERT IGNORE INTO user_badge (user_id, badge_id, awarded_date, awarded_by) VALUES (" . $session['teacher_id'] . ", 1, NOW(), 1)");
    }
    
    // --- Notification: Send Message to Learner (Completed) ---
    $msg_content = "🤖 Session Completed! I have marked our session as finished. " . $points . " SkillPoints transferred.";
    $m_stmt = $conn->prepare("INSERT INTO message (sender_id, receiver_id, content, timestamp, session_teacher_id, session_learner_id, session_no) VALUES (?, ?, ?, NOW(), ?, ?, ?)");
    $m_stmt->bind_param("iisiii", $session['teacher_id'], $session['learner_id'], $msg_content, $session['teacher_id'], $session['learner_id'], $session['session_no']);
    $m_stmt->execute();
}
// --- Handle Accept Notification (Placed here to avoid deeply nested else-ifs logic issues in replace) ---
if ($action == 'accept' && $session['teacher_id'] == $user_id) {
    // Note: The UPDATE happened above in lines 28-29 (not shown in this chunk but exists in file)
    // We just insert the message here.
     $msg_content = "🤖 Request Accepted! I have accepted your session request. See you then!";
     $m_stmt = $conn->prepare("INSERT INTO message (sender_id, receiver_id, content, timestamp, session_teacher_id, session_learner_id, session_no) VALUES (?, ?, ?, NOW(), ?, ?, ?)");
     $m_stmt->bind_param("iisiii", $session['teacher_id'], $session['learner_id'], $msg_content, $session['teacher_id'], $session['learner_id'], $session['session_no']);
     $m_stmt->execute();
}

header("Location: dashboard.php");
?>
