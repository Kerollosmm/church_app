# Comprehensive File Audit Report (Final)

## Executive Summary

After thorough review of all file purposes and comments, the following issues were identified. This report groups files by category and provides clear recommendations.

---

## CATEGORY 1: DUPLICATE FIRESTORE CONSTANTS

### Problem: `firestore_paths.dart` exists in TWO locations

| Location | Purpose |
|----------|---------|
| `lib/core/constants/firestore_paths.dart` | "Collection paths, helper methods for subcollection paths" |
| `lib/core/firebase/firestore_paths.dart` | "Centralizes Firestore path construction" |

**Same Purpose!**

### Problem: `firestore_fields` exists in TWO locations

| Location | Purpose |
|----------|---------|
| `lib/core/constants/firestore_fields.dart` | "Constants for Firestore document fields" |
| `lib/core/firebase/firestore_field_names.dart` | "Defines canonical field names for Firestore" |

**Same Purpose!**

### Recommendation

- KEEP `lib/core/firebase/` as the home for all Firestore-related constants
- DELETE:
  - `lib/core/constants/firestore_paths.dart`
  - `lib/core/constants/firestore_fields.dart`
  - `lib/core/constants/firestore_collections.dart` (use firebase/firestore_paths instead)
  - `lib/core/constants/firebase_constants.dart` (EMPTY)

---

## CATEGORY 2: DUPLICATE DEPENDENCY INJECTION

| File | Purpose |
|------|---------|
| `lib/core/di/injection.dart` | "Main entry point for DI setup, configure GetIt" |
| `lib/core/di/injection_container.dart` | "Sets up DI using GetIt, registers all..." |

**Same Purpose!**

### Recommendation

- KEEP `injection.dart` (more specific name)
- DELETE `injection_container.dart`

---

## CATEGORY 3: DUPLICATE CONNECTIVITY/NETWORK

THREE files for checking network connectivity!

| File | Location | Purpose |
|------|----------|---------|
| `connectivity_checker.dart` | `lib/core/utils/` | EMPTY |
| `connectivity_service.dart` | `lib/core/sync/` | "TODO: Implement Connectivity Service" |
| `network_info.dart` | `lib/core/sync/` | "Wrapper for InternetConnectionChecker" |

**Overlap!**

### Recommendation

- KEEP `network_info.dart` (has clear purpose, in correct sync location)
- DELETE `connectivity_checker.dart` (empty)
- DELETE `connectivity_service.dart` (duplicate of network_info)

---

## CATEGORY 4: DUPLICATE DATE UTILITIES

| File | Location | Content |
|------|----------|---------|
| `date_formatter.dart` | `lib/core/utils/` | EMPTY |
| `date_time_utils.dart` | `lib/core/utils/` | "TODO: Implement DateTime Utils" |

### Recommendation

- KEEP `date_time_utils.dart`
- DELETE `date_formatter.dart` (empty)

---

## CATEGORY 5: EMPTY FILES (Delete All)

| File | Location |
|------|----------|
| `firebase_constants.dart` | `lib/core/constants/` |
| `storage_keys.dart` | `lib/core/constants/` |
| `date_formatter.dart` | `lib/core/utils/` |
| `connectivity_checker.dart` | `lib/core/utils/` |
| `user_role.dart` | `lib/features/auth/domain/entities/` |
| `report_repository_impl.dart` | `lib/features/reports/data/repositories/` |
| `report_remote_datasource.dart` | `lib/features/reports/data/datasources/` |
| `attendance_report_entity.dart` | `lib/features/reports/domain/entities/` |

---

## CATEGORY 6: EMPTY FOLDERS (Delete)

| Folder |
|--------|
| `lib/core/security/` |

---

## FINAL DELETION LIST

### Files to Delete (17 total)

1. `lib/core/constants/firestore_paths.dart` (duplicate)
2. `lib/core/constants/firestore_fields.dart` (duplicate)
3. `lib/core/constants/firestore_collections.dart` (duplicate)
4. `lib/core/constants/firebase_constants.dart` (empty)
5. `lib/core/constants/storage_keys.dart` (empty)
6. `lib/core/di/injection_container.dart` (duplicate)
7. `lib/core/utils/date_formatter.dart` (empty)
8. `lib/core/utils/connectivity_checker.dart` (empty)
9. `lib/core/sync/connectivity_service.dart` (duplicate)
10. `lib/features/auth/domain/entities/user_role.dart` (empty)
11. `lib/features/reports/data/repositories/report_repository_impl.dart` (empty)
12. `lib/features/reports/data/datasources/report_remote_datasource.dart` (empty)
13. `lib/features/reports/domain/entities/attendance_report_entity.dart` (empty)

### Folders to Delete (1 total)

1. `lib/core/security/` (empty)

---

## STRUCTURE AFTER CLEANUP

### Single Source of Truth

| Concern | Location |
|---------|----------|
| Firestore Paths | `lib/core/firebase/firestore_paths.dart` |
| Firestore Fields | `lib/core/firebase/firestore_field_names.dart` |
| DI Setup | `lib/core/di/injection.dart` |
| Network Check | `lib/core/sync/network_info.dart` |
| User Roles | `lib/core/constants/roles.dart` |
| Date Utils | `lib/core/utils/date_time_utils.dart` |
