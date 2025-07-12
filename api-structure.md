# Skill Swap Platform - API Structure

## 🔗 Backend Integration Guide

### Authentication Endpoints

#### 1. User Registration
```
POST /api/auth/register
Content-Type: application/json

{
  "firstName": "John",
  "lastName": "Doe", 
  "email": "john@example.com",
  "password": "securepassword123",
  "location": "Mumbai, India",
  "profilePhoto": "base64_encoded_image"
}

Response:
{
  "success": true,
  "message": "User registered successfully",
  "data": {
    "userId": 123,
    "token": "jwt_token_here"
  }
}
```

#### 2. User Login
```
POST /api/auth/login
Content-Type: application/json

{
  "email": "john@example.com",
  "password": "securepassword123"
}

Response:
{
  "success": true,
  "message": "Login successful",
  "data": {
    "user": {
      "id": 123,
      "firstName": "John",
      "lastName": "Doe",
      "displayName": "John Doe",
      "email": "john@example.com",
      "location": "Mumbai, India",
      "profilePhoto": "https://example.com/photos/john.jpg",
      "bio": "Passionate about learning and teaching",
      "rating": 4.8,
      "totalSwaps": 12,
      "isOnline": true,
      "isAvailable": true
    },
    "token": "jwt_token_here"
  }
}
```

### User Profile Endpoints

#### 3. Get User Profile
```
GET /api/user/profile
Authorization: Bearer jwt_token_here

Response:
{
  "success": true,
  "data": {
    "id": 123,
    "firstName": "John",
    "lastName": "Doe",
    "displayName": "John Doe",
    "email": "john@example.com",
    "location": "Mumbai, India",
    "profilePhoto": "https://example.com/photos/john.jpg",
    "bio": "Passionate about learning and teaching",
    "rating": 4.8,
    "totalSwaps": 12,
    "isOnline": true,
    "isAvailable": true,
    "timezone": "UTC+5:30",
    "availability": {
      "days": ["monday", "tuesday", "wednesday"],
      "times": ["evening", "night"]
    }
  }
}
```

#### 4. Update User Profile
```
PUT /api/user/profile
Authorization: Bearer jwt_token_here
Content-Type: application/json

{
  "displayName": "John Doe",
  "location": "Mumbai, India",
  "bio": "Updated bio",
  "profilePhoto": "base64_encoded_image",
  "availability": {
    "days": ["monday", "tuesday", "wednesday"],
    "times": ["evening", "night"]
  }
}
```

### Skills Management Endpoints

#### 5. Get User Skills
```
GET /api/user/skills
Authorization: Bearer jwt_token_here

Response:
{
  "success": true,
  "data": {
    "offered": [
      {
        "id": 1,
        "name": "Photoshop",
        "level": "expert",
        "description": "Professional photo editing"
      },
      {
        "id": 2,
        "name": "Excel",
        "level": "advanced",
        "description": "Data analysis and formulas"
      }
    ],
    "wanted": [
      {
        "id": 3,
        "name": "Video Editing",
        "level": "beginner",
        "description": "Learn basic video editing"
      }
    ]
  }
}
```

#### 6. Add Skill
```
POST /api/user/skills
Authorization: Bearer jwt_token_here
Content-Type: application/json

{
  "name": "Python Programming",
  "type": "offered", // or "wanted"
  "level": "intermediate",
  "description": "Web development with Django"
}

Response:
{
  "success": true,
  "message": "Skill added successfully",
  "data": {
    "skillId": 4
  }
}
```

#### 7. Remove Skill
```
DELETE /api/user/skills/{skillId}
Authorization: Bearer jwt_token_here

Response:
{
  "success": true,
  "message": "Skill removed successfully"
}
```

### Swap Management Endpoints

#### 8. Get Swap Requests
```
GET /api/swaps/requests
Authorization: Bearer jwt_token_here

Response:
{
  "success": true,
  "data": [
    {
      "id": 1,
      "fromUser": {
        "id": 456,
        "displayName": "Sarah Johnson",
        "profilePhoto": "https://example.com/photos/sarah.jpg"
      },
      "requestedSkill": "Photoshop",
      "offeredSkill": "Video Editing",
      "status": "pending", // pending, accepted, rejected
      "createdAt": "2024-01-15T10:30:00Z",
      "message": "I would love to learn Photoshop from you!"
    }
  ]
}
```

#### 9. Accept Swap Request
```
POST /api/swaps/{swapId}/accept
Authorization: Bearer jwt_token_here

Response:
{
  "success": true,
  "message": "Swap request accepted"
}
```

#### 10. Reject Swap Request
```
POST /api/swaps/{swapId}/reject
Authorization: Bearer jwt_token_here

Response:
{
  "success": true,
  "message": "Swap request rejected"
}
```

