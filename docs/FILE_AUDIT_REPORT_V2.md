# File Audit Report v2 (Post-Cleanup)

## Summary

After the first cleanup, another deep scan was performed. The following issues remain:

---

## 1. EMPTY FILES (Delete Immediately)

| File | Location |
|------|----------|
| `user_role.dart` | `lib/features/auth/domain/entities/` |
| `report_repository_impl.dart` | `lib/features/reports/data/repositories/` |
| `report_remote_datasource.dart` | `lib/features/reports/data/datasources/` |
| `attendance_report_entity.dart` | `lib/features/reports/domain/entities/` |

**Action**: DELETE all empty files.

---

## 2. EMPTY FOLDERS (Delete Immediately)

| Folder | Reason |
|--------|--------|
| `lib/core/security/` | Was emptied when `roles.dart` was moved to constants. |

**Action**: DELETE empty folders.

---

## 3. DUPLICATE NAMING: `report_*` vs `reports_*`

The `reports` feature has mixed singular/plural naming:

| Keep (Plural) | Delete (Singular - Empty or Duplicate) |
|---------------|----------------------------------------|
| `reports_remote_datasource.dart` | `report_remote_datasource.dart` (EMPTY) |
| `reports_repository_impl.dart` | `report_repository_impl.dart` (EMPTY) |
| `reports_repository.dart` | - |

**Action**: DELETE the singular-named empty duplicates.

---

## 4. DUPLICATE: `attendance_report.dart` vs `attendance_report_entity.dart`

| Keep | Delete |
|------|--------|
| `attendance_report.dart` (has content) | `attendance_report_entity.dart` (EMPTY) |

**Action**: DELETE `attendance_report_entity.dart`.

---

## 5. POTENTIAL OVERLAP: `user_entity.dart` vs `user_profile.dart`

| File | Location | Purpose |
|------|----------|---------|
| `user_entity.dart` | `features/auth/` | "Domain entity representing a User (ID, Email, Role)" |
| `user_profile.dart` | `features/users/` | "TODO: Implement User Profile Entity" |

**Analysis**: These are DIFFERENT concepts.
- `user_entity` = Core auth identity (ID, Email, Role).
- `user_profile` = Extended profile data (name, avatar, preferences).

**Action**: KEEP BOTH. They serve different purposes.

---

## 6. DUPLICATE: `user_role.dart` (auth) vs `roles.dart` (constants)

| Keep | Delete |
|------|--------|
| `lib/core/constants/roles.dart` (has `enum UserRole`) | `lib/features/auth/domain/entities/user_role.dart` (EMPTY) |

**Action**: Already identified above as empty. DELETE.

---

## Files to Delete (Final List)

1. `lib/features/auth/domain/entities/user_role.dart`
2. `lib/features/reports/data/repositories/report_repository_impl.dart`
3. `lib/features/reports/data/datasources/report_remote_datasource.dart`
4. `lib/features/reports/domain/entities/attendance_report_entity.dart`
5. `lib/core/security/` (entire empty folder)

---

## Structure Assessment: GOOD

After this cleanup, the structure will be clean:
- **Entrypoints**: `main_servant.dart`, `main_admin.dart`
- **Bootstrap**: 3 files (common, servant, admin)
- **Core**: Single sources of truth for DI, Routing, Sync, Constants
- **Features**: 10 distinct features with consistent folder structure
