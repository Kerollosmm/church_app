# Target Project Structure

This document defines the single source of truth for the folder structure of the CSMS project.

## Top-Level Directories

### `lib/apps/`
**Purpose**: Contains the "Shell" applications. Each folder here represents a deployable app.
- `servant/`: The Servant Mobile App.
- `admin/`: The Admin Web Portal.
- `student/`: (Future) The Student App.

**Rules**:
- These folders contain the *composition* root (AppWidget, Theme config).
- Minimal logic. Delegates to `features` and `core`.

### `lib/core/`
**Purpose**: Cross-cutting infrastructure and shared utilities.
- `sync/`: The offline-first synchronization engine (Queue, Status, Policies).
- `persistence/`: Local data storage (Hive).
- `di/`: Dependency Injection setup (GetIt).
- `routing/`: Application routers and guards.
- `security/`: RBAC and Auth State management.
- `l10n/`: Localization.

### `lib/features/`
**Purpose**: distinct business domains.
- `attendance_sessions/`: Logic for managing class sessions.
- `attendance_records/`: Logic for individual student attendance records.
- `conflicts/`: Logic for "Flag for Review" conflict resolution.
- `reports/`: Analytics and reporting.
- `auth/`: Authentication features.

## Detailed Tree

```
lib/
├── apps/
│   ├── servant/            # Mobile App Shell
│   └── admin/              # Web App Shell
├── bootstrap/              # App Startup Logic
├── core/
│   ├── constants/          # App-wide constants (Firestore collections, etc.)
│   ├── di/                 # Dependency Injection
│   ├── persistence/        # Local Database (Hive)
│   ├── routing/            # Routers (GoRouter/AutoRoute)
│   │   └── guards/         # Security Guards (RoleGuard)
│   ├── security/           # Roles & Permissions
│   ├── sync/               # Offline-First Sync Engine
│   └── ui/                 # Shared UI (Loaders, Dialogs, SyncBadges)
├── features/
│   ├── attendance_records/
│   ├── attendance_sessions/
│   ├── auth/
│   ├── conflicts/
│   ├── notifications/
│   ├── profile/
│   ├── reports/
│   ├── servants/
│   ├── students/
│   └── users/
├── main_admin.dart         # Entrypoint for Admin Web
└── main_servant.dart       # Entrypoint for Servant Mobile
```
