# CSMS Project Structure & File Guide

This document outlines the Feature-First Clean Architecture implemented in the Church Servants Management System (CSMS).

## 📂 Root Directory
- `pubspec.yaml` - Package dependencies and asset declarations.
- `analysis_options.yaml` - Linter rules and static analysis configuration.
- `PROJECT_SPECIFICATIONS.md` - Detailed technical and business requirements.
- `KNOWLEDGE_BASE.md` - Project-specific knowledge and architectural decisions.
- `lib/main.dart` - The ultimate entry point of the Flutter application.

---

## 🏗️ Core Layers (`lib/`)

### 1. `app/` - Application Root
- `app.dart`: The `MaterialApp` configuration, including themes and routing.
- `bootstrap.dart`: Handles zones, error reporting, and global initialization.
- `di/`: Dependency Injection registration for features.
  - `injector.dart`
  - `registrations.dart`

### 2. `core/` - Shared Infrastructure
- `audit/`: Tracking user actions and system changes.
- `config/`: Environment flavors (Development, Production) and build info.
- `constants/`: Global strings, keys, and fixed values.
- `errors/`: Unified Exception and Failure handling classes.
- `extensions/`: Context, Date, and String productivity extensions.
- `firebase/`: Firestore converters, paths, and refs.
- `local_storage/`:
  - `hive/`: Local NoSQL store for "Offline-First" capability.
  - `sqlite/`: Local SQL store for complex relational queries.
- `offline_sync/`: The logic for background data synchronization.
- `theme/`: Design tokens, Material 3 configurations, and custom extensions.

### 3. `shared/` - Common UI Components
- `widgets/`:
  - `dialogs/`: Error, Success, and Confirmation dialogs.
  - `inputs/`: Branded text fields, buttons, and pickers.
  - `loaders/`: Sleek loading indicators and skeletons.

### 4. `features/` - Business Domains
Each feature is isolated into its own layer following Clean Architecture:
- `data/`: Repositories implementations, DataSources (Remote/Local), and DTOs.
- `domain/`: Business entities, Repository interfaces, and Use Cases.
- `presentation/`: BLoCs/Cubits, Screens, and Feature-specific widgets.

#### Feature List:
- **`auth/`**: Login, Registration, Password Reset, and Session Management.
- **`splash/`**: Branding and initial app-state checking.
- **`home/`**: The main dashboard and navigation hub.
- **`attendance/`**: High-performance attendance marking with offline support.
- **`students/`**: Management of student records and history.
- **`servants/`**: Management of servant profiles and roles.
- **`reports/`**: Analytics, export functionality, and summary views.
- **`users/`**: Profile settings and preferences.

---

## 🛠️ Automated Setup Script
You can use the following PowerShell command to ensure the entire directory structure exists.

```powershell
# Run this from the project root to ensure all folders are present
$folders = @(
    "lib/app/di",
    "lib/core/audit", "lib/core/config", "lib/core/constants", "lib/core/errors", "lib/core/extensions", "lib/core/firebase", "lib/core/local_storage/hive", "lib/core/local_storage/sqlite", "lib/core/logging", "lib/core/offline_sync", "lib/core/theme", "lib/core/utils",
    "lib/shared/widgets/dialogs", "lib/shared/widgets/inputs", "lib/shared/widgets/loaders",
    "lib/features/auth/data", "lib/features/auth/domain", "lib/features/auth/presentation",
    "lib/features/splash/presentation",
    "lib/features/home/presentation",
    "lib/features/attendance/data", "lib/features/attendance/domain", "lib/features/attendance/presentation",
    "lib/features/students/data", "lib/features/students/domain", "lib/features/students/presentation",
    "lib/features/servants/data", "lib/features/servants/domain", "lib/features/servants/presentation",
    "lib/features/reports/data", "lib/features/reports/domain", "lib/features/reports/presentation",
    "lib/features/users/data", "lib/features/users/domain", "lib/features/users/presentation"
)

foreach ($folder in $folders) {
    New-Item -ItemType Directory -Force -Path $folder
}
```
