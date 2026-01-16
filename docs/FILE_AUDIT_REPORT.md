# File Audit Report: Duplicates & Unnecessary Files

## Summary
This report identifies files that have overlapping purposes or are unnecessary. The goal is to eliminate duplication and establish clear ownership.

---

## 1. DUPLICATE: `roles.dart`

| File | Location | Content |
|------|----------|---------|
| roles.dart | `lib/core/constants/` | `enum UserRole { admin, student, servant }` |
| roles.dart | `lib/core/security/` | Comment-only skeleton |

**Recommendation**: DELETE `lib/core/security/roles.dart`. Keep `lib/core/constants/roles.dart` as the source of truth for the `UserRole` enum.

---

## 2. DUPLICATE: `sync_engine.dart`

| File | Location | Content |
|------|----------|---------|
| sync_engine.dart | `lib/core/offline_sync/` | Comment skeleton |
| sync_engine.dart | `lib/core/sync/` | Comment skeleton |

**Recommendation**: DELETE `lib/core/offline_sync/sync_engine.dart`. (Also consider merging entire `offline_sync` folder into `sync`). Keep `lib/core/sync/sync_engine.dart` as the source of truth.

---

## 3. DUPLICATE DI: `service_locator.dart` vs `injection.dart`

| File | Location | Purpose |
|------|----------|---------|
| service_locator.dart | `lib/core/di/` | "Service Locator pattern" |
| injection.dart | `lib/core/di/` | "GetIt configuration" |

**Recommendation**: DELETE `lib/core/di/service_locator.dart`. Keep `lib/core/di/injection.dart` as the single DI entry point. ("Service Locator" is the pattern; GetIt is the implementation. One file is sufficient).

---

## 4. DUPLICATE Bootstrap: `bootstrap_common.dart` vs `bootstrap_core.dart`

| File | Location | Content |
|------|----------|---------|
| bootstrap_common.dart | `lib/bootstrap/` | Skeleton for shared bootstrap |
| bootstrap_core.dart | `lib/bootstrap/` | Skeleton for app bootstrap |

**Recommendation**: MERGE into single `bootstrap_common.dart`. DELETE `bootstrap_core.dart`.

---

## 5. DUPLICATE Routers: `routes.dart` vs `servant_router.dart` / `admin_router.dart`

| File | Location | Content |
|------|----------|---------|
| routes.dart | `lib/core/router/` | EMPTY |
| servant_router.dart | `lib/core/routing/` | Skeleton |
| admin_router.dart | `lib/core/routing/` | Skeleton |

**Recommendation**: DELETE `lib/core/router/routes.dart` (and the entire `lib/core/router/` folder if empty). Keep `lib/core/routing/`.

---

## 6. DUPLICATE Reports Repositories

| File | Location | Content |
|------|----------|---------|
| reports_repository.dart | `lib/features/reports/domain/repositories/` | `abstract class ReportsRepository {}` |
| report_repository.dart | `lib/features/reports/domain/repositories/` | EMPTY |

**Recommendation**: DELETE `lib/features/reports/domain/repositories/report_repository.dart`.

---

## 7. UNNECESSARY / EMPTY Files

Based on the analysis, the following files have **zero content** or only whitespace:

- `lib/core/router/routes.dart`
- `lib/features/reports/domain/repositories/report_repository.dart`
- Likely more (requires full scan)

**Recommendation**: DELETE all empty files.

---

## 8. UNNECESSARY Folders

| Folder | Reason |
|--------|--------|
| `lib/core/offline_sync/` | Duplicates `lib/core/sync/`. Merge contents and delete. |
| `lib/core/router/` | Duplicates `lib/core/routing/`. Delete. |

---

## 9. OVERLAPPING PURPOSE: Sync Orchestrators

The following files all describe the same responsibility ("orchestrate sync / flush queue"):

| File | Purpose Comment |
|------|-----------------|
| `sync_engine.dart` | "Core engine for handling data synchronization" |
| `sync_service.dart` | "Offline sync engine... Flush queued commands" |
| `sync_manager.dart` | "Orchestrates Offline-First synchronization" |

**Recommendation**: CONSOLIDATE into **one file**: `sync_engine.dart`. DELETE `sync_service.dart` and `sync_manager.dart`.

---

## 10. OVERLAPPING PURPOSE: Storage Folders

Two folders exist for local storage:

| Folder | Contents |
|--------|----------|
| `lib/core/local_storage/` | `local_store.dart`, `hive/`, `sqlite/` |
| `lib/core/storage/` | `hive_storage.dart`, `hive_storage_service.dart`, `secure_storage_service.dart`, `storage_service.dart` |

**Recommendation**: MERGE all local storage into `lib/core/local_storage/`. DELETE `lib/core/storage/`.

---

## 11. EMPTY FILES (Unnecessary)

| File | Location |
|------|----------|
| syncable.dart | `lib/core/sync/` |
| storage_service.dart | `lib/core/storage/` |
| hive_storage.dart | `lib/core/storage/` |

**Recommendation**: DELETE all empty files. If needed later, recreate with proper content.

---

## Action Plan

1.  **DELETE** the following files:
    - `lib/core/security/roles.dart`
    - `lib/core/offline_sync/sync_engine.dart` (and entire folder)
    - `lib/core/di/service_locator.dart`
    - `lib/bootstrap/bootstrap_core.dart`
    - `lib/core/router/routes.dart` (and entire folder)
    - `lib/features/reports/domain/repositories/report_repository.dart`

2.  **MERGE** (if any content):
    - Contents of `lib/core/offline_sync/` into `lib/core/sync/`.

3.  **KEEP** as source of truth:
    - `lib/core/constants/roles.dart`
    - `lib/core/sync/sync_engine.dart`
    - `lib/core/di/injection.dart`
    - `lib/bootstrap/bootstrap_common.dart`
    - `lib/core/routing/`
