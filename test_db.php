<?php
// Test database connection
require_once 'backend/config/database.php';

echo "<h2>Skill Swap - Database Connection Test</h2>";

try {
    $pdo = getDBConnection();
    echo "<p style='color: green;'>✅ Database connection successful!</p>";
    
    // Test query
    $stmt = $pdo->query("SELECT COUNT(*) as user_count FROM users");
    $result = $stmt->fetch();
    echo "<p>📊 Total users in database: " . $result['user_count'] . "</p>";
    
    // Test sample data
    $stmt = $pdo->query("SELECT display_name, email, role FROM users LIMIT 3");
    $users = $stmt->fetchAll();
    
    echo "<h3>Sample Users:</h3>";
    echo "<ul>";
    foreach ($users as $user) {
        echo "<li><strong>" . htmlspecialchars($user['display_name']) . "</strong> (" . htmlspecialchars($user['email']) . ") - " . htmlspecialchars($user['role']) . "</li>";
    }
    echo "</ul>";
    
    echo "<p style='color: blue;'>🎉 Database setup is working correctly!</p>";
    
} catch (Exception $e) {
    echo "<p style='color: red;'>❌ Database connection failed: " . htmlspecialchars($e->getMessage()) . "</p>";
    echo "<h3>Troubleshooting:</h3>";
    echo "<ul>";
    echo "<li>Check if MySQL service is running</li>";
    echo "<li>Verify database credentials in backend/config/database.php</li>";
    echo "<li>Ensure database 'skillswap_db' exists</li>";
    echo "<li>Check if schema.sql was imported correctly</li>";
    echo "</ul>";
}

echo "<hr>";
echo "<p><a href='index.html'>← Back to Skill Swap</a></p>";
?> 