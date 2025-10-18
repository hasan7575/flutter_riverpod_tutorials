# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter application project with a standard starter template. The project follows Flutter's conventional structure with cross-platform support for Android, iOS, web, Windows, macOS, and Linux.

## Development Commands

### Core Commands
- `flutter run` - Run the app in debug mode on connected device/emulator
- `flutter run --release` - Run the app in release mode
- `flutter hot-reload` - Hot reload changes (automatic in debug mode)
- `flutter hot-restart` - Hot restart the app

### Building
- `flutter build apk` - Build Android APK
- `flutter build ios` - Build iOS app
- `flutter build web` - Build web app
- `flutter build windows` - Build Windows app
- `flutter build macos` - Build macOS app
- `flutter build linux` - Build Linux app

### Testing and Analysis
- `flutter test` - Run all unit and widget tests
- `flutter analyze` - Run static analysis (linting)
- `flutter pub get` - Get dependencies
- `flutter pub upgrade` - Upgrade dependencies
- `flutter doctor` - Check Flutter installation and dependencies

## Project Structure

- `lib/main.dart` - Main application entry point with Material Design counter app
- `test/widget_test.dart` - Widget tests for the main app functionality
- `pubspec.yaml` - Dependencies and project configuration
- `analysis_options.yaml` - Dart/Flutter linting rules configuration

## Architecture

This is a basic Flutter app with:
- Material Design theme using `ColorScheme.fromSeed` with deep purple
- StatefulWidget pattern for the main page with counter state
- Standard Flutter project structure with platform-specific folders (android/, ios/, web/, etc.)

## Dependencies

- **flutter**: Core Flutter SDK
- **cupertino_icons**: iOS-style icons
- **flutter_test**: Testing framework (dev dependency)
- **flutter_lints**: Recommended linting rules (dev dependency)

## Configuration

- Dart SDK version: ^3.7.2
- Uses Material Design with Material Icons
- Flutter lints package provides recommended coding standards
- Analysis options configured to use flutter_lints rules