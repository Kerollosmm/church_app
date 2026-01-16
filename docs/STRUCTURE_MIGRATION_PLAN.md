# Structure Migration Plan

## Objectives
- Enforce the separation of `Servant` and `Admin` applications.
- Centralize `sync` logic.
- Clean up duplicate `bootstrap` attempts.

## Changeset

### 1. Bootstrap Consolidation
- **Action**: MERGE folder structure.
- **Source**: `lib/app/bootstrap.dart` (User created).
- **Target**: `lib/bootstrap/bootstrap_core.dart` (Renaming for clarity).
- **Reason**: `lib/app` is a generic name; `lib/bootstrap` is more specific for startup logic.

### 2. Entrypoint Cleanliness
- **Action**: RENAME (if exists) `lib/main.dart` -> `lib/main.dart.legacy`.
- **Action**: RENAME (if exists) `lib/app.dart` -> `lib/app.dart.legacy`.
- **Reason**: We are using `main_servant.dart` and `main_admin.dart`.

### 3. Core Infrastructure
- **Action**: ENSURE `lib/core/sync/` exists.
- **Action**: ENSURE `lib/core/persistence/hive/` exists. (Confirmed)

### 4. Import Fixes (Manual Follow-up)
> **NOTE**: Imports are NOT updated automatically.
- Check imports referencing `lib/app/bootstrap.dart`. Change to `lib/bootstrap/bootstrap_core.dart`.

## Execution Steps
1. `move lib/app/bootstrap.dart` -> `lib/bootstrap/bootstrap_core.dart`
2. `remove lib/app/` (if empty)
3. `rename lib/main.dart` -> `lib/main.dart.legacy` (Already done in previous step)
4. `rename lib/app.dart` -> `lib/app.dart.legacy` (Already done in previous step)
