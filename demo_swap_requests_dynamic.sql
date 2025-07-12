-- Demo Swap Requests Data (Dynamic Version)
-- Run this in phpMyAdmin to add demo swap requests

-- Add demo users if they don't exist
INSERT IGNORE INTO users (id, display_name, email, password, role, created_at) VALUES
(3, 'Sarah Johnson', 'sarah@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NOW()),
(4, 'Mike Chen', 'mike@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NOW()),
(5, 'Emma Wilson', 'emma@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NOW());

-- Add skills for demo users
INSERT IGNORE INTO skills (user_id, name, description, level, type, created_at) VALUES
(3, 'Video Editing', 'Video editing with Premiere Pro', 'advanced', 'offered', NOW()),
(4, 'Data Analysis', 'Data analysis with Python/R', 'advanced', 'offered', NOW()),
(5, 'French', 'French language conversation', 'beginner', 'offered', NOW());

-- Add demo swap requests using subqueries to get skill IDs
INSERT INTO swap_requests (requester_id, recipient_id, requester_skill_id, recipient_skill_id, message, status, created_at) 
SELECT 
    3 as requester_id,
    2 as recipient_id,
    (SELECT id FROM skills WHERE user_id = 3 AND name = 'Video Editing' LIMIT 1) as requester_skill_id,
    (SELECT id FROM skills WHERE user_id = 2 AND name = 'Photoshop' LIMIT 1) as recipient_skill_id,
    'I would love to learn Photoshop for my design projects!' as message,
    'pending' as status,
    DATE_SUB(NOW(), INTERVAL 2 HOUR) as created_at
WHERE EXISTS (SELECT 1 FROM skills WHERE user_id = 3 AND name = 'Video Editing')
  AND EXISTS (SELECT 1 FROM skills WHERE user_id = 2 AND name = 'Photoshop');

INSERT INTO swap_requests (requester_id, recipient_id, requester_skill_id, recipient_skill_id, message, status, created_at) 
SELECT 
    4 as requester_id,
    2 as recipient_id,
    (SELECT id FROM skills WHERE user_id = 4 AND name = 'Data Analysis' LIMIT 1) as requester_skill_id,
    (SELECT id FROM skills WHERE user_id = 2 AND name = 'Excel' LIMIT 1) as recipient_skill_id,
    'Need Excel skills for work, can teach data analysis in return.' as message,
    'accepted' as status,
    DATE_SUB(NOW(), INTERVAL 1 DAY) as created_at
WHERE EXISTS (SELECT 1 FROM skills WHERE user_id = 4 AND name = 'Data Analysis')
  AND EXISTS (SELECT 1 FROM skills WHERE user_id = 2 AND name = 'Excel');

INSERT INTO swap_requests (requester_id, recipient_id, requester_skill_id, recipient_skill_id, message, status, created_at) 
SELECT 
    5 as requester_id,
    2 as recipient_id,
    (SELECT id FROM skills WHERE user_id = 5 AND name = 'French' LIMIT 1) as requester_skill_id,
    (SELECT id FROM skills WHERE user_id = 2 AND name = 'Spanish' LIMIT 1) as recipient_skill_id,
    'Planning a trip to Spain, would love to practice Spanish!' as message,
    'pending' as status,
    DATE_SUB(NOW(), INTERVAL 3 DAY) as created_at
WHERE EXISTS (SELECT 1 FROM skills WHERE user_id = 5 AND name = 'French')
  AND EXISTS (SELECT 1 FROM skills WHERE user_id = 2 AND name = 'Spanish'); 