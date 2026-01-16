# CSMS Project Initializer
# This script creates the directory structure and skeleton files for the CSMS project.

# Function to create a file if it doesn't exist
function Create-SkeletonFile {
    param (
        [string]$Path,
        [string]$Content
    )
    $dir = Split-Path -Parent $Path
    if (!(Test-Path $dir)) {
        New-Item -ItemType Directory -Force -Path $dir | Out-Null
    }
    if (!(Test-Path $Path)) {
        Set-Content -Path $Path -Value $Content
        Write-Host "Created: $Path" -ForegroundColor Cyan
    } else {
        Write-Host "Exists:  $Path" -ForegroundColor Gray
    }
}

Write-Host "--- Initializing CSMS Structure ---" -ForegroundColor Green

# 1. Core Layer Files
Create-SkeletonFile "lib/main.dart" "/// Entry point - Init Firebase, Hive, DI, App Root.`nvoid main() {}"
Create-SkeletonFile "lib/app/app.dart" "// Root Widget with MaterialApp, Router, and Theme"
Create-SkeletonFile "lib/app/bootstrap.dart" "// Zone-guarded bootstrap with error logging"
Create-SkeletonFile "lib/core/constants/app_constants.dart" "// Global strings and numeric constants"
Create-SkeletonFile "lib/core/local_storage/hive/hive_local_store.dart" "// Hive implementation of local storage"
Create-SkeletonFile "lib/core/local_storage/sqlite/sqlite_local_store.dart" "// SQLite implementation for complex queries"
Create-SkeletonFile "lib/core/offline_sync/sync_engine.dart" "// Background synchronization orchestrator"
Create-SkeletonFile "lib/core/theme/app_theme.dart" "// Material 3 theme configurations"

# 2. Shared Layer Files
Create-SkeletonFile "lib/shared/widgets/widgets.dart" "// Barrel file for shared widgets"
Create-SkeletonFile "lib/shared/widgets/loaders/custom_loading_indicator.dart" "// Branded loading widget"
Create-SkeletonFile "lib/shared/widgets/dialogs/error_dialog.dart" "// Standard error dialog"

# 3. Feature Layers (Templatized)
$features = @("auth", "splash", "home", "attendance", "students", "servants", "reports", "users")

foreach ($f in $features) {
    # Folders
    $base = "lib/features/$f"
    New-Item -ItemType Directory -Force -Path "$base/data/datasources" | Out-Null
    New-Item -ItemType Directory -Force -Path "$base/data/repositories" | Out-Null
    New-Item -ItemType Directory -Force -Path "$base/domain/entities" | Out-Null
    New-Item -ItemType Directory -Force -Path "$base/domain/repositories" | Out-Null
    New-Item -ItemType Directory -Force -Path "$base/presentation/bloc" | Out-Null
    New-Item -ItemType Directory -Force -Path "$base/presentation/screens" | Out-Null
    New-Item -ItemType Directory -Force -Path "$base/presentation/widgets" | Out-Null

    # Skeleton Files
    Create-SkeletonFile "$base/domain/entities/${f}_entity.dart" "// Domain entity for $f"
    Create-SkeletonFile "$base/domain/repositories/${f}_repository.dart" "// Repository interface for $f"
    Create-SkeletonFile "$base/data/repositories/${f}_repository_impl.dart" "// Implementation of $f repository"
}

Write-Host "DONE! Project structure is ready." -ForegroundColor Green
