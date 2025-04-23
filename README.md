
# Onyx Delivery App - Flutter Task

A delivery assistant mobile app built using Flutter. This app is designed for delivery personnel to manage their delivery orders including logging in, viewing, filtering, updating invoice statuses, and switching between languages dynamically. It also supports offline data persistence and session handling.


# Features
- Delivery login using ID and password.
- Fetch delivery bills from a remote API.
- Filter invoices by delivery status (e.g., New).
- Update delivery status with return reasons.
- Save invoices locally using SQLite for offline access.
- Switch between Arabic and English with real-time UI updates.
- Session timeout that logs out the user after 2 minutes of inactivity.

#Tech Stack
- Flutter 3.x
- Dart
- GetX (for state management, routing, and localization)
- Dio (for API communication)
- Sqflite (for local database)
- GetStorage (for lightweight key-value storage)


# Software Design Choices

 1. State Management: GetX
- Selected for its minimal boilerplate, high performance, and built-in navigation, localization, and storage support.
- Used `RxList`, `RxBool`, and `Obx` for reactive UI updates.

2. Architecture: MVVM
- Separated Models, Views, and ViewModels (Controllers) for clear code structure and maintainability.
- Business logic is handled inside `Controllers`, and UI rendering in dedicated `Views`.

3. Local Storage: SQLite + GetStorage
- SQLite was used for storing invoice data locally to support offline operations.
- GetStorage was used to persist user preferences like language and login session.

4. Internationalization 
- Used GetX’s translation system for instant language switching without app restart.
- Language preferences are stored in `GetStorage` and applied on app start.

5. Session Timeout
- Implemented using `WidgetsBindingObserver` and a `Timer` to detect inactivity.
- Automatically logs the user out and clears session data after 2 minutes of inactivity or when app goes to background.



# How to Run
1. Run `flutter pub get`
2. Launch app using `flutter run`

 Make sure the device is connected to the internet and the API endpoints are reachable.


# Screens Implemented
- Login Screen with language switch
- Home Screen with TabBar (New / Orders)
- Language Selector with Dialog options
- Auto Logout after inactivity (Session Timeout)
