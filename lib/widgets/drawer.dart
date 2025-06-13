import 'package:flutter/material.dart';
import 'package:pharam_suite_v5/models/User.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserDAO.instance.getUserFromPrefs(),
      builder: (context, asyncSnapshot) {
        User user = asyncSnapshot.data as User;

        return Drawer(
          backgroundColor: const Color(0xFF1E2F4D),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Color(0xFF1E2F4D)),
                accountName: Text(
                  user.username,
                  style: TextStyle(color: Colors.white),
                ),
                accountEmail: Text(
                  user.email,
                  style: const TextStyle(color: Colors.green),
                ),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Color(0xFF1E2F4D)),
                ),
              ),
              if (user.role == 'admin') ...[
                ListTile(
                  leading: const Icon(Icons.dashboard, color: Colors.white),
                  title: const Text(
                    'Dashboard',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.medical_services,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Medicine List',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/medicines');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.people, color: Colors.white),
                  title: const Text(
                    'Suppliers',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/suppliers');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.people, color: Colors.white),
                  title: const Text(
                    'Employees',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/employees');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings, color: Colors.white),
                  title: const Text(
                    'Settings',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
