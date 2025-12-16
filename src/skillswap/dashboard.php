<?php
include 'includes/auth_check.php';
include 'includes/db.php';

$user_id = $_SESSION['user_id'];
$user_name = $_SESSION['name'];
$role = $_SESSION['role'];

// take User Data
$user = $conn->query("SELECT * FROM user WHERE user_id = $user_id")->fetch_assoc();
$teacher = $conn->query("SELECT * FROM teacher WHERE teacher_id = $user_id")->fetch_assoc();
$learner = $conn->query("SELECT * FROM learner WHERE learner_id = $user_id")->fetch_assoc();

// take Active Sessions (As Learner)
// Need to join user (teacher info) and skill
$learning_sessions = $conn->query("
    SELECT s.*, u.first_name as teacher_name, sk.title as skill_title 
    FROM session s 
    JOIN user u ON s.teacher_id = u.user_id 
    JOIN skill sk ON s.skill_id = sk.skill_id
    WHERE s.learner_id = $user_id 
    ORDER BY s.scheduled_time DESC
");

// take Active Sessions (As Teacher)
$teaching_sessions = $conn->query("
    SELECT s.*, u.first_name as learner_name, sk.title as skill_title 
    FROM session s 
    JOIN user u ON s.learner_id = u.user_id 
    JOIN skill sk ON s.skill_id = sk.skill_id
    WHERE s.teacher_id = $user_id 
    ORDER BY s.scheduled_time DESC
");

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - SkillSwap</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<header>
    <div class="container">
        <nav>
            <a href="index.php" class="logo">SkillSwap</a>
            <div class="nav-links">
                <?php if($role == 'admin'): ?>
                    <a href="admin_dashboard.php" style="color: #e74c3c; font-weight: bold;">Admin Panel</a>
                <?php endif; ?>
                <a href="skills.php">Browse Skills</a>
                <a href="profile.php">My Profile</a>
                <a href="messages.php">Messages</a>
                <a href="reviews.php">My Reputation</a>
                <a href="logout.php" class="btn btn-outline">Logout</a>
            </div>
        </nav>
    </div>
</header>

<div class="container" style="margin-top: 40px;">
    <h1>Hello, <?php echo $user_name; ?>!</h1>
    
    <!-- Stats Row -->
    <div class="grid-4" style="margin-bottom: 40px;">
        <div class="card">
            <h3>SkillPoints</h3>
            <p style="font-size: 2rem; color: var(--primary); font-weight: bold;"><?php echo $user['skillpoints']; ?></p>
        </div>
        <div class="card">
            <h3>Hours Taught</h3>
            <p style="font-size: 2rem; color: var(--secondary); font-weight: bold;"><?php echo $teacher['total_hours_taught']; ?></p>
        </div>
        <div class="card">
            <h3>Hours Learned</h3>
            <p style="font-size: 2rem; color: var(--accent); font-weight: bold;"><?php echo $learner['total_hours_learned']; ?></p>
        </div>
        <div class="card">
            <h3>Rating</h3>
            <p style="font-size: 2rem; color: #f1c40f; font-weight: bold;"><?php echo $teacher['average_rating'] ? $teacher['average_rating'] : '0.0'; ?></p>
        </div>
    </div>

    <div class="grid-2">
        <!-- Teaching Requests -->
        <div>
            <h2>Teaching Requests</h2>
            <?php if($teaching_sessions->num_rows > 0): ?>
                <?php while($txn = $teaching_sessions->fetch_assoc()): ?>
                    <div class="card" style="margin-bottom: 20px;">
                        <h4>Teaching: <?php echo $txn['skill_title']; ?></h4>
                        <p>Student: <?php echo $txn['learner_name']; ?></p>
                        <p>Date: <?php echo $txn['scheduled_time']; ?></p>
                        <p>Status: <span class="badge badge-warning"><?php echo $txn['status']; ?></span></p>
                        <div style="margin-top: 10px;">
                            <?php if($txn['status'] == 'pending'): ?>
                                <a href="session_action.php?teacher_id=<?php echo $txn['teacher_id']; ?>&session_no=<?php echo $txn['session_no']; ?>&action=accept" class="btn btn-primary" style="padding: 5px 15px; font-size: 0.9rem;">Accept</a>
                                <a href="session_action.php?teacher_id=<?php echo $txn['teacher_id']; ?>&session_no=<?php echo $txn['session_no']; ?>&action=cancel" class="btn btn-outline" style="padding: 5px 15px; font-size: 0.9rem;">Decline</a>
                            <?php elseif($txn['status'] == 'accepted'): ?>
                                <a href="session_action.php?teacher_id=<?php echo $txn['teacher_id']; ?>&session_no=<?php echo $txn['session_no']; ?>&action=complete" class="btn btn-primary" style="padding: 5px 15px; font-size: 0.9rem;">Mark Completed</a>
                            <?php endif; ?>
                        </div>
                    </div>
                <?php endwhile; ?>
            <?php else: ?>
                <div class="card"><p>No active teaching requests.</p></div>
            <?php endif; ?>
        </div>

        <!-- Learning Schedule -->
        <div>
            <h2>My Classes</h2>
            <?php if($learning_sessions->num_rows > 0): ?>
                <?php while($txn = $learning_sessions->fetch_assoc()): ?>
                    <div class="card" style="margin-bottom: 20px;">
                        <h4>Learning: <?php echo $txn['skill_title']; ?></h4>
                        <p>Teacher: <?php echo $txn['teacher_name']; ?></p>
                        <p>Date: <?php echo $txn['scheduled_time']; ?></p>
                        <p>Status: <span class="badge badge-success"><?php echo $txn['status']; ?></span></p>
                        <div style="margin-top: 10px;">
                             <?php if($txn['status'] == 'completed'): ?>
                                <a href="leave_review.php?teacher_id=<?php echo $txn['teacher_id']; ?>&session_no=<?php echo $txn['session_no']; ?>" class="btn btn-outline" style="font-size: 0.8rem;">Rate Teacher</a>
                             <?php else: ?>
                                <a href="report.php?teacher_id=<?php echo $txn['teacher_id']; ?>&session_no=<?php echo $txn['session_no']; ?>" style="color: red; font-size: 0.8rem;">Report Issue</a>
                             <?php endif; ?>
                        </div>
                    </div>
                <?php endwhile; ?>
            <?php else: ?>
                <div class="card">
                    <p>You haven't booked any sessions yet.</p>
                    <a href="skills.php" class="btn btn-primary" style="margin-top: 10px;">Find a Teacher</a>
                </div>
            <?php endif; ?>
        </div>
    </div>
</div>

</body>
</html>
