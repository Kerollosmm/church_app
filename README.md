# CSMS - Church Servants Management System

A Flutter mobile application for managing student attendance in church educational settings with **offline-first** capabilities.

## 📱 Features

- **Authentication** - Firebase Auth with role-based access (Servant/Student)
- **Student Management** - Add, edit, and organize students by grade/group
- **Attendance Recording** - Mark Present/Absent with optional notes
- **Offline-First** - Works without internet, syncs when connected
- **Reports** - View attendance history and statistics

## 🛠️ Tech Stack

| Layer | Technology |
|-------|------------|
| Frontend | Flutter |
| Auth | Firebase Auth |
| Database | Cloud Firestore |
| Local Storage | Hive |
| State Management | BLoC |

## 📁 Project Structure

![Folder Structure](docs/folder_structure.png)

## 👥 User Roles

| Role | Permissions |
|------|-------------|
| **Servant** | Add students, record attendance, view all reports |
| **Student** | View personal attendance only |

## 🚀 Getting Started

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/csms.git

# Install dependencies
flutter pub get

# Run the app
flutter run
```

## 📄 License

MIT License
