<?php
include 'includes/auth_check.php';
include 'includes/db.php';

$user_id = $_SESSION['user_id'];
$msg = '';

// Handle Skill Addition
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['add_skill'])) {
    $title = $conn->real_escape_string($_POST['title']);
    $category = $_POST['category'];
    $level = $_POST['level'];
    $time = intval($_POST['time']);
    
    // 1. Insert into Skill table first (or check existing? For simplicity, adding new entry)
    $stmt = $conn->prepare("INSERT INTO skill (title, category, difficulty_level, est_learning_time) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("sssi", $title, $category, $level, $time);
    
    if($stmt->execute()) {
        $skill_id = $conn->insert_id;
        // 2. Link to Teacher
        $conn->query("INSERT INTO teaches (teacher_id, skill_id, proficiency_level) VALUES ($user_id, $skill_id, 'Expert')");
        $msg = "Skill added to your profile!";
    } else {
        $msg = "Error adding skill.";
    }
}

// Handle Profile Picture Upload
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_FILES['profile_pic'])) {
    $target_dir = "assets/uploads/profile_pics/";
    // Ensure dir exists
    if (!file_exists($target_dir)) { mkdir($target_dir, 0777, true); }
    
    $file_ext = strtolower(pathinfo($_FILES["profile_pic"]["name"], PATHINFO_EXTENSION));
    $new_filename = "user_" . $user_id . "_" . time() . "." . $file_ext;
    $target_file = $target_dir . $new_filename;
    
    $check = getimagesize($_FILES["profile_pic"]["tmp_name"]);
    if($check !== false) {
        if (move_uploaded_file($_FILES["profile_pic"]["tmp_name"], $target_file)) {
            $conn->query("UPDATE user SET profile_picture = '$new_filename' WHERE user_id = $user_id");
            $msg = "Profile picture updated!";
        } else {
            $msg = "Sorry, there was an error uploading your file.";
        }
    } else {
        $msg = "File is not an image.";
    }
}

// Handle Interest Addition (Learn)
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['add_interest'])) {
    $skill_id = intval($_POST['skill_id']);
    $interest = $_POST['interest_level'];
    
    // Check if already added
    $check = $conn->query("SELECT * FROM learns WHERE learner_id = $user_id AND skill_id = $skill_id");
    if ($check->num_rows == 0) {
        $conn->query("INSERT INTO learns (learner_id, skill_id, interest_level) VALUES ($user_id, $skill_id, '$interest')");
        $msg = "Added to your learning list!";
    } else {
        $msg = "You already have this in your list.";
    }
}


// Fetch User Info
$user = $conn->query("SELECT * FROM user WHERE user_id = $user_id")->fetch_assoc();
// Fetch Skills Taught
$my_skills = $conn->query("SELECT s.* FROM teaches t JOIN skill s ON t.skill_id = s.skill_id AND t.teacher_id = $user_id");
// Fetch Badges
$badges = $conn->query("SELECT b.* FROM user_badge ub JOIN badge b ON ub.badge_id = b.badge_id WHERE ub.user_id = $user_id");

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Profile - SkillSwap</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<header>
    <div class="container">
        <nav>
            <a href="index.php" class="logo">SkillSwap</a>
            <div class="nav-links">
                <a href="dashboard.php">Dashboard</a>
                <a href="logout.php" class="btn btn-outline">Logout</a>
            </div>
        </nav>
    </div>
</header>

