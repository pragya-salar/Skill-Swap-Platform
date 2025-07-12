-- Check Database State
-- Run this to see what's in your database

-- Check users table
SELECT 'Users Table:' as info;
SELECT id, display_name, email, role FROM users ORDER BY id;

-- Check skills table
SELECT 'Skills Table:' as info;
SELECT id, user_id, name, type, level FROM skills ORDER BY id;

-- Check swap_requests table structure
SELECT 'Swap Requests Table Structure:' as info;
DESCRIBE swap_requests;

-- Check if swap_requests table has any data
SELECT 'Swap Requests Data:' as info;
SELECT * FROM swap_requests;

-- Check if John Doe (user_id = 2) has skills
SELECT 'John Doe Skills:' as info;
SELECT id, name, type, level FROM skills WHERE user_id = 2; 