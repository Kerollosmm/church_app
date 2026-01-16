# CSMS Attendance System - Project Specifications

## 1. System Overview & Principles
The CSMS Attendance System is a **mission-critical, offline-first** application designed for speed, reliability, and data integrity.

### Core Philosophy
1.  **Local-First / Offline-First**: The application never blocks the user waiting for a network. Reads and Writes happen immediately against the local database (Hive).
2.  **Zero Data Loss**: Every intent is captured locally. Sync is a background process.
3.  **Explicit State**: The user is never left guessing about the state of their data (Saved vs. Synced).
4.  **Conservative Conflict Resolution**: The system never guesses. Conflicting truths are flagged for human review.

### Technology Stack
*   **Framework**: Flutter (Mobile/Web)
*   **State Management**: Bloc / Cubit
*   **Local Database**: Hive (NoSQL, fast key-value)
*   **Remote Database**: Firestore (NoSQL, document store)
*   **Backend Logic**: Firebase Cloud Functions
*   **Auth**: Firebase Auth

---

## 2. Architecture & Data Flow

### The "Write" Path (User Action)
1.  **UI Layer**: User taps "Present".
2.  **Bloc Layer**: Captures event, emits optimistic "Saved" state immediately.
3.  **Repository**:
    *   Creates an `AttendanceRecord` object.
    *   Marks `syncStatus` as `pending`.
    *   **Writes to Hive** immediately.
4.  **Sync Service**:
    *   Listens to Hive changes or Connectivity stream.
    *   Picks up `pending` records.
    *   Attempts upload to Firestore.
    *   **On Success**: Updates Hive record `syncStatus` to `synced`.
    *   **On Failure**: Updates Hive record `syncStatus` to `failed` (retry logic applies).
    *   **On Business Conflict**: Updates Hive record `syncStatus` to `conflict` (requires action).

### The "Read" Path
1.  **Repository**: Exposes a `Stream<List<Data>>` derived **only** from Hive.
2.  **Sync Service**: Fetches logic from Firestore in background and updates Hive.
3.  **UI**: Updates automatically via Stream from Hive.

---

## 3. Data Consistency & Sync Protocol

### Sync States (Visible to User)
Every relevant data item (especially Attendance Records) must track internal sync state:

| State | Icon/Indicator | Meaning |
| :--- | :--- | :--- |
| **Pending** | 🕒 Clock / Gray Check | Saved to device, waiting for network. |
| **Syncing** | 🔄 Spinner | Currently uploading to cloud. |
| **Synced** | ✅ Green Check | Confirmed secured in cloud. |
| **Failed** | ⚠️ Red Warning | Network error or easy-fix error. Retry available. |
| **Conflict** | 🛑 Stop Sign / Flag | Business logic conflict. **Manual Review Required**. |

### Conflict Resolution Protocol
**Scenario**: Servant A marks Student X as "Present" offline. Servant B marks Student X as "Absent" online.
1.  **Detection**: Cloud Function or Client logic detects an existing record for `(StudentId, SessionId)` that differs from the incoming payload.
2.  **Action**: The incoming record is **NOT** discarded or overwritten automatically.
3.  **Resolution**:
    *   A "Conflict Record" is created in a separate collection (or flagged in the main one).
    *   Both servants receive a notification/UI indicator: "Discrepancy detected for Student X".
    *   Reviewer/Admin (or the servants) must select the correct status manually.

### Idempotency
*   Every write operation must produce a unique **Idempotency Key** (UUID) generated at the moment of creation on the device.
*   Retry logic relies on this key to prevent duplicate entries in Firestore.

---

## 4. Key Feature Specifications

### A. Authentication
*   **Role-Based Access**:
    *   **Admin**: Full access.
    *   **Servant**: Can only mark for assigned groups/grades.
    *   **Student**: View-only (own records).
*   **Persistence**: Auth state persists offline. If token expires offline, allow limited read-only access to cached data, but block sensitive writes or queue them effectively.

### B. Attendance Marking (High Speed)
*   **UI Requirement**: Single-tap toggle (Present -> Absent -> Excused -> Present).
*   **Batching**: "Mark All Present" feature for rapid start.
*   **Latency**: UI response must be < 16ms (1 frame). No loaders on marking.

### C. Offline Queue
*   **Structure**: A persistent FIFO (First-In-First-Out) queue in Hive.
*   **Retry Strategy**:
    *   Exponential backoff for network errors (2s, 4s, 8s...).
    *   Immediate halt for Auth errors (prompt user to re-login).

---

## 5. Deployment & Error Handling

### Error Categories
1.  **Transient (Network)**:
    *   *Action*: Queue and retry quietly.
    *   *User Feedback*: "Waiting for connection..." (Subtle).
2.  **Logic (Validation)**:
    *   *Action*: Reject write locally if possible.
    *   *User Feedback*: Snackbar/Toast with specific message.
3.  **Critical (Data Corruption/Auth)**:
    *   *Action*: Stop sync, log to Crashlytics.
    *   *User Feedback*: Full screen error or persistent banner "Action Required".

### Platform Specifics
*   **Android/iOS**: detailed background fetch permissions.
*   **Web**: limited background capabilities; sync mostly active while tab is open.

---

## 6. Implementation Checklist (Immediate Steps)
1.  [ ] Define `Hive` TypeAdapters for all Core Models.
2.  [ ] Implement `SyncQueue` class (add/remove/process).
3.  [ ] Build `AttendanceRepository` with `Stream` support.
4.  [ ] Create `ConflictResolution` widget for UI.
