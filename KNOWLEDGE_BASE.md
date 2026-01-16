# CSMS Knowledge Base

## 📚 Project Overview

**Church Servants Management System** - A Flutter app for managing servant attendance and term results with offline-first capabilities.

---

## 🏗️ Architecture

### Clean Architecture Layers

```
UI Layer (Flutter Widgets)
       ↓
State Management (BLoC)
       ↓
Use Cases (Business Logic)
       ↓
Repository Interface (Domain)
       ↓
Repository Implementation (Data)
       ↓
Data Sources (Remote: Firestore | Local: Hive)
```

---

## 📁 Folder Structure Purpose

### Core Layer (`lib/core/`)

| Folder | Purpose | ⚠️ Care About |
|--------|---------|---------------|
| `audit/` | Logs all user actions to Firestore | Always log BEFORE the action completes |
| `constants/` | App-wide constants, Firebase collection names | Never hardcode strings elsewhere |
| `di/` | Dependency injection with GetIt | Register ALL dependencies here |
| `errors/` | Custom exceptions and failure classes | Throw exceptions in data layer, return Failures in domain |
| `extensions/` | Dart extension methods | Keep extensions pure, no side effects |
| `router/` | GoRouter navigation config | All routes must be defined here |
| `storage/` | Hive + Secure Storage services | **CRITICAL**: Always encrypt sensitive data |
| `sync/` | Offline sync engine | Handle conflicts carefully |
| `theme/` | Colors, typography, spacing | Use theme tokens, never hardcode colors |
| `utils/` | Validators, formatters | Keep utility functions stateless |

### Features Layer (`lib/features/`)

| Feature | Purpose | ⚠️ Care About |
|---------|---------|---------------|
| `auth/` | Firebase Auth + token caching | Store tokens in secure_storage, not Hive |
| `servants/` | Servant profiles (CRUD) | uid is Firebase Auth ID |
| `attendance/` | Mark/view attendance | **OFFLINE-FIRST**: Save to Hive immediately |
---

## 🔐 Security Rules

### Authentication
- JWT tokens → `secure_storage.dart` (encrypted)
- User session → `auth_local_datasource.dart` (Hive)
- **NEVER** store passwords locally

### Firestore Security
```javascript
// Servants can only read their own data
match /servants/{uid} {
  allow read, write: if request.auth.uid == uid;
}

// Attendance: Servants can mark, all can read
match /attendance/{docId} {
  allow read: if request.auth != null;
  allow write: if request.auth.token.role in ['admin', 'servant'];
}
```

---

## 🔄 Offline-First Strategy

### Data Flow (CRITICAL)
```
User Action
    ↓
1. Save to Hive IMMEDIATELY (with needsSync: true)
    ↓
2. Show success to user (instant feedback)
    ↓
3. Check connectivity
    ↓
4. If ONLINE → sync to Firestore → set needsSync: false
   If OFFLINE → SyncManager will retry later
```

### ⚠️ Sync Conflicts
When syncing, always:
1. Compare `updatedAt` timestamps
2. Server wins if server is newer
3. Log conflicts to audit_logs

---

## 📊 Firestore Collections

| Collection | Document ID | Key Fields |
|------------|-------------|------------|
| `servants` | Firebase UID | name, role, department, barcode_id
| `attendance` | Auto-generated | service_date, present_servants_ids (Array), synced_at |
| `audit_logs` | Auto-generated | action, user_id, timestamp |

---

## 🧪 Testing Guidelines

### Unit Tests
- Test all repositories with mock data sources
- Test BLoCs with mock repositories
- Test use cases with mock repositories

### Integration Tests
- Test offline → online sync flow
- Test login → cache → offline login flow

---

## ⚠️ Common Pitfalls

| Problem | Solution |
|---------|----------|
| Data not syncing | Check `needsSync` flag in Hive |
| Auth token expired | Implement token refresh in `auth_remote_datasource` |
| Duplicate attendance | Check `service_date` before creating new record |
| Slow list loading | Use Hive first, then refresh from Firestore |
| Memory leaks | Always close BLoC streams |

---

## 📝 Code Style

- Follow `Gemini.md` Dart style guide
- Use `///` doc comments on all public APIs
- Keep functions under 20 lines
- Use meaningful names, no abbreviations
