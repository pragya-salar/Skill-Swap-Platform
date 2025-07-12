<?php
// Server configuration check
header('Content-Type: application/json');

$info = [
    'php_version' => PHP_VERSION,
    'server_software' => $_SERVER['SERVER_SOFTWARE'] ?? 'Unknown',
    'document_root' => $_SERVER['DOCUMENT_ROOT'] ?? 'Unknown',
    'script_name' => $_SERVER['SCRIPT_NAME'] ?? 'Unknown',
    'request_uri' => $_SERVER['REQUEST_URI'] ?? 'Unknown',
    'http_host' => $_SERVER['HTTP_HOST'] ?? 'Unknown',
    'current_dir' => __DIR__,
    'file_exists' => [
        'register.php' => file_exists('backend/api/auth/register.php'),
        'database.php' => file_exists('backend/config/database.php'),
        'api.js' => file_exists('js/api.js')
    ]
];

echo json_encode($info, JSON_PRETTY_PRINT);
?> 