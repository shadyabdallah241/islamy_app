# 🕌 Islamy

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter" />
  <img src="https://img.shields.io/badge/Hive-FFCA28?style=for-the-badge&logo=database&logoColor=black" alt="Hive" />
  <img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" alt="License" />
</p>

<p align="center">
  A comprehensive Islamic companion app built with Flutter — bringing the Quran, Hadith, Azkar, prayer times, and more into a single, modern, offline-friendly experience.
</p>

---

## 📖 Table of Contents

- [Features](#-features)
- [Screens](#-screens)
- [Screenshots](#-screenshots)
- [Tech Stack](#-tech-stack)
- [Getting Started](#-getting-started)
- [Project Structure](#-project-structure)
- [Assets](#-assets)
- [Roadmap](#-roadmap)
- [Contributing](#-contributing)
- [License](#-license)

---

## ✨ Features

| Feature              | Description                                                                 |
|----------------------|-----------------------------------------------------------------------------|
| 📗 **Quran**         | Browse all 114 Surahs with a dedicated details screen for reading each one. |
| 📜 **Hadeth**        | Explore a curated collection of Prophetic Hadiths.                          |
| 📿 **Sebha**         | A digital Tasbih counter to track your Dhikr effortlessly.                  |
| 📻 **Radio**         | Stream a variety of live Islamic radio stations.                            |
| 🌅 **Azkar**         | Morning and Evening Azkar for consistent daily spiritual practice.          |
| 🕐 **Prayer Times**  | Stay on top of daily prayer timings.                                        |
| 🌙 **Dark Mode**     | A polished dark theme for comfortable reading at night.                     |
| 💾 **Local Storage** | Fast, efficient offline data persistence powered by Hive.                   |

## 📱 Screens

- **Splash Screen** — Elegant entry point into the app.
- **Intro Screen** — Onboarding walkthrough for first-time users.
- **Home Screen** — Central navigation hub with tabs for Quran, Hadeth, Sebha, Radio, and Prayer
  Times.
- **Sura Details** — Focused reading view for individual Surah content.
- **Azkar Screen** — Dedicated space for daily Morning/Evening Azkar.

## 📸 Screenshots

> Add screenshots or a short demo GIF here to give users a preview of the app.

| Home         | Quran        | Azkar        |
|--------------|--------------|--------------|
| _screenshot_ | _screenshot_ | _screenshot_ |

## 🛠 Tech Stack

- **Framework:** [Flutter](https://flutter.dev/)
- **Database:
  ** [Hive](https://pub.dev/packages/hive) & [Hive Flutter](https://pub.dev/packages/hive_flutter)
- **UI Components:** Carousel Slider, Google Fonts
- **Preferences/State:** Shared Preferences

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (stable channel)
- A configured emulator/simulator or physical device

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/islamy.git
   cd islamy
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📂 Project Structure

```
lib/
├── models/          # Data models (Surah, Hadith, Zekr, etc.)
├── screens/         # App screens (Home, Splash, Sura Details, Azkar...)
├── widgets/         # Reusable UI components
├── cubit/ or bloc/  # State management (if applicable)
├── constants/       # Colors, strings, and shared constants
└── main.dart        # App entry point
```

> Adjust this tree to match your actual folder layout.

## 🎨 Assets

- Quranic text and Hadith data files.
- Custom fonts, including **Janna LT**.
- Specialized Islamic-themed images and icons.

## 🗺 Roadmap

- [ ] Qibla direction compass
- [ ] Multi-language support (Arabic/English toggle)
- [ ] Bookmark and favorites for Surahs/Azkar
- [ ] Push notifications for prayer times

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!
Feel free to check the [issues page](https://github.com/yourusername/islamy/issues) or submit a pull
request.

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

<p align="center"><i>This project was built as part of a Flutter development course assignment.</i></p>