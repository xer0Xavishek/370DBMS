<?php 
session_start(); 
include 'includes/db.php';

// --- Feature: Community Leaderboard ---
$top_teachers = $conn->query("
    SELECT u.first_name, u.last_name, t.total_hours_taught 
    FROM teacher t 
    JOIN user u ON t.teacher_id = u.user_id 
    ORDER BY t.total_hours_taught DESC 
    LIMIT 3
");

// --- Feature: City Pulse (Trending Skills) ---
$city_name = "Dhaka"; // Default hub
if(isset($_SESSION['user_id'])) {
    $uid = $_SESSION['user_id'];
    $u_res = $conn->query("SELECT city FROM user WHERE user_id = $uid");
    if($u_res && $u_res->num_rows > 0) {
        $c_row = $u_res->fetch_assoc();
        if(!empty($c_row['city'])) {
            $city_name = $c_row['city'];
        }
    }
}

$trending_skills = $conn->query("
    SELECT s.title, COUNT(ss.session_no) as popularity 
    FROM session ss 
    JOIN teacher t ON ss.teacher_id = t.teacher_id 
    JOIN user u ON t.teacher_id = u.user_id 
    JOIN skill s ON ss.skill_id = s.skill_id 
    WHERE u.city = '$city_name' 
    GROUP BY s.title 
    ORDER BY popularity DESC 
    LIMIT 5
");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SkillSwap - Barter Your Skills</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<!-- Setup Notice -->
<?php if(isset($_GET['setup']) && $_GET['setup'] == 'success'): ?>
<div style="background: #d4edda; color: #155724; padding: 10px; text-align: center;">
    Database Setup Completed Successfully! You can now Login.
</div>
<?php endif; ?>

<header>
    <div class="container">
        <nav>
            <a href="index.php" class="logo">SkillSwap</a>
            <div class="nav-links">
                <a href="index.php">Home</a>
                <a href="skills.php">Browse Skills</a>
                <?php if(isset($_SESSION['user_id'])): ?>
                    <a href="dashboard.php">Dashboard</a>
                    <a href="logout.php" class="btn btn-outline">Logout</a>
                <?php else: ?>
                    <a href="login.php">Login</a>
                    <a href="register.php" class="btn btn-primary">Get Started</a>
                <?php endif; ?>
            </div>
        </nav>
    </div>
</header>

<section class="hero" style="padding: 100px 0; text-align: center;">
    <div class="container">
        <h1 style="font-size: 3.5rem; margin-bottom: 20px;">Exchange Skills, <span style="color: var(--primary);">Not Money</span></h1>
        <p style="font-size: 1.2rem; color: #666; max-width: 600px; margin: 0 auto 40px;">
            Trade skills, not money. Teach what you love, learn what you dream. 
            Join a bartering community where <strong>knowledge is the only currency</strong>.
        </p>
        <div class="cta-buttons">
            <a href="register.php" class="btn btn-primary">Start Swapping</a>
            <a href="skills.php" class="btn btn-outline">Explore Skills</a>
        </div>
    </div>
</section>

<section class="features" style="padding: 80px 0; background: white;">
    <div class="container">
        <h2 style="text-align: center; margin-bottom: 50px;">How It Works</h2>
        <div class="grid-3">
            <div class="card" style="text-align: center;">
                <h3 style="color: var(--secondary);">1. Offer a Skill</h3>
                <p>List what you're good at. From <strong>Coding</strong> to <strong>Cooking</strong>.</p>
            </div>
            <div class="card" style="text-align: center;">
                <h3 style="color: var(--primary);">2. Earn Points</h3>
                <p>Teach others and earn <strong>SkillPoints</strong> for every hour you mentor.</p>
            </div>
            <div class="card" style="text-align: center;">
                <h3 style="color: var(--accent);">3. Learn for Free</h3>
                <p>Spend your points to learn something new from experts.</p>
            </div>
        </div>
    </div>
</section>

<!-- Community Leaderboard Section -->
<section class="leaderboard" style="padding: 60px 0; background: #f8f9fa;">
    <div class="container">
        <h2 style="text-align: center; margin-bottom: 40px; color: var(--primary);">🏆 Community Champions</h2>
        <div class="grid-3">
            <?php 
            $rank = 1;
            while($teacher = $top_teachers->fetch_assoc()): 
                $medal = "";
                if($rank == 1) $medal = "🥇";
                if($rank == 2) $medal = "🥈";
                if($rank == 3) $medal = "🥉";
            ?>
            <div class="card" style="text-align: center; padding: 30px; border: 2px solid transparent; transition: 0.3s; position: relative; overflow: hidden;">
                <?php if($rank==1): ?>
                    <div style="position: absolute; top:0; left:0; width: 100%; height: 5px; background: gold;"></div>
                <?php endif; ?>
                <div style="font-size: 3rem; margin-bottom: 10px;"><?php echo $medal; ?></div>
                <h3 style="margin-bottom: 5px;"><?php echo $teacher['first_name'] . ' ' . $teacher['last_name']; ?></h3>
                <p style="color: #666; font-size: 0.9rem;">Master Mentor</p>
                <div style="margin-top: 15px; font-weight: bold; color: var(--dark);">
                    <?php echo $teacher['total_hours_taught']; ?> Hours Taught
                </div>
            </div>
            <?php $rank++; endwhile; ?>
        </div>
    </div>
</section>

<!-- City Pulse Section -->
<section class="city-pulse" style="padding: 60px 0; background: white;">
    <div class="container" style="text-align: center;">
        <h2 style="margin-bottom: 20px;">🏙️ City Pulse: <span style="color: var(--secondary);"><?php echo htmlspecialchars($city_name); ?></span></h2>
        <p style="margin-bottom: 40px; color: #666;">What locals are learning right now.</p>
        
        <div style="display: flex; flex-wrap: wrap; justify-content: center; gap: 15px;">
            <?php if($trending_skills->num_rows > 0): ?>
                <?php while($skill = $trending_skills->fetch_assoc()): ?>
                    <a href="skills.php?search=<?php echo urlencode($skill['title']); ?>" 
                       style="display: inline-block; padding: 10px 25px; background: white; border: 2px solid var(--accent); color: var(--accent); border-radius: 50px; text-decoration: none; font-weight: 500; transition: 0.2s;">
                       🔥 <?php echo $skill['title']; ?>
                    </a>
                <?php endwhile; ?>
            <?php else: ?>
                <p>No trends yet in this city. <a href="skills.php">Be the first!</a></p>
            <?php endif; ?>
        </div>
    </div>
</section>

<footer style="background: var(--dark); color: white; padding: 50px 0; margin-top: auto;">
    <div class="container" style="text-align: center;">
        <p>&copy; 2025 SkillSwap. Created by Avishek & Sreema.</p>
    </div>
</footer>

</body>
</html>
