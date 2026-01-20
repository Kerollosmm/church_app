# Flutter Features Folder Structure (Detailed)

This document focuses exclusively on a **senior-level, scalable `lib/features/` layout**. It includes a detailed, real-world folder and file tree with `.dart` files that balance clarity and practicality—neither too minimal nor overly complex. Every folder includes a short purpose comment to make responsibilities explicit for the entire app.

## Goals for `features/`

- **Feature-first ownership**: each feature owns its data, domain, and presentation.
- **Predictable layering**: consistent structure across features for onboarding and scaling.
- **Realistic depth**: includes common files teams actually maintain.

---

## Recommended `lib/features/` Tree (Detailed)

```
lib/
└── features/                                 # All business features live here
    ├── auth/                                 # Authentication and session management
    │   ├── data/                             # API, cache, and repository implementations
    │   │   ├── datasources/                  # Remote/local data sources
    │   │   │   ├── auth_remote_data_source.dart   # Auth API calls
    │   │   │   └── auth_local_data_source.dart    # Token/session cache
    │   │   ├── models/                       # API/DB DTOs
    │   │   │   ├── auth_token_model.dart     # Token DTO
    │   │   │   └── user_model.dart           # User DTO
    │   │   ├── repositories/                 # Data-layer repository impls
    │   │   │   └── auth_repository_impl.dart # Implements AuthRepository
    │   │   └── mappers/                      # DTO <-> entity mapping
    │   │       └── auth_mapper.dart          # Auth mapping helpers
    │   ├── domain/                           # Business rules and contracts
    │   │   ├── entities/                     # Core entities
    │   │   │   ├── auth_token.dart           # Token entity
    │   │   │   └── user.dart                 # User entity
    │   │   ├── repositories/                 # Domain repository contracts
    │   │   │   └── auth_repository.dart      # Auth repository contract
    │   │   └── usecases/                     # Business actions
    │   │       ├── sign_in.dart              # Sign-in flow
    │   │       ├── sign_out.dart             # Sign-out flow
    │   │       └── refresh_token.dart        # Token refresh flow
    │   └── presentation/                     # UI and state management
    │       ├── cubit/                        # Cubit state management
    │       │   ├── auth_cubit.dart            # Auth cubit
    │       │   └── auth_state.dart            # Auth state
    │       ├── pages/                        # Screens
    │       │   ├── sign_in_page.dart          # Sign-in screen
    │       │   └── forgot_password_page.dart  # Forgot password screen
    │       └── widgets/                      # Feature widgets
    │           ├── sign_in_form.dart          # Sign-in form widget
    │           └── auth_error_banner.dart     # Auth error banner
    │
    ├── dashboard/                            # Home/dashboard feature
    │   ├── data/                             # API/cache and repository implementations
    │   │   ├── datasources/                  # Remote/local data sources
    │   │   │   └── dashboard_remote_data_source.dart # Dashboard API
    │   │   ├── models/                       # DTOs
    │   │   │   └── dashboard_card_model.dart # Dashboard card DTO
    │   │   └── repositories/                 # Data-layer repository impls
    │   │       └── dashboard_repository_impl.dart # Implements DashboardRepository
    │   ├── domain/                           # Business rules and contracts
    │   │   ├── entities/                     # Core entities
    │   │   │   └── dashboard_card.dart       # Dashboard card entity
    │   │   ├── repositories/                 # Domain repository contracts
    │   │   │   └── dashboard_repository.dart # Dashboard repository contract
    │   │   └── usecases/                     # Business actions
    │   │       └── load_dashboard.dart       # Load dashboard data
    │   └── presentation/                     # UI and state management
    │       ├── bloc/                         # Bloc state management
    │       │   ├── dashboard_bloc.dart        # Dashboard bloc
    │       │   ├── dashboard_event.dart       # Dashboard events
    │       │   └── dashboard_state.dart       # Dashboard state
    │       ├── pages/                        # Screens
    │       │   └── dashboard_page.dart        # Dashboard screen
    │       └── widgets/                      # Feature widgets
    │           ├── dashboard_card.dart        # Dashboard card widget
    │           └── dashboard_empty_state.dart # Empty state widget
    │
    ├── profile/                              # User profile feature
    │   ├── data/                             # API/cache and repository implementations
    │   │   ├── datasources/                  # Remote/local data sources
    │   │   │   └── profile_remote_data_source.dart # Profile API
    │   │   ├── models/                       # DTOs
    │   │   │   └── profile_model.dart        # Profile DTO
    │   │   └── repositories/                 # Data-layer repository impls
    │   │       └── profile_repository_impl.dart # Implements ProfileRepository
    │   ├── domain/                           # Business rules and contracts
    │   │   ├── entities/                     # Core entities
    │   │   │   └── profile.dart              # Profile entity
    │   │   ├── repositories/                 # Domain repository contracts
    │   │   │   └── profile_repository.dart   # Profile repository contract
    │   │   └── usecases/                     # Business actions
    │   │       ├── load_profile.dart         # Load profile data
    │   │       └── update_profile.dart       # Update profile data
    │   └── presentation/                     # UI and state management
    │       ├── notifier/                     # ChangeNotifier state management
    │       │   ├── profile_notifier.dart      # Profile notifier
    │       │   └── profile_state.dart         # Profile state
    │       ├── pages/                        # Screens
    │       │   └── profile_page.dart          # Profile screen
    │       └── widgets/                      # Feature widgets
    │           ├── profile_header.dart        # Profile header
    │           └── profile_form.dart          # Profile form
    │
    ├── notifications/                        # User notifications feature
    │   ├── data/                             # API/cache and repository implementations
    │   │   ├── datasources/                  # Remote/local data sources
    │   │   │   └── notifications_remote_data_source.dart # Notifications API
    │   │   ├── models/                       # DTOs
    │   │   │   └── notification_model.dart   # Notification DTO
    │   │   └── repositories/                 # Data-layer repository impls
    │   │       └── notifications_repository_impl.dart # Implements NotificationsRepository
    │   ├── domain/                           # Business rules and contracts
    │   │   ├── entities/                     # Core entities
    │   │   │   └── notification_item.dart    # Notification entity
    │   │   ├── repositories/                 # Domain repository contracts
    │   │   │   └── notifications_repository.dart # Notifications repository contract
    │   │   └── usecases/                     # Business actions
    │   │       ├── load_notifications.dart   # Load notifications
    │   │       └── mark_notification_read.dart # Mark notification read
    │   └── presentation/                     # UI and state management
    │       ├── bloc/                         # Bloc state management
    │       │   ├── notifications_bloc.dart    # Notifications bloc
    │       │   ├── notifications_event.dart   # Notifications events
    │       │   └── notifications_state.dart   # Notifications state
    │       ├── pages/                        # Screens
    │       │   └── notifications_page.dart    # Notifications screen
    │       └── widgets/                      # Feature widgets
    │           ├── notification_tile.dart     # Notification list tile
    │           └── notification_empty_state.dart # Empty state widget
    │
    ├── reports/                              # Reporting and analytics feature
    │   ├── data/                             # API/cache and repository implementations
    │   │   ├── datasources/                  # Remote/local data sources
    │   │   │   └── reports_remote_data_source.dart # Reports API
    │   │   ├── models/                       # DTOs
    │   │   │   ├── report_filter_model.dart  # Report filter DTO
    │   │   │   └── report_summary_model.dart # Report summary DTO
    │   │   └── repositories/                 # Data-layer repository impls
    │   │       └── reports_repository_impl.dart # Implements ReportsRepository
    │   ├── domain/                           # Business rules and contracts
    │   │   ├── entities/                     # Core entities
    │   │   │   ├── report_filter.dart        # Report filter entity
    │   │   │   └── report_summary.dart       # Report summary entity
    │   │   ├── repositories/                 # Domain repository contracts
    │   │   │   └── reports_repository.dart   # Reports repository contract
    │   │   └── usecases/                     # Business actions
    │   │       ├── load_report_summary.dart  # Load report summary
    │   │       └── export_report.dart        # Export report
    │   └── presentation/                     # UI and state management
    │       ├── bloc/                         # Bloc state management
    │       │   ├── reports_bloc.dart          # Reports bloc
    │       │   ├── reports_event.dart         # Reports events
    │       │   └── reports_state.dart         # Reports state
    │       ├── pages/                        # Screens
    │       │   └── reports_page.dart          # Reports screen
    │       └── widgets/                      # Feature widgets
    │           ├── report_filter_bar.dart     # Filter bar widget
    │           └── report_summary_card.dart   # Summary card widget
    │
    └── shared_feature_utils/                 # Shared helpers used across features
        ├── data/                             # Shared data helpers
        │   └── pagination_params.dart         # Pagination params
        ├── domain/                           # Shared domain helpers
        │   └── page_result.dart               # Page result entity
        └── presentation/                     # Shared UI helpers
            └── paged_list_view.dart           # Paged list widget
```

---

## Notes on Structure Choices

- **`data/`** holds models, data sources, and repository implementations.
- **`domain/`** contains entities, repository contracts, and use cases.
- **`presentation/`** keeps UI and state management (Bloc/Cubit/Notifier as needed).
- **`shared_feature_utils/`** is optional for utilities used by multiple features.

This `features/` layout provides a complete, realistic baseline for senior developers working on scalable Flutter applications.
