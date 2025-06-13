import 'package:flutter/material.dart';
import 'package:pharam_suite_v5/models/Employee.dart';
import 'package:pharam_suite_v5/models/Medicine.dart';
import 'package:pharam_suite_v5/models/Supplier.dart';
import 'package:pharam_suite_v5/models/User.dart';
import 'package:pharam_suite_v5/widgets/drawer.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late Future<Map<String, dynamic>> _dashboardData;

  @override
  void initState() {
    super.initState();
    _dashboardData = _initializeDashboardData();
  }

  Future<Map<String, dynamic>> _initializeDashboardData() async {
    try {
      // Fetch all statistics concurrently
      final stats = await Future.wait([
        _getMedicineStats(),
        _getSupplierCount(),
        _getEmployeeCount(),
        _getStockStats(),
      ]);

      return {
        'medicineStats': stats[0],
        'supplierCount': stats[1],
        'employeeCount': stats[2],
        'stockStats': stats[3],
      };
    } catch (e) {
      throw Exception('Failed to initialize dashboard data: $e');
    }
  }

  Future<Map<String, dynamic>> _getMedicineStats() async {
    final medicines = await MedicineDAO.instance.getAllMedicines();
    final today = DateTime.now();

    final expiredMedicines =
        medicines
            .where(
              (m) =>
                  m.expiryDate != null &&
                  DateTime.parse(m.expiryDate!).isBefore(today),
            )
            .length;

    return {
      'totalMedicines': medicines.length,
      'expiredMedicines': expiredMedicines,
    };
  }

  Future<int> _getSupplierCount() async {
    return await SupplierDAO.instance.getAllSuppliers().then(
      (suppliers) => suppliers.length,
    );
  }

  Future<int> _getEmployeeCount() async {
    return await EmployeeDAO.instance.getAllEmployees().then(
      (employees) => employees.length,
    );
  }

  Future<Map<String, dynamic>> _getStockStats() async {
    final medicines = await MedicineDAO.instance.getAllMedicines();
    final totalStock = medicines.fold(0, (sum, m) => sum + m.quantity);

    return {'totalStock': totalStock};
  }

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
              UserDAO.instance.clearUserPrefs();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _dashboardData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('No data available'));
          }

          final data = snapshot.data!;
          final medicineStats = data['medicineStats'] as Map<String, dynamic>;
          final supplierCount = data['supplierCount'] as int;
          final employeeCount = data['employeeCount'] as int;

          return SingleChildScrollView(
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
                  crossAxisCount: 4,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  children: [
                    _buildStatCard(
                      medicineStats['totalMedicines'].toString(),
                      'Medicines Available',
                      Icons.medical_services_outlined,
                      Colors.blue,
                    ),
                    _buildStatCard(
                      medicineStats['expiredMedicines'].toString(),
                      'Expired Medicine',
                      Icons.warning_outlined,
                      Colors.red,
                      isWarning: true,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _buildInfoCard('My Pharmacy', [
                  InfoItem('Total no of Suppliers', supplierCount.toString()),
                  InfoItem('Total no of Employees', employeeCount.toString()),
                ]),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatCard(
    String value,
    String title,
    IconData icon,
    Color color, {
    bool isWarning = false,
  }) {
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
          Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
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
            children:
                items
                    .map(
                      (item) => Expanded(
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
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
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
