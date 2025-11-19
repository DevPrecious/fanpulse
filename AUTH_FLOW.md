# 🔐 FanPulse Authentication Flow

## Overview

The authentication system provides a seamless onboarding experience for new users and easy login for returning users.

## 📱 Auth Screens

### 1. Onboarding Screen (`/onboarding`)
**First-time user experience**

- **3 Beautiful Pages:**
  1. **Welcome** - Introduction to FanPulse
  2. **Compete & Win** - Explain points and leaderboards
  3. **Connect** - Highlight community features

- **Features:**
  - Swipeable PageView
  - Animated page indicators
  - Skip button (top-right)
  - Back button (appears on page 2+)
  - Next/Get Started button
  - Gradient emoji circles

- **Navigation:**
  - Skip → Login Screen
  - Get Started (page 3) → Login Screen
  - Back → Previous onboarding page

---

### 2. Login Screen (`/login`)
**Returning user authentication**

- **Form Fields:**
  - Email (with validation icon)
  - Password (with show/hide toggle)
  - Remember Me checkbox
  - Forgot Password link

- **Login Methods:**
  - Email & Password
  - Continue with Google
  - Continue with Apple

- **Features:**
  - Input validation
  - Password visibility toggle
  - Loading state during authentication
  - Social authentication buttons

- **Navigation:**
  - Sign In → Home Screen (after auth)
  - Forgot Password → Forgot Password Screen
  - Sign Up → Signup Screen
  - Social Login → Home Screen (after auth)

---

### 3. Signup Screen (`/signup`)
**New user registration**

- **Form Fields:**
  - Full Name
  - Email
  - Password (with show/hide toggle)
  - Confirm Password
  - Favorite Club selector

- **Club Selection:**
  - Arsenal, Chelsea, Liverpool
  - Man City, Man United, Tottenham
  - Beautiful chip-style buttons
  - Visual selection state

- **Features:**
  - Real-time validation
  - Password strength indicator (future)
  - Terms & Privacy acknowledgment
  - Loading state

- **Navigation:**
  - Create Account → Home Screen (after auth)
  - Sign In → Back to Login Screen

---

### 4. Forgot Password Screen (`/forgot-password`)
**Password recovery**

- **Form Fields:**
  - Email

- **Features:**
  - Large lock icon for visual clarity
  - Clear instructions
  - Success dialog after submission
  - Loading state

- **Navigation:**
  - Send Reset Link → Shows success dialog
  - Dialog OK → Back to Login
  - Back to Sign In → Login Screen

---

## 🎨 Design Features

### Color Scheme
- Primary Green accent for CTAs
- Dark theme throughout
- Card backgrounds for forms
- Visual feedback on interactions

### UI Components
- Custom text fields with icons
- Rounded corners (12px)
- Focus states with green borders
- Consistent spacing and padding
- Material Design 3 components

### Animations
- Page transitions
- Loading indicators
- Button press states
- Smooth navigation

---

## 🔄 Navigation Flow

```
App Start
    ↓
Onboarding Screen
    ↓ (Skip or Complete)
Login Screen
    ↓
    ├─→ Signup Screen → (Register) → Home
    ├─→ Forgot Password → (Reset) → Login
    └─→ (Sign In) → Home Screen
```

---

## 💾 State Management

### AuthController
Located: `lib/presentation/controllers/auth_controller.dart`

**Observable States:**
```dart
- isLoading: RxBool           // Loading indicator
- isPasswordVisible: RxBool   // Password visibility
- rememberMe: RxBool          // Remember me checkbox
- selectedFavoriteClub: RxString  // Selected club
```

**Methods:**
```dart
- login(email, password)      // Email/password login
- signup(name, email, pass)   // User registration
- resetPassword(email)        // Password reset
- loginWithGoogle()           // Google OAuth
- loginWithApple()            // Apple Sign In
- togglePasswordVisibility()  // Show/hide password
- toggleRememberMe()          // Toggle checkbox
- selectFavoriteClub(club)    // Select favorite club
```

### OnboardingController
Located: `lib/presentation/controllers/onboarding_controller.dart`

**Observable States:**
```dart
- currentPage: RxInt          // Current onboarding page
```

**Methods:**
```dart
- updatePage(page)            // Update current page
- nextPage()                  // Go to next page
- previousPage()              // Go to previous page
- isLastPage()                // Check if last page
```

---

## 🔧 Integration Points

### For Backend Integration:

1. **Update AuthController methods:**
   ```dart
   // Replace mock delays with actual API calls
   Future<void> login(String email, String password) async {
     isLoading.value = true;
     try {
       // Call your authentication API
       final response = await authService.login(email, password);
       // Store token, user data
       // Navigate to home
     } catch (e) {
       // Handle errors
       Get.snackbar('Error', 'Login failed');
     } finally {
       isLoading.value = false;
     }
   }
   ```

2. **Add Authentication Service:**
   - Create `lib/data/services/auth_service.dart`
   - Implement API calls
   - Handle token management
   - Implement secure storage

3. **Add User Model:**
   - Create `lib/data/models/user_model.dart`
   - Store user information
   - Profile management

4. **Add Storage Service:**
   - Token persistence
   - Remember me functionality
   - Secure credential storage

---

## 🔐 Security Considerations

### Current Implementation (UI Only):
- Password fields properly obscured
- Form validation ready
- Secure navigation flow

### For Production:
- [ ] Add input sanitization
- [ ] Implement proper password hashing
- [ ] Add token-based authentication
- [ ] Implement refresh tokens
- [ ] Add biometric authentication
- [ ] Implement rate limiting
- [ ] Add CAPTCHA for signup
- [ ] SSL/TLS for all API calls
- [ ] Secure storage for tokens
- [ ] Session management

---

## 📋 Form Validations (Ready for Implementation)

### Email Validation:
- Format check (regex)
- Required field
- Duplicate check (signup)

### Password Validation:
- Minimum 8 characters
- At least 1 uppercase letter
- At least 1 lowercase letter
- At least 1 number
- At least 1 special character
- Confirm password match

### Name Validation:
- Required field
- Minimum 2 characters
- Letters only

---

## 🎯 Quick Testing

### To Test Auth Flow:

1. **Start App:**
   ```bash
   flutter run
   ```

2. **Onboarding:**
   - Swipe through 3 pages
   - Try "Skip" button
   - Try "Back" button
   - Click "Get Started"

3. **Login:**
   - Enter any email/password
   - Toggle password visibility
   - Try "Remember Me"
   - Click "Sign In" → Goes to Home

4. **Signup:**
   - Click "Sign Up" from login
   - Fill all fields
   - Select a favorite club
   - Click "Create Account" → Goes to Home

5. **Forgot Password:**
   - Click "Forgot Password?"
   - Enter email
   - Click "Send Reset Link"
   - See success dialog

---

## 🚀 Next Steps

1. **Add Real Authentication:**
   - Firebase Auth
   - Custom backend API
   - OAuth providers

2. **Add Persistence:**
   - Remember login state
   - Auto-login on app start
   - Session management

3. **Add Validation:**
   - Real-time form validation
   - Error messages
   - Success feedback

4. **Add Security:**
   - Token management
   - Secure storage
   - Biometric auth

---

**Your authentication flow is now complete and ready for backend integration! 🎉**

