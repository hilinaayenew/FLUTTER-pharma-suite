import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/login_page.dart';
import 'screens/signup_page.dart';
import 'screens/verification_page.dart';
import 'screens/dashboard_page.dart';
import 'screens/medicine_list_page.dart';
import 'screens/suppliers_page.dart';
import 'screens/employees_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pharmacy Management',
      theme: AppTheme.darkTheme,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/verification': (context) => const VerificationPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/medicines': (context) => const MedicineListPage(),
        '/suppliers': (context) => const SuppliersPage(),
        '/employees': (context) => const EmployeesPage(),
      },
    );
  }
}