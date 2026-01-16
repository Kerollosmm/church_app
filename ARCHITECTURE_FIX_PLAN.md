# 1) STRUCTURE ALIGNMENT VERDICT
**Verdict**: **Approved with Crucial Additions**
The baseline structure in `PROJECT_STRUCTURE.md` is solid for a Clean Architecture app. However, it lacks dedicated modules for the **Non-Negotiable Conflict Resolution** workflow (Admin side) and **Admin Notifications**. Without these, the "Flag for Review" requirement is technically impossible to fulfill in the UI.

**Top 5 Structural Risks:**
1.  **Missing `features/conflicts`**: No place to put the logic for "Admin reviewing side-by-side data".
2.  **Ambiguous `users` vs `servants`**: High risk of duplicating "Servant Profile" logic (once for "Me" and once for "Admin managing Servants").
3.  **Single `main.dart`**: Risks bloating the Mobile App with Admin Web Portal logic.
4.  **Missing `notifications`**: No structure to handle "Alert Admin" when a conflict is uploaded.
5.  **Reports overlap**: Risk of mixing "My Attendance History" (Student/Servant view) with "class-wide Analytics" (Admin view) in a single massive controller.

---

# 2) REQUIRED STRUCTURE CHANGES (MINIMAL-DELTA)

### 📂 FOLDERS to ADD
*   `lib/features/conflicts/data`
*   `lib/features/conflicts/domain`
*   `lib/features/conflicts/presentation`
*   `lib/features/notifications/data`
*   `lib/features/notifications/domain`
*   `lib/features/notifications/presentation`

### 📄 FILES to ADD (Entrypoints & Definitions)
*   `lib/main_servant.dart`: Entrypoint for the Mobile App (optimizes for offline/speed).
*   `lib/main_admin.dart`: Entrypoint for the Web Portal (enables Admin-only modules).
*   `lib/features/conflicts/domain/entities/conflict_case.dart`: The visible "Side-by-Side" comparison model.
*   `lib/features/notifications/domain/entities/admin_alert.dart`: Model for high-priority sync issues.

### 🗑️ FILES/FOLDERS to REMOVE
*   *None*. (The existing structure is valid; we are only extending it.)

### 🔄 FILES/FOLDERS to MERGE
*   *None in filesystem*, but see logical rules below for `users`/`servants`.

---

# 3) FEATURE BOUNDARY RULES (ANTI-DUPLICATION)

To prevent code duplication, enforce these strict ownership rules:

### A. `users` vs `servants`
*   **`features/users` (Me/Self)**:
    *   **Scope**: The **currently logged-in user's** data.
    *   **Responsibility**: "Update *my* phone number", "View *my* assigned classes", "Check *my* permissions".
    *   **Data Source**: Reads from local `current_user` hive box or auth token claims.
*   **`features/servants` (Directory/Admin)**:
    *   **Scope**: The **list of other servants** (Admin/Head Servant view).
    *   **Responsibility**: "Assign Servant A to Grade 5", "Deactivate Servant B", "View all servants".
    *   **Data Source**: Queries `firestore/users` collection via admin filters.
    *   **Rule**: The Servant Mobile App should **NOT** compile/load `features/servants` logic (lazy load or exclude via tree-shaking).

### B. `attendance` vs `reports`
*   **`attendance`**:
    *   **Focus**: **Write-intensive**. Taking attendance, modifying today's status.
    *   **State**: Real-time sync status (Pending/Synced).
*   **`reports`**:
    *   **Focus**: **Read-only**. Analytics, charts, historical lists.
    *   **State**: Aggregated queries (e.g., "80% attendance last month").

### C. `core` vs `shared`
*   **`core`**: Pure Dart logic, no Flutter UI (except Theme). (e.g., `SyncEngine`, `Failure`, `Logger`).
*   **`shared`**: Reusable **Flutter Widgets** (e.g., `LoadingSpinner`, `SaveButton`, `ErrorDialog`).

---

# 4) MULTI-APP ENTRYPOINT STRATEGY

**Selected Strategy: Option A (Two Entrypoints)**
*   `lib/main_servant.dart`
*   `lib/main_admin.dart`

**Justification**: 
The Admin Portal (Web) requires heavy modules like **Chart Libraries**, **Conflict Resolution Diff Views**, and **User Management Tables** that the Mobile App (Servant) never needs. 
Using strict entrypoints allows us to:
1.  **Tree-shake** admin code out of the mobile app bundle (smaller size).
2.  Initialize different DI modules (e.g., Mobile uses `OfflineSync`, Web uses `RealtimeStream`).
3.  Simplify security (Mobile app literally doesn't have the "Delete User" screen code).

**Implementation**:
*   `lib/app/app.dart`: Accepts a `Flavor` or `AppConfig` to toggle routes.
*   `main_servant.dart`: `bootstrap(flavor: Flavor.servant)`
*   `main_admin.dart`: `bootstrap(flavor: Flavor.admin)`

---

# 5) OPTIONAL BUT RECOMMENDED ADDITIONS

1.  **`features/notifications`** (Added in Required):
    *   *Why*: When the Sync Engine hits a "Conflict", it needs a way to alert the user/admin without polling. A persistent notification center inside the app is critical for "Action Required" visibility.
2.  **`features/audit`** (Folder `core/audit` exists, maybe elevate to Feature?):
    *   *Recommendation*: Keep in `core` as a service logger. Only move to `features` if you need a UI screen to "View Audit Log". For MVP, `core/audit` is sufficient.

---

# 6) POWERSHELL UPDATE (DELTA ONLY)

Add these lines to your existing setup script to create the missing modules:

```powershell
    "lib/features/conflicts/data", "lib/features/conflicts/domain", "lib/features/conflicts/presentation",
    "lib/features/notifications/data", "lib/features/notifications/domain", "lib/features/notifications/presentation"
```
