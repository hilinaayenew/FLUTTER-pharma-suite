import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/login_page.dart';
import 'screens/medicine_list_page.dart';
import 'screens/suppliers_page.dart';
import 'screens/employees_page.dart';
import 'screens/settings_page.dart';

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
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/medicines': (context) => const MedicineListPage(),
        '/suppliers': (context) => const SuppliersPage(),
        '/employees': (context) => const EmployeesPage(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}
