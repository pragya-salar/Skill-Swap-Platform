-- Demo Swap Requests Data
-- Run this in phpMyAdmin to add demo swap requests

-- First, make sure we have some skills
INSERT IGNORE INTO skills (user_id, name, description, level, type, created_at) VALUES
(2, 'Photoshop', 'Adobe Photoshop for image editing', 'intermediate', 'offered', NOW()),
(3, 'Video Editing', 'Video editing with Premiere Pro', 'advanced', 'offered', NOW()),
(2, 'Excel', 'Microsoft Excel for data management', 'intermediate', 'offered', NOW()),
(4, 'Data Analysis', 'Data analysis with Python/R', 'advanced', 'offered', NOW()),
(2, 'Spanish', 'Spanish language conversation', 'intermediate', 'offered', NOW()),
(5, 'French', 'French language conversation', 'beginner', 'offered', NOW());

-- Add demo users if they don't exist
INSERT IGNORE INTO users (id, display_name, email, password, role, created_at) VALUES
(3, 'Sarah Johnson', 'sarah@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NOW()),
(4, 'Mike Chen', 'mike@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NOW()),
(5, 'Emma Wilson', 'emma@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NOW());

-- Get skill IDs (we need to get the actual IDs from the skills table)
-- Let's assume the skills have these IDs based on the order they were inserted

-- Add demo swap requests (assuming John Doe has user_id = 2)
-- Note: requester_skill_id = skill that requester is offering
--       recipient_skill_id = skill that requester wants to learn
INSERT INTO swap_requests (requester_id, recipient_id, requester_skill_id, recipient_skill_id, message, status, created_at) VALUES
(3, 2, 2, 1, 'I would love to learn Photoshop for my design projects!', 'pending', DATE_SUB(NOW(), INTERVAL 2 HOUR)),
(4, 2, 4, 3, 'Need Excel skills for work, can teach data analysis in return.', 'accepted', DATE_SUB(NOW(), INTERVAL 1 DAY)),
(5, 2, 6, 5, 'Planning a trip to Spain, would love to practice Spanish!', 'pending', DATE_SUB(NOW(), INTERVAL 3 DAY)); 