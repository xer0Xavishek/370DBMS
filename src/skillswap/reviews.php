<?php
include 'includes/auth_check.php';
include 'includes/db.php';

$user_id = $_SESSION['user_id'];

// Fetch reviews where I am the teacher
// Joining based on COMPOSITE FK (teacher_id, session_no)
$reviews = $conn->query("
    SELECT r.*, u.first_name, u.last_name, s.title as skill_title
    FROM review r
    JOIN user u ON r.learner_id = u.user_id
    JOIN session ses ON (r.session_no = ses.session_no AND r.teacher_id = ses.teacher_id)
    LEFT JOIN skill s ON ses.skill_id = s.skill_id
    WHERE r.teacher_id = $user_id
    ORDER BY r.created_at DESC
");

// Calculate Stats
$avg_rating = $conn->query("SELECT AVG(rating) as avg_rate, COUNT(*) as total FROM review WHERE teacher_id = $user_id")->fetch_assoc();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Reviews - SkillSwap</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<header>
    <div class="container">
        <nav>
            <a href="index.php" class="logo">SkillSwap</a>
            <div class="nav-links">
                <a href="dashboard.php">Dashboard</a>
                <a href="profile.php">Profile</a>
                <a href="logout.php" class="btn btn-outline">Logout</a>
            </div>
        </nav>
    </div>
</header>

<div class="container" style="margin-top: 40px;">
    <div style="text-align: center; margin-bottom: 40px;">
        <h1>My Reputation</h1>
        <div style="font-size: 3rem; font-weight: bold; color: #f1c40f;">
            <?php echo number_format($avg_rating['avg_rate'], 1); ?> <span style="font-size: 1rem; color: #666;">/ 5.0</span>
        </div>
        <p>Based on <?php echo $avg_rating['total']; ?> reviews</p>
    </div>

    <div class="grid-2">
        <?php if($reviews && $reviews->num_rows > 0): ?>
            <?php while($r = $reviews->fetch_assoc()): ?>
                <div class="card">
                    <div style="display: flex; justify-content: space-between; margin-bottom: 10px;">
                        <span style="font-weight: bold;"><?php echo $r['first_name'] . ' ' . $r['last_name']; ?></span>
                        <span style="color: #f1c40f; font-weight: bold;">★ <?php echo $r['rating']; ?></span>
                    </div>
                    <span class="badge badge-success" style="margin-bottom: 10px; display:inline-block;"><?php echo $r['skill_title']; ?></span>
                    <p style="font-style: italic; color: #555;">"<?php echo $r['comment']; ?>"</p>
                    <small style="display: block; margin-top: 15px; color: #999;"><?php echo date('M d, Y', strtotime($r['created_at'])); ?></small>
                </div>
            <?php endwhile; ?>
        <?php else: ?>
            <div class="card" style="grid-column: 1/-1; text-align: center;">
                <p>No reviews yet. Teach more sessions to earn reputation!</p>
            </div>
        <?php endif; ?>
    </div>
</div>

</body>
</html>
