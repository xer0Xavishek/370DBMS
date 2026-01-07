<?php
session_start();
include 'includes/db.php';

$where = "WHERE 1";
if (isset($_GET['search']) && !empty($_GET['search'])) {
    $search = $conn->real_escape_string($_GET['search']);
    $where .= " AND (s.title LIKE '%$search%' OR s.category LIKE '%$search%')";
}

// Match Location Logic
$user_city = "";
if (isset($_SESSION['user_id'])) {
    $uid = $_SESSION['user_id'];
    $u_query = $conn->query("SELECT city FROM user WHERE user_id = $uid");
    if($u_query->num_rows > 0) {
        $user_city = $u_query->fetch_assoc()['city'];
    }
}

// Join teaches -> user (teacher details) -> skill (skill details)
// Order By: Same City First, then Title
$sql = "SELECT t.*, u.first_name, u.last_name, u.city, s.title, s.category, s.difficulty_level, s.est_learning_time,
        (CASE WHEN u.city = '$user_city' AND '$user_city' != '' THEN 1 ELSE 0 END) as is_nearby
        FROM teaches t 
        JOIN user u ON t.teacher_id = u.user_id 
        JOIN skill s ON t.skill_id = s.skill_id 
        $where 
        ORDER BY is_nearby DESC, s.title ASC";

$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Browse Skills - SkillSwap</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<header>
    <div class="container">
        <nav>
            <a href="index.php" class="logo">SkillSwap</a>
            <div class="nav-links">
                <a href="index.php">Home</a>
                <?php if(isset($_SESSION['user_id'])): ?>
                    <a href="dashboard.php">Dashboard</a>
                    <a href="logout.php" class="btn btn-outline">Logout</a>
                <?php else: ?>
                    <a href="login.php">Login</a>
                <?php endif; ?>
            </div>
        </nav>
    </div>
</header>

<div class="container" style="padding: 40px 20px;">
    <h1 style="text-align: center; margin-bottom: 30px;">Find a Skill to Learn</h1>
    
    <form action="" method="GET" style="max-width: 600px; margin: 0 auto 50px; display: flex; gap: 10px;">
        <input type="text" name="search" placeholder="Search for 'Guitar', 'PHP', 'Cooking'..." value="<?php echo isset($_GET['search']) ? htmlspecialchars($_GET['search']) : ''; ?>">
        <button type="submit" class="btn btn-primary">Search</button>
    </form>

    <div class="grid-3">
        <?php if($result->num_rows > 0): ?>
            <?php while($row = $result->fetch_assoc()): ?>
                <div class="card">
                    <span class="badge badge-warning" style="float: right;"><?php echo $row['category']; ?></span>
                    <h3><?php echo $row['title']; ?></h3>
                    <p style="color: #666; font-size: 0.9rem; margin-bottom: 15px;">
                        Taught by <strong><?php echo $row['first_name'] . ' ' . $row['last_name']; ?></strong><br>
                        <small><?php echo $row['city']; ?> 
                        <?php if($row['is_nearby']): ?>
                            <span class="badge badge-success" style="font-size: 0.7rem; margin-left: 5px;">📍 Nearby</span>
                        <?php endif; ?>
                        </small>
                    </p>
                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px;">
                        <span class="badge badge-success"><?php echo $row['difficulty_level']; ?></span>
                        <span style="font-size: 0.9rem;">~<?php echo $row['est_learning_time']; ?> hrs</span>
                    </div>
                    
                    <?php if(isset($_SESSION['user_id']) && $_SESSION['user_id'] != $row['teacher_id']): ?>
                        <a href="book_session.php?teacher_id=<?php echo $row['teacher_id']; ?>&skill_id=<?php echo $row['skill_id']; ?>" class="btn btn-outline" style="width: 100%; text-align: center;">Request Session</a>
                    <?php elseif(!isset($_SESSION['user_id'])): ?>
                        <a href="login.php" class="btn btn-outline" style="width: 100%; text-align: center;">Login to Book</a>
                    <?php else: ?>
                         <button disabled class="btn btn-outline" style="width: 100%; border-color: #eee; color: #aaa;">Your Listing</button>
                    <?php endif; ?>
                </div>
            <?php endwhile; ?>
        <?php else: ?>
            <p style="grid-column: 1/-1; text-align: center;">No teaching offers found matching your criteria.</p>
        <?php endif; ?>
    </div>
</div>

</body>
</html>
