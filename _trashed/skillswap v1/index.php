<?php session_start(); ?>
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

<footer style="background: var(--dark); color: white; padding: 50px 0; margin-top: auto;">
    <div class="container" style="text-align: center;">
        <p>&copy; 2025 SkillSwap. Created by Avishek & Sreema.</p>
    </div>
</footer>

</body>
</html>
