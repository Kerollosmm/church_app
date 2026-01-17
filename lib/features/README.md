# Features Directory

This directory contains the core business features of the application.
Each feature should be self-contained and follow the **Clean Architecture** structure.

## Structure per Feature
- **data/**: Repositories, Data Sources, DTOs.
- **domain/**: Entities, Use Cases, Repository Interfaces.
- **presentation/**: BLoCs/Providers, Pages, Widgets.

## Rules
1. **Isolation**: Features should not import other features directly if possible. Use `core/` for communication.
2. **Sync**: Features requiring sync must implement `ISyncRepository` and register in `core/sync/sync_manifest.dart`.
