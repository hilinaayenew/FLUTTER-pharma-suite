import 'package:pharam_suite_v5/services/db_service.dart';

class Employee {
  final int? id;
  final String name;
  final String role;
  final String phone;
  final String email;
  final String address;

  Employee({
    this.id,
    required this.name,
    required this.role,
    required this.phone,
    required this.email,
    required this.address,
  });

  factory Employee.fromMap(Map<String, dynamic> map) => Employee(
        id: map['id'],
        name: map['name'],
        role: map['role'],
        phone: map['phone'],
        email: map['email'],
        address: map['address'],
      );

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        'name': name,
        'role': role,
        'phone': phone,
        'email': email,
        'address': address,
      };
}

class EmployeeDAO {
  static final EmployeeDAO instance = EmployeeDAO._();
  EmployeeDAO._();

  Future<int> insertEmployee(Employee employee) async {
    final db = await DatabaseService.instance.database;
    return await db.insert('employees', employee.toMap());
  }

  Future<Employee?> getEmployeeById(int id) async {
    final db = await DatabaseService.instance.database;
    final result =
        await db.query('employees', where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty ? Employee.fromMap(result.first) : null;
  }

  Future<List<Employee>> getAllEmployees() async {
    final db = await DatabaseService.instance.database;
    final result = await db.query('employees');
    return result.map((map) => Employee.fromMap(map)).toList();
  }

  Future<int> updateEmployee(Employee employee) async {
    final db = await DatabaseService.instance.database;
    return await db.update('employees', employee.toMap(),
        where: 'id = ?', whereArgs: [employee.id]);
  }

  Future<int> deleteEmployee(int id) async {
    final db = await DatabaseService.instance.database;
    return await db.delete('employees', where: 'id = ?', whereArgs: [id]);
  }
}
