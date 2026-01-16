# CSMS Architecture Guide

This document codifies the architectural decisions and boundary rules for the CSMS Attendance System.

## Table of Contents
1. [Project Overview](#project-overview)
2. [Clean Architecture Layers](#clean-architecture-layers)
3. [Feature Boundaries](#feature-boundaries)
4. [Naming Conventions](#naming-conventions)
5. [Multi-App Strategy](#multi-app-strategy)
6. [Sync & Offline Strategy](#sync--offline-strategy)
7. [Conflict Resolution](#conflict-resolution)

---

## Project Overview

### Non-Negotiables
- **Offline-first:** All reads are local-first (Hive). Writes save locally immediately and sync in background.
- **Zero data loss:** Every write must show **Saved to Device** vs **Synced to Cloud** state.
- **Conflict protocol:** If two servants submit different statuses for the same student/session, the record becomes **Flagged for Review** (do NOT overwrite automatically). Admin resolves via side-by-side comparison.
- **UX:** Attendance marking must feel instant (optimistic UI, background work). Tone is formal & direct.

### Tech Stack
| Component | Technology |
|-----------|------------|
| Frontend | Flutter (Android/iOS/Web) |
| State Management | Bloc / Cubit |
| Local DB | Hive |
| Backend | Firebase (Auth, Firestore, Cloud Functions) |
| DI | GetIt + Injectable |
| Routing | Auto Route |

---

## Clean Architecture Layers

Each feature follows a strict layered structure:

```
feature/
├── data/              # Data layer
│   ├── datasources/   # Remote & Local data sources
│   │   ├── local/     # Hive-based local storage
│   │   └── remote/    # Firestore API calls (or cloud/)
│   ├── dtos/          # Data Transfer Objects (JSON serialization)
│   ├── mappers/       # DTO <-> Entity conversions
│   ├── models/        # Local data models (if needed)
│   └── repositories/  # Repository implementations
├── domain/            # Domain layer (pure business logic)
│   ├── entities/      # Business entities
│   ├── repositories/  # Abstract repository interfaces
│   └── usecases/      # Use case classes
└── presentation/      # Presentation layer
    ├── bloc/          # Bloc/Cubit state management
    ├── pages/         # Screen widgets
    └── widgets/       # Feature-specific widgets
```

### Layer Dependencies
- **Domain:** No dependencies (pure Dart)
- **Data:** Depends only on Domain
- **Presentation:** Depends on Domain (and Application if present)

### Core vs Shared vs Features

| Layer | Purpose | Flutter UI? |
|-------|---------|-------------|
| `core/` | Pure Dart infrastructure, utilities, services | ❌ No |
| `shared/` | Reusable Flutter widgets | ✅ Yes |
| `features/` | Business domain features | ✅ Yes |

---

## Feature Boundaries

### `users` vs `servants`

| Feature | Scope | Responsibility |
|---------|-------|----------------|
| `users` | Self/Me | "Update *my* profile", "View *my* assigned classes" |
| `servants` | Directory/Admin | "Assign Servant A to Grade 5", "View all servants" |

**Rule:** Servant Mobile App should NOT compile `servants` management screens.

### `attendance` vs `reports`

| Feature | Focus | State |
|---------|-------|-------|
| `attendance` | Write-intensive | Real-time sync status |
| `reports` | Read-only | Aggregated queries |

### `conflicts`
Admin-only feature for resolving attendance discrepancies.

### `notifications`
Cross-cutting feature for alerts and in-app notifications.

---

## Naming Conventions

### Files
| Type | Convention | Example |
|------|------------|---------|
| Entity | `noun.dart` | `user.dart`, `attendance_record.dart` |
| DTO | `noun_dto.dart` | `user_dto.dart` |
| Model | `noun_model.dart` | `user_model.dart` |
| Mapper | `noun_mapper.dart` | `user_mapper.dart` |
| Repository Interface | `noun_repository.dart` | `user_repository.dart` |
| Repository Impl | `noun_repository_impl.dart` | `user_repository_impl.dart` |
| Use Case | `verb_noun_usecase.dart` | `get_user_usecase.dart` |
| Bloc | `noun_bloc.dart` | `auth_bloc.dart` |
| Page | `noun_page.dart` | `login_page.dart` |

### Classes
- Classes: `PascalCase`
- Functions/Variables: `camelCase`
- Constants: `camelCase` or `SCREAMING_SNAKE_CASE` for true constants
- Files: `snake_case`

### Anti-Patterns to Avoid
- ❌ `app_user.dart` AND `user_entity.dart` (pick one)
- ❌ `auth/services/bloc/` (use `auth/presentation/bloc/`)
- ❌ Dumping ground `utils.dart` with 50+ functions

---

## Multi-App Strategy

### Two Entrypoints

| File | Purpose | Platform |
|------|---------|----------|
| `main_servant.dart` | Servant Mobile App | Android/iOS |
| `main_admin.dart` | Admin Web Portal | Web |

### Bootstrap Flow
```
main_servant.dart
    └── bootstrap/bootstrap_servant.dart
        └── bootstrap/bootstrap_common.dart
            └── apps/servant/servant_app.dart

main_admin.dart
    └── bootstrap/bootstrap_admin.dart
        └── bootstrap/bootstrap_common.dart
            └── apps/admin/admin_app.dart
```

### Benefits
1. Tree-shaking admin code from mobile bundle
2. Different DI modules per platform
3. Security: mobile app doesn't have admin screen code

---

## Sync & Offline Strategy

### Sync Status Enum
```dart
enum SyncStatus {
  savedToDevice,     // Local save successful, pending sync
  syncing,           // Upload in progress
  syncedToCloud,     // Successfully synced
  syncFailed,        // Failed, user action required
  conflictDetected,  // Conflict, admin review required
}
```

### Data Flow
1. **Write:** User action → Save to Hive → Queue for sync → Update UI optimistically
2. **Sync:** Background service → Upload to Firestore → Update sync status
3. **Read:** Always from Hive first, then refresh from Firestore if online

### Visual Indicators
Every syncable entity must display its sync status using `SyncIndicator` widget.

---

## Conflict Resolution

### Detection
1. Servant A marks Student X as "Present"
2. Servant B marks Student X as "Absent" for the same session
3. Cloud Function detects conflict on `attendance_records` write
4. Creates `conflict_cases/{id}` document
5. Sends FCM notification to all admins

### Resolution
1. Admin sees notification badge
2. Opens conflict list page
3. Views side-by-side comparison (ConflictComparisonCard)
4. Chooses correct version
5. System updates attendance record, marks conflict as resolved
6. Audit log entry created

### Key Entities
- `ConflictCase`: The conflict metadata
- `ConflictVersion`: Each conflicting data version
- `ConflictResolution`: The admin's decision

---

## Firebase Structure

### Collections
```
/users/{userId}
/students/{studentId}
/attendance_sessions/{sessionId}
/attendance_records/{recordId}
/conflict_cases/{conflictId}
/notifications/{notificationId}
/audit_logs/{logId}
```

### Cloud Functions
- `onAttendanceWrite`: Trigger on attendance_records write, detect conflicts
- `notifyAdminOnConflict`: Trigger on conflict_cases create, send notifications

### Security Rules
See `firebase/firestore.rules` for role-based access control.

---

## Quality Gates

Before marking any task complete:
- [ ] Code follows this architecture guide
- [ ] No duplicate entities across features
- [ ] Sync status is displayed for all syncable data
- [ ] Conflicts are flagged, not overwritten
- [ ] Tests cover happy path and error cases
