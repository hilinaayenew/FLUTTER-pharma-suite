# Pharmacy Suite

A comprehensive pharmacy management system built with Flutter, designed to streamline and modernize pharmacy operations.

## Project Team

- Hilina Ayenew / UGR/6619/14
- Mahder Mulugeta /UGR/2193/14
- Meron Mathewos / UGR/0632/14
- Mieraf Yinebebal / UGR/6205/14
- Nathnael Getachew / UGR/0841/14
- Heni Abreham / UGR/5398/14

## Features

- **Dashboard**: Real-time inventory overview, sales statistics, and quick reports
- **Medicine Management**: Track, manage, and monitor medicine inventory with expiry date tracking
- **Employee Management**: Manage pharmacy staff with role-based access control
- **Supplier Management**: Maintain supplier relationships and track supplier information
- **User Authentication**: Secure login system with role-based access control
- **Cross-platform**: Works seamlessly on mobile, desktop, and web

## Tech Stack

- **Framework**: Flutter
- **Database**: SQLite (via sqflite)
- **State Management**: InheritedWidget (for user authentication)
- **Storage**: Shared Preferences for user session management

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK (included with Flutter)
- IDE (VS Code, Android Studio, or IntelliJ IDEA)

### Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/pharmacy-suite.git
```

2. Navigate to the project directory:

```bash
cd pharmacy-suite
```

3. Install dependencies:

```bash
flutter pub get
```

4. Run the app:

```bash
flutter run
```

## Project Structure

```
lib/
├── models/          # Data models and DAOs
│   ├── User.dart    # User authentication model
│   ├── Employee.dart # Employee management model
│   ├── Medicine.dart # Medicine inventory model
│   └── Supplier.dart # Supplier management model
├── screens/         # Screen widgets
│   ├── dashboard_page.dart
│   ├── employees_page.dart
│   ├── medicines_page.dart
│   └── suppliers_page.dart
├── services/        # Business logic and database services
│   └── db_service.dart
├── widgets/         # Reusable widgets
│   └── drawer.dart
└── main.dart        # App entry point
```

## Database Schema

The application uses SQLite to store data. The database schema includes:

- **Users**: Stores user credentials and roles
- **Employees**: Manages pharmacy staff information
- **Medicines**: Tracks medicine inventory, expiry dates, and quantities
- **Suppliers**: Maintains supplier information and relationships

## Authentication

The app implements a secure authentication system with:

- Role-based access control (Admin, Pharmacist, Cashier)
- Persistent user sessions using shared preferences
- Secure password storage

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support, please open an issue in the GitHub repository or contact the development team.