<div class="container" style="margin-top: 40px; margin-bottom: 40px;">
    <?php if($msg): ?>
        <p style="background: #e1f5fe; color: #0277bd; padding: 10px; border-radius: 5px; margin-bottom: 20px;"><?php echo $msg; ?></p>
    <?php endif; ?>

    <div class="grid-2">
        <!-- Profile Info -->
        <div>
            <div class="card" style="text-align: center; margin-bottom: 20px;">
                <!-- Avatar Display -->
                <?php 
                    $pic_path = "assets/uploads/profile_pics/" . ($user['profile_picture'] ? $user['profile_picture'] : 'default.png');
                    if (!file_exists($pic_path)) { $pic_path = "assets/images/default_avatar.png"; } // Fallback
                    // Or actually, let's just use a simple check. If database says 'default.png', we assume it's a placeholder.
                    // Ideally we should have a real default image. I'll just use a style fallback if file missing.
                ?>
                <div style="width: 150px; height: 150px; margin: 0 auto 15px; border-radius: 50%; overflow: hidden; border: 3px solid var(--primary);">
                    <?php if($user['profile_picture'] && $user['profile_picture'] != 'default.png'): ?>
                        <img src="assets/uploads/profile_pics/<?php echo $user['profile_picture']; ?>" style="width: 100%; height: 100%; object-fit: cover;">
                    <?php else: ?>
                        <div style="width: 100%; height: 100%; background: #eee; display: flex; align-items: center; justify-content: center; font-size: 3rem; color: #ccc;">
                            <?php echo strtoupper(substr($user['first_name'], 0, 1)); ?>
                        </div>
                    <?php endif; ?>
                </div>
                
                <h2><?php echo $user['first_name'] . ' ' . $user['last_name']; ?></h2>
                <p><?php echo $user['city'] . ', ' . $user['country']; ?></p>

                <!-- Upload Form -->
                <form action="" method="POST" enctype="multipart/form-data" style="margin-top: 15px;">
                    <label style="cursor: pointer; color: var(--primary); font-size: 0.9rem; text-decoration: underline;">
                        Change Picture <input type="file" name="profile_pic" style="display: none;" onchange="this.form.submit()">
                    </label>
                </form>
                <div style="margin-top: 15px;">
                    <span class="badge badge-warning">SkillPoints: <?php echo $user['skillpoints']; ?></span>
                </div>
                <!-- Accessibility / Preferences -->
                <div style="margin-top: 20px; text-align: left; border-top: 1px solid #eee; padding-top: 15px;">
                    <h4 style="font-size: 0.9rem; color: #666;">Profile Details</h4>
                    <p><strong>Role:</strong> <?php echo ucfirst($user['role']); ?></p>
                    <p><strong>Language:</strong> <?php echo $user['preferred_language']; ?></p>
                </div>
            </div>

            <div class="card">
                <h3>My Badges</h3>
                <?php if($badges->num_rows > 0): ?>
                    <ul style="padding-left: 20px;">
                        <?php while($b = $badges->fetch_assoc()): ?>
                            <li style="margin-bottom: 5px;">🏅 <?php echo $b['badge_name']; ?></li>
                        <?php endwhile; ?>
                    </ul>
                <?php else: ?>
                    <p style="color: #666; font-size: 0.9rem;">No badges earned yet. Complete sessions to earn them!</p>
                <?php endif; ?>
            </div>
        </div>

        <!-- Skills Management -->
        <div>
            <div class="card" style="margin-bottom: 20px;">
                <h3>Skills I Teach</h3>
                <?php if($my_skills->num_rows > 0): ?>
                    <ul style="list-style: none; padding: 0;">
                        <?php while($s = $my_skills->fetch_assoc()): ?>
                            <li style="border-bottom: 1px solid #eee; padding: 10px 0; display: flex; justify-content: space-between;">
                                <span><?php echo $s['title']; ?> <small style="color: #999;">(<?php echo $s['category']; ?>)</small></span>
                                <span class="badge badge-success"><?php echo $s['difficulty_level']; ?></span>
                            </li>
                        <?php endwhile; ?>
                    </ul>
                <?php else: ?>
                    <p>You haven't listed any skills yet.</p>
                <?php endif; ?>
            </div>

            <div class="card">
                <h3>Add New Skill to Teach</h3>
                <form method="POST" action="">
                    <input type="hidden" name="add_skill" value="1">
                    <div class="form-group">
                        <label>Skill Title</label>
                        <input type="text" name="title" required placeholder="e.g., Advanced Excel">
                    </div>
                    <div class="grid-2">
                        <div class="form-group">
                            <label>Category</label>
                            <select name="category">
                                <option>Coding</option>
                                <option>Art</option>
                                <option>Music</option>
                                <option>Language</option>
                                <option>Life Skills</option>
                                <option>Other</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Level</label>
                            <select name="level">
                                <option>Beginner</option>
                                <option>Intermediate</option>
                                <option>Advanced</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Est. Learning Time (Hours)</label>
                        <input type="number" name="time" value="1" min="1">
                    </div>
                    <button type="submit" class="btn btn-primary" style="width: 100%;">Add Skill to Teach</button>
                </form>
            </div>
            
            <div class="card" style="margin-top: 20px;">
                <h3>Add Interest (To Learn)</h3>
                <form method="POST" action="">
                    <input type="hidden" name="add_interest" value="1">
                    <div class="form-group">
                        <label>Skill ID or Name</label>
                        <select name="skill_id" required>
                             <?php
                             $all_skills = $conn->query("SELECT * FROM skill ORDER BY title ASC");
                             while($ask = $all_skills->fetch_assoc()){
                                 echo "<option value='".$ask['skill_id']."'>".$ask['title']."</option>";
                             }
                             ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Interest Level</label>
                        <select name="interest_level">
                            <option>High</option>
                            <option>Medium</option>
                            <option>Low</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-outline" style="width: 100%;">Add to Learning List</button>
                </form>
            </div>

        </div>
    </div>
</div>

</body>
</html>
