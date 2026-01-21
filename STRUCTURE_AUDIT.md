# CSMS Codebase Structure Audit & Improvement Plan

**Goal:** Establish a robust, scalable Flutter file structure for the Church Servants Management System that guarantees offline data integrity, efficient conflict resolution, and strict separation of concerns for multiple apps.

## 1. EXECUTIVE VERDICT
**Verdict: Acceptable with Minor Gaps (Yes)**

The current structure is largely aligned with clean architecture and feature-first principles. It correctly separates core infrastructure from feature logic and acknowledges the need for distinct apps (Servant, Admin, Student). However, there are risks regarding the explicit handling of conflict resolution and the separation of concerns within the multi-app context.

**Top 5 Risks if Left Unchanged:**
1.  **Ambiguous Conflict Ownership:** Without a dedicated `conflicts` feature with clear admin-only logic, conflict resolution might become entangled with regular attendance recording.
2.  **State Drift in Multi-App:** Sharing too much presentation logic between Servant and Admin apps could lead to UI/UX compromises.
3.  **Sync Logic Scattering:** If `core/sync` isn't strictly enforced as the single source of truth for queue management, data loss could occur during "Airplane Mode" toggles.
4.  **Inconsistent Offline patterns:** Lack of strict `local_datasource` vs `remote_datasource` patterns in all features could lead to some features not being truly offline-first.
5.  **Role Pollution:** Servant logic leaking into Student features (or vice versa) if boundaries aren't enforced at the library level.

## 2. REQUIREMENTS-TO-STRUCTURE TRACEABILITY

| Requirement | Module/Folder | Why |
| :--- | :--- | :--- |
| **Auth & Roles** | `lib/features/auth/` | Handles login, token management, and initial role determination. |
| **User Profile & Scope** | `lib/features/users/` (New) | Manages user details, Servant assignments (grade/group), and student linking. Separated from Auth. |
| **Students Management** | `lib/features/students/` | CRUD for student roster. |
| **Attendance Sessions** | `lib/features/attendance_sessions/` | Manages the "container" (Date + Group + Grade). Distinct from individual records. |
| **Attendance Records** | `lib/features/attendance_records/` | Manages the status of individual students. Heavily interacts with `core/sync`. |
| **Reporting** | `lib/features/reports/` | Read-heavy feature. Aggregates data from sessions and records. |
| **Offline Storage** | `lib/core/persistence/` & Feature Data Layers | Core provides the Hive wrapper; Features implement specific Boxes. |
| **Sync Engine & Queue** | `lib/core/sync/` | Centralized logic for `SyncQueue`, `RetryPolicy`, and `ConnectivityListener`. |
| **Conflict Detection** | `lib/core/sync/conflict_policy.dart` | The logic to *identify* a conflict. |
| **Conflict Resolution** | `lib/features/conflicts/` | The Admin UI and logic to *resolve* the conflict (accept A or B). |
| **Admin Portal** | `lib/apps/admin/` | Entry point and routing specific to the Admin Web Portal. |

## 3. STRUCTURE GAPS & REQUIRED CHANGES

**FOLDERS TO ADD:**
-   `lib/features/users/` (Domain/Data/Presentation) - To manage non-auth user profile data.
-   `lib/features/conflicts/presentation/pages/resolution_page.dart` - Placeholder for conflict resolution UI.
-   `lib/shared/widgets/` - For reusable UI components across apps.

**FILES TO ADD:**
-   `lib/core/sync/sync_queue_impl.dart` - Concrete implementation of the sync queue.
-   `lib/features/attendance_records/domain/usecases/mark_attendance_offline.dart` - Explicit use case for offline-first writing.

**MERGES:**
-   *None required at this stage.* `attendance_records` and `attendance_sessions` are distinct enough to remain separate (Session = Header, Record = Rows).

**REMOVALS:**
-   Ensure `lib/main_*.dart` files are moved to `lib/apps/*/` (Done in plan).

## 4. BOUNDARY RULES (ANTI-DUPLICATION)

1.  **Users vs. Auth:** `features/auth` handles *who you are* (Login/Sign up). `features/users` handles *what you are* (Profile, Assignments, Linked IDs).
2.  **Core vs. Shared:** `core` is for *logic/infrastructure* (Network, Sync, Logs). `shared` is for *UI/Widgets* reused across apps.
3.  **Domain vs. Data:** Domain entities **never** know about JSON or Hive. Data models **must** extend Entities and handle serialization.
4.  **Sync Status:** The `SyncStatus` enum lives in `core/sync`. All "syncable" entities must have a field of this type.

## 5. MULTI-APP STRATEGY

**Strategy: Multiple Entry Points (Recommended)**

We will use distinct main files for each platform/role target. This allows for smaller bundle sizes (Student app doesn't need Admin logic) and role-specific routing.

-   `lib/apps/servant/main_servant.dart` -> Builds `ServantApp`
-   `lib/apps/admin/main_admin.dart` -> Builds `AdminApp`
-   `lib/apps/student/main_student.dart` -> Builds `StudentApp`

Each app will have its own `Router` configuration within `lib/apps/<role>/routes.dart` (or similar), importing only the features needed.

## 6. FIREBASE BACKEND ALIGNMENT CHECK

-   **Firestore Rules:** The structure implies a clear separation of `students`, `attendanceSessions`, `attendanceRecords` collections. This aligns with the requirement.
-   **Cloud Functions:** `lib/core/network` can handle calling Functions.
-   **Conflict Pathways:** The `syncStatus: conflictDetected` flag on the client and potential `needs_review` flag on Firestore documents are supported by the `features/conflicts` module.

## 7. CLEANUP CHECKLIST (PRIORITIZED)

-   [x] **P0**: Move main entry points to `lib/apps/<role>/`.
-   [ ] **P0**: Create `lib/features/users/` structure.
-   [ ] **P1**: Define `SyncStatus` enum in `lib/core/sync/` (Verified exists).
-   [ ] **P1**: Ensure `attendance_records` repository implements "Write Local -> Trigger Sync" pattern.
-   [ ] **P2**: Create `lib/shared/widgets/sync_indicator.dart`.