#### 11. Send Swap Request
```
POST /api/swaps/request
Authorization: Bearer jwt_token_here
Content-Type: application/json

{
  "toUserId": 456,
  "requestedSkill": "Video Editing",
  "offeredSkill": "Photoshop",
  "message": "I can teach you Photoshop in exchange for Video Editing lessons"
}

Response:
{
  "success": true,
  "message": "Swap request sent successfully"
}
```

### Search Endpoints

#### 12. Search Users
```
GET /api/search/users?q=photoshop&category=technology&location=mumbai
Authorization: Bearer jwt_token_here

Response:
{
  "success": true,
  "data": [
    {
      "id": 456,
      "displayName": "Sarah Johnson",
      "profilePhoto": "https://example.com/photos/sarah.jpg",
      "location": "Mumbai, India",
      "rating": 4.9,
      "totalReviews": 24,
      "offeredSkills": ["Video Editing", "Photography"],
      "wantedSkills": ["Photoshop", "Spanish"],
      "isAvailable": true
    }
  ]
}
```

### Activity Endpoints

#### 13. Get User Activity
```
GET /api/user/activity
Authorization: Bearer jwt_token_here

Response:
{
  "success": true,
  "data": [
    {
      "id": 1,
      "type": "rating_received",
      "title": "New rating received",
      "description": "5 stars from Sarah Johnson",
      "details": "Great Photoshop teacher!",
      "createdAt": "2024-01-15T09:00:00Z"
    },
    {
      "id": 2,
      "type": "swap_completed",
      "title": "Swap completed",
      "description": "with Mike Chen",
      "details": "Excel for Data Analysis exchange",
      "createdAt": "2024-01-14T15:30:00Z"
    }
  ]
}
```

### Admin Endpoints

#### 14. Get Platform Stats (Admin Only)
```
GET /api/admin/stats
Authorization: Bearer admin_jwt_token_here

Response:
{
  "success": true,
  "data": {
    "totalUsers": 1247,
    "pendingSwaps": 89,
    "completedSwaps": 156,
    "reportedIssues": 23,
    "activeUsersToday": 934,
    "successRate": 88,
    "averageRating": 4.6
  }
}
```

#### 15. Get Pending Approvals (Admin Only)
```
GET /api/admin/approvals
Authorization: Bearer admin_jwt_token_here

Response:
{
  "success": true,
  "data": [
    {
      "id": 1,
      "userId": 789,
      "userName": "John Smith",
      "skillName": "Advanced Hacking Techniques",
      "description": "Learn to hack into systems and networks",
      "status": "pending",
      "submittedAt": "2024-01-15T08:00:00Z"
    }
  ]
}
```

## 🔧 Database Schema

### Users Table
```sql
CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  firstName VARCHAR(50) NOT NULL,
  lastName VARCHAR(50) NOT NULL,
  displayName VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  location VARCHAR(100),
  profilePhoto VARCHAR(255),
  bio TEXT,
  rating DECIMAL(3,2) DEFAULT 0.00,
  totalSwaps INT DEFAULT 0,
  isOnline BOOLEAN DEFAULT FALSE,
  isAvailable BOOLEAN DEFAULT TRUE,
  timezone VARCHAR(10),
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

### Skills Table
```sql
CREATE TABLE skills (
  id INT PRIMARY KEY AUTO_INCREMENT,
  userId INT NOT NULL,
  name VARCHAR(100) NOT NULL,
  type ENUM('offered', 'wanted') NOT NULL,
  level ENUM('beginner', 'intermediate', 'advanced', 'expert') DEFAULT 'beginner',
  description TEXT,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE
);
```

### Swaps Table
```sql
CREATE TABLE swaps (
  id INT PRIMARY KEY AUTO_INCREMENT,
  fromUserId INT NOT NULL,
  toUserId INT NOT NULL,
  requestedSkill VARCHAR(100) NOT NULL,
  offeredSkill VARCHAR(100) NOT NULL,
  status ENUM('pending', 'accepted', 'rejected', 'completed') DEFAULT 'pending',
  message TEXT,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (fromUserId) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (toUserId) REFERENCES users(id) ON DELETE CASCADE
);
```

## 🚀 Implementation Steps

### 1. Backend Setup
- Choose your backend framework (Node.js/Express, Python/Django, PHP/Laravel, etc.)
- Set up database (MySQL, PostgreSQL, MongoDB)
- Implement JWT authentication
- Create API endpoints as per structure above

### 2. Frontend Integration
- Replace hardcoded data with API calls
- Implement proper error handling
- Add loading states
- Handle authentication tokens

### 3. Security Considerations
- Input validation and sanitization
- SQL injection prevention
- XSS protection
- CSRF protection
- Rate limiting
- Secure file uploads

### 4. Testing
- Unit tests for API endpoints
- Integration tests
- Frontend testing
- Security testing

## 📝 Notes

- All API responses should include a `success` boolean field
- Error responses should include `message` field with error description
- Use proper HTTP status codes (200, 201, 400, 401, 403, 404, 500)
- Implement pagination for list endpoints
- Add proper logging and monitoring
- Consider implementing caching for frequently accessed data 