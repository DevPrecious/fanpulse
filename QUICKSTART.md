# 🚀 FanPulse Quick Start Guide

## Run the App

```bash
cd /Users/devprecious/Documents/Development/fanpulse
flutter run
```

### Test Responsive Design
The app automatically adapts to different screen sizes:
- Try running on different devices (phones, tablets)
- Rotate your device (portrait ↔ landscape)
- Resize browser window (if running on web)
- Text and spacing scale automatically!

## Available Screens

### 🔐 Authentication Flow (Entry Point)

#### 1. Onboarding Screen
- 3 beautiful pages introducing FanPulse
- Skip or swipe through
- "Get Started" button on last page

#### 2. Login Screen
- Email & password fields
- Remember me checkbox
- Social login buttons (Google, Apple)
- Forgot password link
- Sign up link

#### 3. Signup Screen
- Full name, email, password fields
- Favorite club selector (6 clubs)
- Terms & privacy acknowledgment
- Creates account → Home

#### 4. Forgot Password Screen
- Email input
- Sends reset link
- Success dialog
- Returns to login

### 🏠 Home Screen (Bottom Navigation)
The main hub with 4 tabs:
- **Home Tab**: Live matches, stats, and quick actions
- **Discover Tab**: Trending polls and popular chatrooms  
- **Leaderboard Tab**: Quick link to full leaderboard
- **Profile Tab**: Quick link to full profile

### Navigation Flow:

#### From Home Tab → Quick Actions:
- **Live Match** → Live match details with voting and predictions
- **Fan Polls** → Vote on trending football debates
- **Predictions** → Predict match outcomes and view leaderboard
- **Chatrooms** → Join club and league discussions

#### Full Screens:
- **Live Match Zone** (`/live-match`)
  - Real-time match scores
  - Man of the Match voting
  - Next event predictions
  - Live reactions

- **Fan Polls** (`/polls`)
  - Daily/weekly polls
  - Vote and see results
  - View total votes and participation

- **Predictions** (`/predictions`)
  - Two tabs: Upcoming | Leaderboard
  - Make predictions on matches
  - Earn points for accuracy
  - Track your ranking

- **Chatrooms** (`/chatrooms`)
  - Club chatrooms (Arsenal, Chelsea, Liverpool, etc.)
  - League chatrooms (Premier League, La Liga, UCL, etc.)
  - Real-time chat interface
  - Online member counts

- **Profile** (`/profile`)
  - User stats and points
  - Badge collection
  - Recent activity
  - Fan rank progression

- **Leaderboard** (`/leaderboard`)
  - Three tabs: Global | My Club | Friends
  - View top predictors
  - Track your rank
  - Compete with friends

## Features to Try

### 1. Vote on a Poll
1. Go to **Discover** tab or **Fan Polls** screen
2. Tap on any poll option
3. See real-time results

### 2. Make a Prediction
1. Navigate to **Predictions** screen
2. Choose a match
3. Select: Home Win | Draw | Away Win
4. Track your points

### 3. Join a Chatroom
1. Go to **Chatrooms** screen
2. Tap on any chatroom
3. Type a message and send
4. See live chat interface

### 4. View Live Match
1. Tap on any live match card
2. Vote for Man of the Match
3. Predict next event
4. Add live reactions

### 5. Check Your Profile
1. Go to **Profile** tab
2. View your stats
3. See earned badges
4. Check recent activity

## Color Scheme

The app uses a modern dark theme with vibrant accents:

- **Primary**: Green (#00D97E) - Main actions, success
- **Accent Blue**: (#0091FF) - Secondary actions
- **Accent Purple**: (#7C3AED) - Special highlights
- **Background**: Dark (#0A0E27, #1A1F3A)

## State Management

The app uses **GetX** for:
- Navigation (Get.to, Get.toNamed)
- State management (.obs, Obx)
- Dependency injection (Get.put, Get.find)

## Tips

- All data is currently mock/UI only
- Controllers are ready for backend integration
- Responsive design works on all screen sizes
- Bottom navigation persists across main tabs
- Deep linking ready for future implementation

## Next Steps for Backend Integration

When ready to add real data:

1. **Add Data Models** (`lib/data/models/`)
   - Match, Poll, Prediction, User, etc.

2. **Add Repositories** (`lib/data/repositories/`)
   - Handle API calls and data persistence

3. **Add Services** (`lib/data/services/`)
   - API service, Auth service, etc.

4. **Update Controllers**
   - Replace mock data with repository calls
   - Add loading states
   - Handle errors

5. **Add Dependencies**
   - http/dio for networking
   - shared_preferences for local storage
   - firebase (optional) for real-time features

---

**Enjoy building FanPulse! ⚽️🔥**

