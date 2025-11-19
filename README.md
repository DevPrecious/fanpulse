# ⚽️ FanPulse — Global Fan Community for Football Lovers

A beautiful, modern Flutter app for football fans to connect, predict, vote, and compete globally.

## 🎯 Core Features

### 0. 🔐 Authentication & Onboarding
- Beautiful 3-page onboarding experience
- Email/password authentication
- Social login (Google, Apple) ready
- Favorite club selection during signup
- Forgot password flow
- Remember me functionality
- Secure password handling

### 1. 🏟 Live Match Zone
- Real-time match scores and statistics
- Vote for Man of the Match
- Predict next match events (goals, corners, cards, etc.)
- Drop live reactions with emojis
- Interactive match statistics visualization

### 2. 🗳 Fan Polls
- Daily/weekly polls on hot football topics
- Vote and view real-time results
- Engage with thousands of fans worldwide
- Visual progress bars showing vote distribution

### 3. 🧩 Predictions & Challenges
- Predict match results (Home Win, Draw, Away Win)
- Earn points for correct predictions
- Comprehensive leaderboards:
  - Global rankings
  - Club-specific rankings
  - Friends leaderboard
- Track your prediction accuracy

### 4. 💬 Fan Chatrooms
- Dedicated chatrooms for:
  - Individual clubs (Arsenal, Chelsea, Liverpool, etc.)
  - Leagues (Premier League, La Liga, Champions League, etc.)
- Real-time messaging
- See online member counts
- Interactive chat interface

### 5. 🏆 Fan Rankings & Leaderboards
- Points-based ranking system
- Multiple leaderboard types:
  - Global leaderboard
  - Club leaderboard
  - Friends leaderboard
- Fan progression system: Rookie → Fan → Supporter → Captain → Legend

### 6. 👤 Profile & Badges
- Customizable fan profile
- Favorite club selection
- Earn badges:
  - 🎯 Top Predictor
  - ⚽ Club Loyalist
  - 🔥 Hot Commenter
  - 👑 Legend
  - 💯 Perfect Week
  - 🎖️ Veteran
- Track your statistics:
  - Total points
  - Predictions made
  - Win rate
  - Polls voted

## 🎨 Design Features

- **Modern Dark Theme**: Eye-friendly dark mode with vibrant accent colors
- **Beautiful Gradients**: Stunning gradient effects throughout the UI
- **Smooth Animations**: Fluid transitions and interactions
- **Fully Responsive**: Adapts perfectly to phones, tablets, and desktop
  - Small phones (< 375px)
  - Standard phones (375px - 768px)
  - Tablets (768px - 1024px)
  - Desktop (> 1024px)
  - Portrait & Landscape support
- **Material Design 3**: Following the latest Material Design guidelines
- **Custom Typography**: Google Fonts (Inter) with responsive scaling

## 🛠 Tech Stack

- **Framework**: Flutter 3.9.2+
- **State Management**: GetX 4.6.6
- **Navigation**: GetX Navigation
- **Fonts**: Google Fonts (Inter)
- **Responsive Design**: Custom responsive utilities
- **Architecture**: Clean Architecture with GetX
  - Presentation Layer (Screens, Widgets, Controllers)
  - Core Layer (Theme, Constants, Routes, Utilities)

## 📁 Project Structure

```
lib/
├── core/
│   ├── constants/
│   │   └── app_constants.dart      # App-wide constants
│   ├── routes/
│   │   └── app_routes.dart         # Route definitions (11 routes)
│   └── theme/
│       └── app_theme.dart          # Theme configuration
├── presentation/
│   ├── controllers/                # GetX Controllers (9 controllers)
│   │   ├── auth_controller.dart
│   │   ├── onboarding_controller.dart
│   │   ├── home_controller.dart
│   │   ├── live_match_controller.dart
│   │   ├── polls_controller.dart
│   │   ├── predictions_controller.dart
│   │   ├── chatrooms_controller.dart
│   │   ├── profile_controller.dart
│   │   └── leaderboard_controller.dart
│   ├── screens/                    # App screens (12 screens)
│   │   ├── onboarding/
│   │   │   └── onboarding_screen.dart
│   │   ├── auth/
│   │   │   ├── login_screen.dart
│   │   │   ├── signup_screen.dart
│   │   │   └── forgot_password_screen.dart
│   │   ├── home/
│   │   ├── live_match/
│   │   ├── polls/
│   │   ├── predictions/
│   │   ├── chatrooms/
│   │   ├── profile/
│   │   └── leaderboard/
│   └── widgets/                    # Reusable widgets
│       ├── custom_button.dart
│       ├── match_card.dart
│       ├── stat_card.dart
│       └── leaderboard_item.dart
└── main.dart                       # App entry point
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.9.2 or higher)
- Dart SDK (3.9.2 or higher)
- iOS Simulator / Android Emulator / Physical Device

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd fanpulse
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Running on Specific Platforms

```bash
# iOS
flutter run -d ios

# Android
flutter run -d android

# Web
flutter run -d chrome

# macOS
flutter run -d macos
```

## 🎯 Navigation Structure

### Authentication Flow:
1. **Onboarding** - 3-page introduction (first-time users)
2. **Login** - Email/password or social login
3. **Signup** - Registration with favorite club selection
4. **Forgot Password** - Password recovery

### Main App (Bottom Navigation):
1. **Home** - Dashboard with live matches and quick actions
2. **Discover** - Trending polls and popular chatrooms
3. **Leaderboard** - View global, club, and friend rankings
4. **Profile** - User profile, badges, and statistics

### Additional Screens:
- Live Match Zone (detailed match view with voting)
- Fan Polls (vote on trending debates)
- Predictions & Challenges (make predictions, view leaderboard)
- Fan Chatrooms (club and league discussions)
- Full Leaderboard View (3 tabs: Global, Club, Friends)

## 🎨 Color Palette

```dart
Primary Green:    #00D97E
Dark Background:  #0A0E27
Card Background:  #1A1F3A
Accent Blue:      #0091FF
Accent Purple:    #7C3AED
Error Red:        #EF4444
Warning Orange:   #F59E0B
Success Green:    #10B981
Text Primary:     #FFFFFF
Text Secondary:   #94A3B8
```

## 📱 Screenshots

*(Add screenshots here once available)*

## 🧪 Testing

Run tests with:

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage
```

## 🔧 Development Guidelines

This project follows Flutter and Dart best practices:

- Clean Architecture principles
- GetX for state management and navigation
- Proper widget composition (avoiding deep nesting)
- Reusable components
- Type-safe code
- Comprehensive documentation

## 📝 Future Enhancements

- [ ] Real-time data integration with football APIs
- [ ] Push notifications for match updates
- [ ] Social features (friend system, direct messaging)
- [ ] Enhanced statistics and analytics
- [ ] Multiple language support
- [ ] Dark/Light theme toggle
- [ ] Custom match reminders
- [ ] Share predictions on social media

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License.

## 👥 Target Users

- Everyday football fans who follow leagues and matches
- People who love to debate, vote, and show support for their clubs
- Users who watch live matches and want to interact beyond social media

## 🌟 Key Highlights

- **Beautiful UI/UX**: Modern, clean, and intuitive interface
- **Real-time Interaction**: Live match updates and reactions
- **Gamification**: Points, badges, and leaderboards for engagement
- **Community**: Connect with fans worldwide
- **Comprehensive**: All-in-one platform for football fans

---

Made with ❤️ for football fans worldwide
