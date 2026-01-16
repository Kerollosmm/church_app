# Structure Assessment & Improvement Plan

**Goal:** Establish a clean, scalable Clean Architecture structure that enforces offline-first data integrity, conflict resolution, and clear separation of concerns for the CSMS Attendance System.

## 1) EXECUTIVE VERDICT
**Verdict:** **Acceptable with Major Cleanup Required**
The structural foundation (Clean Architecture, Feature-based modularity, Core Sync) is sound, but the implementation contains "shells" (empty files), redundant paths (Auth), and conflicting patterns (SQLite vs Hive) that must be resolved immediately to prevent technical debt.

**Top 5 Risks if Left Unchanged:**
1.  **Ambiguous Source of Truth:** Co-existence of `hive/` and `sqlite/` in `core/local_storage` will lead to developers using the wrong local cache, violating the "Hive-only" requirement.
2.  **Auth Fragmentation:** Duplicate UI files (`login_page.dart` vs `login_screen.dart`) and mixed state management approaches in `features/auth` will cause regression bugs during login flows.
3.  **Silent Failure Potential:** The `features/attendance` DTOs and Datasources are currently empty shells. Without strict enforcement of the `SyncQueue` and `ConflictPolicy` in these files, data loss is guaranteed.
4.  **Backend Drift:** No dedicated `functions/` directory was found for Cloud Functions, risking business logic being implicitly hidden in client-side code instead of server-side triggers for conflict detection.
5.  **Typos & Sloppiness:** Files like `rigster_screen.dart` and `cloud_stoge_...` indicate a lack of attention to detail that undermines code maintainability.

---

## 2) REQUIREMENTS-TO-STRUCTURE TRACEABILITY

| Requirement | Module / Folder | Justification |
| :--- | :--- | :--- |
| **Auth & Roles** | `lib/features/auth` | Handles Login, Token management, and Role-based guards. |
| **User Profile** | `lib/features/servants` | Servant-specific data (Department, Grade) separate from generic Auth data. |
| **Students** | `lib/features/students` | CRUD for students. |
| **Attendance Sessions** | `lib/features/attendance` | Managing dates, service types, and opening sessions. |
| **Attendance Records** | `lib/features/attendance` | The core "Marking" logic, DTOs, and sync status logic. |
| **Reporting** | `lib/features/reports` | Aggregation logic (Admin view). |
| **Offline Storage** | `lib/core/local_storage/hive` | **Sole** owner of local persistence. SQLite must be removed. |
| **Sync Engine** | `lib/core/sync` | Orchestrator for `SyncQueue`, `RetryPolicy`, and `NetworkInfo`. |
| **Conflict Detection** | `lib/core/sync/conflict_policy.dart` | The logic defining *what* constitutes a conflict (e.g., timestamp comparison). |
| **Conflict Resolution** | `lib/features/conflicts` | Admin UI for side-by-side comparison and resolution actions. |
| **Admin Portal** | `lib/apps/admin` | Entry point and routing configuration specific to the Web Portal. |

---

## 3) STRUCTURE GAPS & REQUIRED CHANGES (MINIMAL-DELTA)

### **FOLDERS TO ADD**
*   `functions/` (Root Level) - **CRITICAL:** Place for Firebase Cloud Functions (TypeScript/JS) to handle server-side conflict detection.
*   `lib/core/components/` - Shared UI widgets (Buttons, Loading Indicators, "Saved/Syncing" Status Badges) to ensure UI consistency.

### **FILES TO ADD**
*   `lib/core/sync/sync_interfaces.dart` - Define `Syncable` interface that all Models/DTOs must implement (requires `id`, `updatedAt`, `syncedAt`).
*   `lib/features/attendance/data/mappers/attendance_mapper.dart` - explicit mappers between Hive Objects <-> Domain Entities <-> Firestore DTOs.

### **FOLDERS/FILES TO REMOVE**
*   `lib/core/local_storage/sqlite/` - **REMOVE.** Violates "Hive-only" requirement.
*   `lib/features/auth/presentation/pages/login_screen.dart` - **REMOVE.** Redundant (use `login_page.dart`).
*   `lib/features/auth/presentation/pages/rigster_screen.dart` - **REMOVE.** Redundant/Typo (Auth is likely Admin-invite or strictly controlled; self-register if needed should be named correctly).
*   `lib/features/auth/presentation/widgets/custom_field.dart` - **REMOVE.** Use shared components or Theme.

