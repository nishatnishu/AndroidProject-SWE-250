# 🌍 TrekMate – Travel Companion

**TrekMate** is a cross-platform mobile travel companion application designed to help users discover destinations, explore places by category, save their favorite locations, and plan trips with an intuitive and personalized experience.

The application combines **Flutter**, **Firebase**, and **Google Maps** to provide authentication, personalized profiles, destination discovery, location-based features, and interactive travel tools in a single platform.

---

## 📱 Preview

A preview of the TrekMate application is available below.

### 🎥 Application Preview

[▶️ Watch TrekMate Preview](https://drive.google.com/file/d/1eIUSepsB1oiingRTYBct9fQaTgbQAEtu/view?usp=drive_link)

The preview demonstrates the application's user interface, navigation flow, authentication, destination discovery, category-based exploration, saved places, and other core functionalities.

---

## 📦 Download APK

You can download and install the latest Android APK from the link below:

### [⬇️ Download TrekMate APK](https://drive.google.com/file/d/1OcCPx2e-ExGGCsojCBaL6vpcgfgZ51fy/view?usp=drive_link)

> **Note:** Enable installation from unknown sources on your Android device if required by your device's security settings.

---

## ✨ Key Features

### 🔐 User Authentication & Profiles

* Secure email and password authentication
* Google Sign-In integration
* Email verification for newly registered users
* Personalized user profiles
* User preference management
* Favorite destination management

### 🗺️ Destination Discovery

TrekMate provides users with an organized platform for discovering new destinations and travel experiences.

* Popular and trending destinations
* Curated travel recommendations
* Destination search and exploration
* Detailed destination information
* Category-based browsing

### 🧭 Travel Categories

Users can explore destinations based on their interests:

| Category          | Description                                                                 |
| ----------------- | --------------------------------------------------------------------------- |
| 🏞️ **Adventure** | Hiking, outdoor activities, water sports, and other adventurous experiences |
| 🏺 **Culture**    | Museums, historical locations, heritage sites, and local traditions         |
| 🍜 **Food**       | Restaurants, street food, local cuisine, and culinary experiences           |
| 🏨 **Stays**      | Hotels, hostels, resorts, and unique accommodation options                  |

### 📍 Interactive Travel Tools

* Detailed place information
* Destination images
* Place descriptions
* Reviews and ratings
* Google Maps integration
* Location navigation
* Travel tips and recommendations

### 💖 Personalized User Experience

* Onboarding screens for new users
* Personalized home screen
* Interest-based recommendations
* Saved places and bookmarks
* Easy access to previously explored destinations
* Clean and intuitive mobile interface

---

## 🏗️ Application Workflow

The overall user flow of TrekMate can be summarized as:

```text
Launch Application
       │
       ▼
   Onboarding
       │
       ▼
 Authentication
   ┌───┴────┐
   │        │
 Email    Google
 Login    Sign-In
   │        │
   └───┬────┘
       ▼
    Home Screen
       │
       ├───────────────┐
       ▼               ▼
 Discover          Categories
       │               │
       ├───────────────┼───────────────┐
       ▼               ▼               ▼
 Adventure          Culture           Food / Stays
       │               │               │
       └───────────────┴───────────────┘
                       │
                       ▼
                 Place Details
                       │
              ┌────────┴────────┐
              ▼                 ▼
          Save Place        View Map
              │                 │
              └────────┬────────┘
                       ▼
                Personalized Trip
                   Experience
```

---

## 🛠️ Technology Stack

### Frontend

* **Flutter**
* **Dart**

Flutter is used to build the cross-platform mobile application and provide a responsive, consistent user interface.

### Backend & Authentication

* **Firebase Authentication**
* **Cloud Firestore**

Firebase provides authentication, user management, and cloud-based data storage.

### Maps & Location

* **Google Maps API**
* Location and navigation services

Google Maps integration allows users to view destination locations and navigate to selected places.

---

## 🏛️ Architecture & Development

The application follows a modular Flutter project structure to separate UI components, services, models, and application logic.

A simplified structure is:

```text
trek_mate/
│
├── android/
├── ios/
├── lib/
│   ├── models/
│   ├── screens/
│   ├── services/
│   ├── widgets/
│   ├── utils/
│   └── main.dart
│
├── assets/
│   ├── images/
│   └── icons/
│
├── test/
│
├── pubspec.yaml
└── README.md
```

---

## 🔥 Firebase Integration

TrekMate uses Firebase for application backend functionality, including:

* User authentication
* Email/password authentication
* Google authentication
* Email verification
* User profile information
* Cloud data management
* Favorite and saved-place information

---

## 🗺️ Google Maps Integration

Google Maps is integrated into TrekMate to provide location-based functionality.

Users can:

* View destination locations
* Explore places on an interactive map
* Access geographical information
* Navigate toward selected destinations

---

## 🚀 Getting Started

### Prerequisites

Before running the project, make sure the following tools are installed:

* Flutter SDK
* Dart SDK
* Android Studio or Visual Studio Code
* Android SDK
* Git
* A physical Android device or Android Emulator

You can verify your Flutter installation using:

```bash
flutter doctor
```

---

### Clone the Repository

```bash
git clone https://github.com/nishatnishu/trek_mate.git
```

Navigate to the project directory:

```bash
cd trek_mate
```

Install the project dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

---

## ⚙️ Configuration

Before running the application, configure the required Firebase and Google Maps services.

### Firebase

Create a Firebase project and configure:

* Firebase Authentication
* Google Sign-In
* Email/Password Authentication
* Email Verification
* Cloud Firestore

Then add the appropriate Firebase configuration files for the target platform.

### Google Maps

Configure a Google Maps API key for the Android/iOS application and enable the required Maps services in the Google Cloud Console.

> **Security Note:** API keys and Firebase credentials should not be committed to a public repository. Use appropriate restrictions and environment-specific configuration.

---

## 📂 Project Components

| Component      | Purpose                                                    |
| -------------- | ---------------------------------------------------------- |
| Authentication | User registration, login, Google Sign-In, and verification |
| User Profile   | Personalized user information and preferences              |
| Home           | Personalized travel feed and recommendations               |
| Discovery      | Browse and discover destinations                           |
| Categories     | Explore destinations by travel interest                    |
| Place Details  | View destination information and reviews                   |
| Saved Places   | Manage bookmarked destinations                             |
| Maps           | View and navigate to destination locations                 |
| Onboarding     | Introduce new users to the application                     |

---

## 🎯 Project Objectives

The primary objectives of TrekMate are to:

1. Provide a centralized platform for discovering travel destinations.
2. Personalize travel recommendations according to user interests.
3. Simplify destination exploration through category-based browsing.
4. Provide interactive maps and location-based services.
5. Allow users to save and revisit their favorite destinations.
6. Provide a clean and intuitive mobile travel experience.
7. Demonstrate practical implementation of Flutter, Firebase, and Google Maps technologies.

---

## 📸 Application Preview & Demo

| Resource               | Link                                                                                                   |
| ---------------------- | ------------------------------------------------------------------------------------------------------ |
| 🎥 Application Preview | [Watch Preview](https://drive.google.com/file/d/1eIUSepsB1oiingRTYBct9fQaTgbQAEtu/view?usp=drive_link) |
| 📦 Android APK         | [Download APK](https://drive.google.com/file/d/1OcCPx2e-ExGGCsojCBaL6vpcgfgZ51fy/view?usp=drive_link)  |

---

## 🔮 Future Improvements

Potential future enhancements include:

* AI-powered personalized travel recommendations
* Trip itinerary generation
* Weather information for destinations
* Real-time travel alerts
* User-generated destination reviews
* Social features for sharing trips
* Offline destination information
* Multi-language support
* Hotel and transportation booking integration
* Advanced location-based recommendations

---

## 👨‍💻 Author

**Nishat Tasnim**

Software Engineering Student | Mobile Application Developer

### Technologies

`Flutter` · `Dart` · `Firebase` · `Google Maps API`

---

## 📄 License

This project is developed for educational and portfolio purposes.

---

## ⭐ Acknowledgements

* Flutter
* Firebase
* Google Maps Platform
* Dart

---

### 📌 Project Links

**Application Preview:**
https://drive.google.com/file/d/1eIUSepsB1oiingRTYBct9fQaTgbQAEtu/view?usp=drive_link

**APK Download:**
https://drive.google.com/file/d/1OcCPx2e-ExGGCsojCBaL6vpcgfgZ51fy/view?usp=drive_link
