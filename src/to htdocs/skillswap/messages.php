<?php
include 'includes/auth_check.php';
include 'includes/db.php';

$user_id = $_SESSION['user_id'];
$receiver_id = isset($_GET['to']) ? intval($_GET['to']) : 0; 

// Handle Sending
if ($_SERVER['REQUEST_METHOD'] == 'POST' && !empty($_POST['content'])) {
    $content = $conn->real_escape_string($_POST['content']);
    $rec_id = intval($_POST['receiver_id']);
    
    
    if ($rec_id > 0) {
         $conn->query("INSERT INTO message (sender_id, receiver_id, content) VALUES ($user_id, $rec_id, '$content')");
    }
}


$contacts = $conn->query("
    SELECT DISTINCT u.user_id, u.first_name, u.last_name 
    FROM user u
    WHERE u.user_id != $user_id 
    AND (
        u.user_id IN (SELECT teacher_id FROM session WHERE learner_id = $user_id)
        OR 
        u.user_id IN (SELECT learner_id FROM session WHERE teacher_id = $user_id)
        OR
        u.user_id IN (SELECT sender_id FROM message WHERE receiver_id = $user_id )
        OR
        u.user_id IN (SELECT receiver_id FROM message WHERE sender_id = $user_id)
    )
");

// Fetch Messages if receiver selected
$messages = null;
$chat_partner_name = "";
if ($receiver_id > 0) {
    $messages = $conn->query("
        SELECT * FROM message 
        WHERE (sender_id = $user_id AND receiver_id = $receiver_id) 
           OR (sender_id = $receiver_id AND receiver_id = $user_id)
        ORDER BY timestamp DESC
    ");
    
    $partner = $conn->query("SELECT first_name, last_name FROM user WHERE user_id = $receiver_id")->fetch_assoc();
    $chat_partner_name = $partner['first_name'] . ' ' . $partner['last_name'];
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Messages - SkillSwap</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .chat-box { height: 400px; overflow-y: scroll; border: 1px solid #eee; padding: 20px; border-radius: 10px; background: #fafafa; }
        .msg { margin-bottom: 15px; max-width: 70%; padding: 10px 15px; border-radius: 20px; font-size: 0.95rem; }
        .sent { background: var(--primary); color: white; margin-left: auto; border-bottom-right-radius: 5px; }
        .received { background: #e1e1e1; color: #333; margin-right: auto; border-bottom-left-radius: 5px; }
    </style>
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

<div class="container" style="margin-top: 40px;">
    <div class="grid-2" style="grid-template-columns: 1fr 2fr;">
        <!-- Contacts List -->
        <div class="card">
            <h3>Contacts</h3>
            <?php if($contacts->num_rows > 0): ?>
                <ul style="list-style: none;">
                    <?php while($c = $contacts->fetch_assoc()): ?>
                        <li style="margin-bottom: 10px;">
                            <a href="messages.php?to=<?php echo $c['user_id']; ?>" style="display: block; padding: 10px; background: <?php echo ($receiver_id == $c['user_id']) ? '#f0f0f0' : 'white'; ?>; border-radius: 5px; color: var(--dark);">
                                <?php echo $c['first_name'] . ' ' . $c['last_name']; ?>
                            </a>
                        </li>
                    <?php endwhile; ?>
                </ul>
            <?php else: ?>
                <p>No connections yet. Book a session to start chatting!</p>
            <?php endif; ?>
        </div>

        <!-- Chat Area -->
        <div class="card">
            <?php if($receiver_id > 0): ?>
                <h3 style="border-bottom: 1px solid #eee; padding-bottom: 10px; margin-bottom: 10px;">
                    Chat with <?php echo $chat_partner_name; ?>
                </h3>
                
                <div class="chat-box" id="chatBox">
                    <?php if($messages && $messages->num_rows > 0): ?>
                        <?php while($msg = $messages->fetch_assoc()): ?>
                            <div class="msg <?php echo ($msg['sender_id'] == $user_id) ? 'sent' : 'received'; ?>">
                                <?php echo htmlspecialchars($msg['content']); ?>
                                <div style="font-size: 0.7rem; opacity: 0.7; margin-top: 5px; text-align: right;">
                                    <?php echo date('h:i A', strtotime($msg['timestamp'])); ?>
                                </div>
                            </div>
                        <?php endwhile; ?>
                    <?php else: ?>
                        <p style="text-align: center; color: #aaa; margin-top: 50px;">No messages yet. Say hello!</p>
                    <?php endif; ?>
                </div>

                <form method="POST" action="" style="margin-top: 20px; display: flex; gap: 10px;">
                    <input type="hidden" name="receiver_id" value="<?php echo $receiver_id; ?>">
                    <input type="text" name="content" placeholder="Type a message..." required autocomplete="off">
                    <button type="submit" class="btn btn-primary">Send</button>
                </form>
            <?php else: ?>
                <div style="height: 100%; display: flex; align-items: center; justify-content: center; color: #aaa;">
                    <h3>Select a contact to start messaging</h3>
                </div>
            <?php endif; ?>
        </div>
    </div>
</div>

<script>
    // Auto-scroll to bottom of chat
    var chatBox = document.getElementById("chatBox");
    if(chatBox) chatBox.scrollTop = chatBox.scrollHeight;
</script>

</body>
</html>