### **MERGES/RENAMES**
*   **Rename:** `lib/features/attendance/data/datasources/cloud/cloud_stoge_constant.dart` -> `cloud_storage_constants.dart` (Fix typo).
*   **Merge:** Consolidate `auth_services.dart` and `auth_bloc.dart` logic. The architecture should strictly follow `Bloc -> UseCase -> Repository -> Datasource`. Remove independent "Services" if they bypass this flow.

---

## 4) BOUNDARY RULES (ANTI-DUPLICATION)

1.  **Users vs. Servants:**
    *   `features/auth`: Handles *Authentication* (Who are you? Credential validation).
    *   `features/servants`: Handles *Profile* (What is your department? Grade? Phone number?).
    *   **Rule:** Auth never stores business data (like "Grade"). Servant profile never stores passwords.

2.  **Attendance vs. Reports:**
    *   `features/attendance`: Transactional. Captures the data, handles the sync, ensures integrity.
    *   `features/reports`: Read-only. Aggregates data for visualization.
    *   **Rule:** Reports never write to the `attendance` collection.

3.  **Domain vs. Data:**
    *   **Domain:** Pure Dart. No Firebase imports, No Hive imports. Entities and abstract Repositories only.
    *   **Data:** The "Dirty" layer. Implements Repositories, talks to Firestore/Hive.
    *   **Rule:** UI never imports from `data`. UI imports only `domain` (Blocs use UseCases).

4.  **Utils vs. Constants:**
    *   `core/constants`: Static const strings, configuration values.
    *   `core/utils`: Pure functions (date formatters, validators).
    *   **Rule:** No logic in constants. No state in utils.

---

## 5) MULTI-APP STRATEGY

**Strategy:** **Two Entrypoints (Recommended & Partially Implemented)**

*   **Servant Mobile App:** `lib/main_servant.dart` -> `lib/apps/servant/servant_app.dart`
*   **Admin Web Portal:** `lib/main_admin.dart` -> `lib/apps/admin/admin_app.dart`

**Justification:** Separation of concerns. The Admin app will likely import heavy charting libraries and data tables that the Mobile app doesn't need. This keeps the Mobile bundle size smaller and the routing logic cleaner.

**Required Files:**
*   `lib/main_servant.dart` (Exists)
*   `lib/main_admin.dart` (Exists)
*   `lib/core/config/flavors.dart` (Exists - ensure it supports defining the "App Mode").

---

## 6) FIREBASE BACKEND ALIGNMENT CHECK

*   **Firestore Rules:** Structure supports collection separation (`servants`, `attendance`, `audit_logs`).
*   **Cloud Functions:** **MISSING.** A root-level `functions/` directory is mandatory.
    *   **Conflict Logic:** The "Flag for Review" logic must be enforced by a Cloud Function `onUpdate` trigger in Firestore to catch race conditions that the client might miss.
*   **Indexes:** Ensure `firestore.indexes.json` is tracked in the root or `firebase/` folder.

---

## 7) CLEANUP CHECKLIST (Prioritized)

### **P0: Critical Infrastructure (Immediate)**
- [ ] **Delete** `lib/core/local_storage/sqlite/` to prevent usage.
- [ ] **Fix Typos:** Rename `cloud_stoge_...` files in attendance and `rigster_screen.dart`.
- [ ] **Create** `functions/` directory at project root.
- [ ] **Define** `Syncable` interface in `core/sync` to standardize how models report their sync status.

### **P1: Auth & Core Cleanup**
- [ ] **Consolidate Auth UI:** Delete `login_screen.dart` and `rigster_screen.dart`. Standardize on `login_page.dart`.
- [ ] **Implement Core Shells:** Add code to `HiveLocalStore` and `AttendanceRepositoryImpl` to support basic read/write/sync flow.
- [ ] **Standardize UI:** Create `lib/core/components/sync_status_badge.dart` (Visible "Saved" vs "Synced" indicator).

### **P2: Feature Hardening**
- [ ] **Conflict Module:** Implement the UI for `conflict_resolution_page.dart` (Side-by-side view).
- [ ] **Reports:** Ensure `reports_repository.dart` is strictly read-only.
