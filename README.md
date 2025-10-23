# Flutter Riverpod Tutorials - Episode 03: Todo App with Riverpod

This branch contains the complete implementation of a Todo App using Flutter and Riverpod state management. This is Episode 03 of the Flutter Riverpod tutorial series.

## What You'll Learn

- Building a complete Todo App with Riverpod
- Using StateProvider for state management
- Best practices for Flutter app architecture with Riverpod
- Managing todo items (add, toggle, delete)

## Features

- ✅ Add new todos
- ✅ Mark todos as complete/incomplete
- ✅ Delete todos
- ✅ Clean and responsive UI
- ✅ State management with Riverpod

## Getting Started

### Prerequisites

- Flutter SDK (version 3.7.2 or higher)
- An IDE (VS Code, Android Studio, or IntelliJ)
- Basic knowledge of Flutter and Dart

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/hasan7575/flutter_riverpod_tutorials.git
   ```

2. Switch to this episode's branch:
   ```bash
   git checkout episode-03-todo-app-riverpod
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart                 # Main application entry point
├── models/
│   └── todo_model.dart      # Todo data model
├── pages/
│   └── todo_home_page.dart  # Main todo page UI
└── providers/
    └── todo_provider.dart   # Riverpod providers for state management
```

## Key Concepts Covered

- **StateProvider**: Managing simple state with Riverpod
- **Model Classes**: Creating structured data models
- **Provider Consumer**: Reading and updating state in widgets
- **State Management**: Best practices for managing app state

## Commands

- `flutter run` - Run the app in debug mode
- `flutter test` - Run tests
- `flutter analyze` - Run static analysis
- `flutter build apk` - Build Android APK
- `flutter build ios` - Build iOS app

## Tutorial Series

This is part of a comprehensive Flutter Riverpod tutorial series:

- Episode 01: Introduction to Riverpod
- Episode 02: StateProvider Basics  
- **Episode 03: Todo App with Riverpod** (Current)
- More episodes coming soon...

## Support

If you have any questions or issues:
- Create an issue in this repository
- Check the [Flutter documentation](https://docs.flutter.dev/)
- Review the [Riverpod documentation](https://riverpod.dev/)

## License

This project is for educational purposes as part of the Flutter Riverpod tutorial series.
