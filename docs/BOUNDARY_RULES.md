# Architectural Boundary Rules

## 1. Structure & Ownership

### Entrypoints
- **Constraint**: Only specific files in `lib/` root are allowed to be entrypoints.
- **Allowed**: `main_servant.dart`, `main_admin.dart`.
- **Forbidden**: `main.dart` (generic), logic files in root.

### Dependency Injection (DI)
- **Constraint**: Single source of truth for DI setup.
- **Location**: `lib/core/di/`.
- **Rule**: Feature modules should expose a DI `module` or `init` function, but the orchestration happens in `core/di`.

### Routing
- **Constraint**: Routers belong to the App Shells or Core, not features.
- **Location**: `lib/core/routing/` or `lib/apps/<app>/routing/`.
- **Rule**: Do not create independent `MaterialApp` widgets in features.

## 2. Sync & Data

### Offline-First Protocol
- **Constraint**: All write operations must pass through the Sync Engine if they need to be synced.
- **Location**: `lib/core/sync/`.
- **Rule**: Do not write directly to Firestore from UI logic unless it's a read-only operation or critical real-time action (rare).

### Conflict Resolution
- **Constraint**: NEVER overwrite existing data if a conflict is detected.
- **Rule**: Create a `ConflictCase` entity in `lib/features/conflicts/`.
- **Process**:
    1. Detect conflict (timestamps/versioning).
    2. Save local version.
    3. Push specific "Conflict" document to server.
    4. Admin resolves via `ConflictResolutionPage`.

## 3. Anti-Patterns (Forbidden)
- `lib/utils/` (Dumping ground). Put utilities in `core/extension`, `core/formatters`, etc.
- `lib/models/` (Dumping ground). Models belong to `features/<feature>/data/models`.
- Calling `FirebaseFirestore.instance` directly in Widgets. Use Repositories.
