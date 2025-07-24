# # İş Bul - Swipe to Apply 🇹🇷

## Türkiye İş Bulma Uygulaması - Comprehensive Job Search Platform

**İş Bul** is a revolutionary job search application designed specifically for the Turkish market, featuring Tinder-style job swiping, AI-powered automation, and integration with major Turkish and international job boards.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/firebase-ffca28?style=for-the-badge&logo=firebase&logoColor=black)

## 🎯 Overview

This app revolutionizes job searching in Turkey by combining:
- **Tinder-style swiping** for quick job discovery
- **AI-powered CV parsing** and automatic form filling
- **Integration with Turkish job boards** (Kariyer.net, SecretCV, Yenibiris)
- **Global platform support** (LinkedIn, Indeed)
- **Automated application submission** using headless browser automation
- **Gamification** to encourage consistent job searching
- **KVKK compliance** for Turkish data protection laws

## 🚀 Key Features

### 1. **Profile Setup & Resume Parsing**
- Upload CVs in PDF/DOC format
- AI/NLP extraction of structured data:
  - Personal information
  - Education history
  - Work experience
  - Skills and certifications
- Manual profile completion option

### 2. **Job Feed & Swiping Experience**
- Curated job listings from multiple sources
- Intuitive Tinder-style interface:
  - **Swipe Right** → Apply instantly
  - **Swipe Left** → Skip job
- Real-time job matching based on profile

### 3. **Automated Application Flow**
- **Easy Apply Jobs**: Direct API integration
- **Company Website Applications**: 
  - Headless browser automation (Puppeteer/Selenium-style)
  - Intelligent form detection and filling
  - NLP-powered field mapping

### 4. **AI-Generated Content**
- Customized cover letters per job
- ATS-optimized CV generation
- Smart answers to application questions
- Powered by OpenAI GPT models

### 5. **Company Data Enrichment**
- Automatic company information fetching
- Integration with Clearbit/ZoomInfo APIs
- Complete firmographic data

### 6. **Application Tracking Dashboard**
- Comprehensive application history
- Status tracking (submitted, viewed, interview, etc.)
- Follow-up reminders and notifications

### 7. **Gamification & Turkish Localization**
- Achievement badges and streaks
- Credit system for applications
- Complete Turkish UI/UX
- KVKK-compliant data handling

## 🛠 Technical Architecture

### **Frontend (Flutter)**
```
lib/
├── core/
│   ├── constants/          # App constants, Turkish cities, job categories
│   ├── router/            # GoRouter navigation setup
│   ├── themes/            # Turkish flag-inspired theme
│   └── utils/
├── features/
│   ├── auth/              # Authentication (Google, Email)
│   ├── onboarding/        # App introduction
│   ├── profile/           # User profile management
│   ├── jobs/              # Job listings and swiping
│   ├── applications/      # Application tracking
│   ├── settings/          # App configuration
│   └── localization/      # Turkish translations
```

## 🔧 Setup & Installation

### **Prerequisites**
- Flutter SDK 3.8+
- Dart 3.8+
- Chrome browser for web testing

### **Quick Start**

1. **Install dependencies**
   ```bash
   flutter pub get
   ```

2. **Generate code**
   ```bash
   dart run build_runner build
   ```

3. **Run the app**
   ```bash
   flutter run -d chrome
   ```

## 📱 Current Implementation Status

### ✅ **Completed Features**
- [x] **App Structure**: Complete Flutter app architecture with clean code organization
- [x] **Navigation**: GoRouter-based navigation with proper routing
- [x] **UI/UX**: Turkish flag-inspired theme with Material Design 3
- [x] **Onboarding**: Multi-step introduction with smooth animations
- [x] **Authentication**: Login/Register pages with form validation
- [x] **Job Swiping**: Tinder-style card swiping with sample job data
- [x] **Localization**: Complete Turkish language support
- [x] **State Management**: Riverpod for robust state management
- [x] **Bottom Navigation**: Tab-based navigation between main features

### 🔄 **In Development**
- [ ] **CV Upload & Parsing**: PDF/DOC processing with AI extraction
- [ ] **API Integration**: Connection to Turkish job boards
- [ ] **Application Automation**: Headless browser form filling
- [ ] **User Profile**: Complete profile management system
- [ ] **Dashboard Analytics**: Application tracking and statistics

### 📋 **Planned Features**
- [ ] **AI Content Generation**: OpenAI integration for cover letters
- [ ] **Company Enrichment**: Clearbit/ZoomInfo API integration
- [ ] **Push Notifications**: Application status updates
- [ ] **Gamification**: Points, badges, and achievements
- [ ] **Advanced Filters**: Location, salary, work type filtering

