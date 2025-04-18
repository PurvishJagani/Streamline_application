# Streamline_app

📱 App Overview
Streamline Application is a fully functional Flutter authentication app built with clean architecture and smooth navigation. It integrates modern authentication methods and local data handling to deliver a seamless user experience.

✨ Core Features:
🔐 Google Sign-In & Email Authentication
Authenticate users securely using Firebase with both Google and Email/Password methods.

📲 Account Management
Supports account creation, login, and logout functionalities with proper validations.

🔄 Animated Screen Transitions
Smooth and interactive animations between screens enhance user engagement and provide a polished feel.

📦 Local Data Persistence
Uses SharedPreferences to store login status and other user preferences locally.

🧭 Structured Navigation Flow
Clean and intuitive navigation between splash, onboarding, login, sign-up, and home screens.

=============================================================================================================

Streamline_application/
├── android/                
├── app/                   
├── assets/                
│   ├── fonts/              # Custom fonts used in the app
│   └── images/             # App images
│       ├── home/           
│       ├── intro/          
│       ├── login/          
│       ├── setting/        
│       └── splash/         
├── gradle/                
├── ios/                   
lib/
├── models/
│   └── Slide.dart
├── screens/
│   ├── create_account_screen.dart
│   ├── home_screen.dart
│   ├── intro_screen.dart
│   ├── login_screen.dart
│   ├── settings_screen.dart
│   ├── sign_in_screen.dart
│   └── splash_screen.dart
├── utils/
│   ├── auth_service.dart
│   ├── loading_screen.dart
│   ├── press_unpress.dart
│   └── SharedPreferencesUtils.dart
└── main.dart
├── test/                  
├── .gitignore             
├── README.md              
├── pubspec.yaml           
├── pubspec.lock           
├── analysis_options.yaml  
├── settings.gradle.kts    
└── build.gradle.kts  

