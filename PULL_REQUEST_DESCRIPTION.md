# PR Description: Core Architecture Implementation & Offline-First Infrastructure

## 🚀 Summary
This PR initializes the formal Clean Architecture structure for the CSMS project, specifically focusing on the **Offline-First infrastructure**, **Multi-App support**, and **Conflict Resolution protocols**.

## 🛠️ Key Changes
### 1. Architectural Foundation
*   **Feature-First Structure**: Implemented the full directory tree following Clean Architecture (Domain, Data, Presentation).
*   **Multi-Entrypoints**: Added `lib/main_servant.dart` (Mobile) and `lib/main_admin.dart` (Web) to separate logic for the Servant App and the Admin Portal.
*   **Dependency Injection**: Prepared `lib/app/di/` for global and feature-specific service registration.

### 2. Offline-First Sync Engine (Core Primitives)
*   **Sync Logic**: Defined core modules in `lib/core/offline_sync/` for the background sync engine:
    *   `SyncState`: Explicit states for *Saved to Device*, *Syncing*, *Synced*, *Failed*, and *Conflict*.
    *   `SyncCommand`: Idempotent data model for replaying user actions.
    *   `SyncQueue`: Initialized storage interface for Hive-backed command logging.
    *   `ConflictPolicy`: Enforced the "Flag for Review" protocol to prevent automatic data overwrites.

### 3. New Strategic Features
*   **`features/conflicts`**: Dedicated module for Admins to perform side-by-side reconciliation of data discrepancies.
*   **`features/notifications`**: System for alerting users and admins when sync actions require manual intervention.

### 4. Firebase & Security
*   **Firestore Helpers**: Centralized paths (`FirestorePaths`) and field constants (`FirestoreFieldNames`) to eliminate typos and drift.
*   **Data Protection**: Updated `.gitignore` to protect sensitive metadata and technical specifications from being tracked in the repository.

## 📋 Non-Negotiables Compliance
- [x] **Offline-First**: All reads focus on local Hive persistence.
- [x] **Zero Data Loss**: Every write is queued locally before syncing.
- [x] **Conflict Protocol**: Implemented "Flag for Review" logic over automatic overwrites.
- [x] **User Visibility**: States mapped to formal, direct messaging.