## 🎮 How to Use

1. **Launch the app** - Start with the splash screen
2. **Complete onboarding** - Learn about app features
3. **Sign up/Login** - Create your account
4. **Start swiping** - Browse job opportunities
   - **Swipe Right** ➡️ to apply for a job
   - **Swipe Left** ⬅️ to skip
5. **Track applications** - Monitor your job application status
6. **Manage profile** - Update your information and preferences

## 🛠 Development Commands

```bash
# Install dependencies
flutter pub get

# Generate model classes
dart run build_runner build

# Run on Chrome (recommended for development)
flutter run -d chrome

# Run tests
flutter test

# Hot reload (during development)
# Press 'r' in terminal while app is running

# Hot restart
# Press 'R' in terminal while app is running

# Check for issues
flutter analyze

# Format code
dart format .
```

## 🏗 Project Structure

```
lib/
├── main.dart                          # App entry point
├── core/
│   ├── constants/
│   │   └── app_constants.dart         # Turkish cities, job categories, etc.
│   ├── router/
│   │   └── app_router.dart           # Navigation routes
│   └── themes/
│       └── app_theme.dart            # Turkish flag-inspired theming
├── features/
│   ├── auth/
│   │   └── presentation/pages/
│   │       ├── login_page.dart       # User authentication
│   │       └── register_page.dart
│   ├── onboarding/
│   │   └── presentation/pages/
│   │       ├── splash_page.dart      # App introduction
│   │       └── onboarding_page.dart
│   ├── jobs/
│   │   ├── data/models/
│   │   │   └── job_model.dart        # Job data structure
│   │   └── presentation/pages/
│   │       └── job_swipe_page.dart   # Main swiping interface
│   ├── applications/
│   │   └── presentation/pages/
│   │       └── applications_page.dart # Application tracking
│   ├── profile/
│   │   └── presentation/pages/
│   │       ├── profile_page.dart     # User profile
│   │       └── profile_setup_page.dart
│   ├── settings/
│   │   └── presentation/pages/
│   │       └── settings_page.dart    # App settings
│   ├── home/
│   │   └── presentation/pages/
│   │       └── main_page.dart        # Bottom navigation
│   └── localization/
│       └── app_localizations.dart    # Turkish translations
```

## 🎨 UI/UX Features

### **Turkish Design Elements**
- Red and white color scheme inspired by Turkish flag
- Clean, modern Material Design 3 interface
- Smooth animations and transitions
- Responsive design for different screen sizes

### **Swiping Interface**
- Card-based job presentation
- Intuitive gesture controls
- Visual feedback for swipe actions
- Job details with company information

### **Navigation**
- Tab-based bottom navigation
- Consistent header design
- Smooth page transitions
- User-friendly back navigation

## 📊 Sample Data

The app currently includes sample Turkish job listings:

- **Senior Flutter Developer** at TechCorp Türkiye (İstanbul)
- **UI/UX Designer** at Design Studio İstanbul
- **Backend Developer** at StartupTech (Ankara, Remote)

Each job includes:
- Company information and logo placeholder
- Salary range in Turkish Lira (TL)
- Work type (Remote, Hybrid, On-site)
- Required skills and experience level
- Detailed job description

## 🔮 Future Enhancements

### **AI Integration**
- Automatic CV parsing from PDF/DOC files
- AI-generated cover letters using OpenAI GPT
- Smart matching based on skills and experience
- Automated form filling for job applications

### **Job Board Integration**
- Real-time job fetching from Kariyer.net
- LinkedIn Jobs API integration
- Indeed and other international platforms
- Company data enrichment

### **Advanced Features**
- Video interview scheduling
- Salary negotiation assistant
- Career path recommendations
- Professional networking

### **Turkish Market Specific**
- KVKK (Turkish GDPR) compliance
- Turkish banking integration
- Local tax and salary calculations
- Turkish company database

## 📞 Support & Contributing

This is a demonstration project showcasing a comprehensive Turkish job search application. The codebase is structured for easy extension and customization.

### **Next Steps for Production**
1. Set up Firebase project for authentication and data storage
2. Obtain API keys for job boards (Kariyer.net, LinkedIn, etc.)
3. Implement OpenAI integration for AI features
4. Add real-time job data fetching
5. Implement application automation features
6. Add comprehensive testing suite

---

**Built with Flutter for the Turkish job market** 🇹🇷ation_1

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# swipe_work
