import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final String userRole; // Add this line to accept user role

  const DashboardPage({Key? key, required this.userRole}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // TODO: Implement logout logic
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF1E2F4D),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF1E2F4D),
              ),
              accountName: const Text(
                'User Name',
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: Text(
                userRole.toUpperCase(),
                style: const TextStyle(color: Colors.green),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: Color(0xFF1E2F4D)),
              ),
            ),
            if (userRole == 'Pharmacist') ...[
              ListTile(
                leading: const Icon(Icons.dashboard, color: Colors.white),
                title: const Text('Dashboard', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.medical_services, color: Colors.white),
                title: const Text('Medicine List', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/medicines');
                },
              ),
              ListTile(
                leading: const Icon(Icons.category, color: Colors.white),
                title: const Text('Categories', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/categories');
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.white),
                title: const Text('Settings', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/settings');
                },
              ),
            ],
            if (userRole == 'Cashier') ...[
              ListTile(
                leading: const Icon(Icons.dashboard, color: Colors.white),
                title: const Text('Dashboard', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.medical_services, color: Colors.white),
                title: const Text('Medicine List', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/medicines');
                },
              ),
              ListTile(
                leading: const Icon(Icons.category, color: Colors.white),
                title: const Text('Categories', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/categories');
                },
              ),
              ListTile(
                leading: const Icon(Icons.receipt, color: Colors.white),
                title: const Text('Transactions', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/transactions');
                },
              ),
   
              ListTile(
                leading: const Icon(Icons.people, color: Colors.white),
                title: const Text('Suppliers', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/suppliers');
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.white),
                title: const Text('Settings', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/settings');
                },
              ),
            ],
          if (userRole == 'Admin') ...[
                          ListTile(
                leading: const Icon(Icons.dashboard, color: Colors.white),
                title: const Text('Dashboard', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.medical_services, color: Colors.white),
                title: const Text('Medicine List', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/medicines');
                },
              ),
              ListTile(
                leading: const Icon(Icons.category, color: Colors.white),
                title: const Text('Categories', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/categories');
                },
              ),
              ListTile(
                leading: const Icon(Icons.receipt, color: Colors.white),
                title: const Text('Transactions', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/transactions');
                },
              ),

              ListTile(
                leading: const Icon(Icons.people, color: Colors.white),
                title: const Text('Suppliers', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/suppliers');
                },
              ),
              ListTile(
                leading: const Icon(Icons.people,color: Colors.white),
                title: const Text('Employees', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/employees');
                },
              ), 
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.white),
                title: const Text('Settings', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/settings');
                },
              ),
          ]
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dashboard',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'A quick data overview of the inventory.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4, // Fixed for full size
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              children: [
                _buildStatCard(
                  '8904',
                  'Medicine sale today',
                  Icons.medical_services_outlined,
                  Colors.blue,
                ),
                _buildStatCard(
                  '56',
                  'Transactions today',
                  Icons.receipt_outlined,
                  Colors.blue,
                ),
                _buildStatCard(
                  '298',
                  'Medicines Available',
                  Icons.medical_services_outlined,
                  Colors.blue,
                ),
                _buildStatCard(
                  '01',
                  'Expired Medicine',
                  Icons.warning_outlined,
                  Colors.red,
                  isWarning: true,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildInfoCard(
              'My Pharmacy',
              [
                InfoItem('Total no of Suppliers', '67'),
                InfoItem('Total no of Customers', '567'),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              'Quick Report',
              [
                InfoItem('Total Qty of\nMedicines Sold', '70,856'),
                InfoItem('Qty of Medicines\nin stock', '5,288'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, bool isSelected) {
    return ListTile(
      leading: Icon(icon, color: isSelected ? Colors.white : Colors.white70),
      title: Text(
        title,
        style: TextStyle(color: isSelected ? Colors.white : Colors.white70),
      ),
      selected: isSelected,
      selectedTileColor: Colors.white.withOpacity(0.1),
      onTap: () {},
    );
  }

  Widget _buildStatCard(String value, String title, IconData icon, Color color, {bool isWarning = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: isWarning ? Border.all(color: Colors.red.shade100) : null,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 32),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isWarning ? Colors.red : Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, List<InfoItem> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: items
                .map((item) => Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.value,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.label,
                            style: TextStyle(color: Colors.grey[600], fontSize: 12),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class InfoItem {
  final String label;
  final String value;

  InfoItem(this.label, this.value);
}