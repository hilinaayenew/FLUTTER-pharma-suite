import 'package:pharam_suite_v5/services/db_service.dart';

class Supplier {
  final int? id;
  final String name;
  final String contactPerson;
  final String phone;
  final String email;
  final String address;

  Supplier({
    this.id,
    required this.name,
    required this.contactPerson,
    required this.phone,
    required this.email,
    required this.address,
  });

  factory Supplier.fromMap(Map<String, dynamic> map) => Supplier(
        id: map['id'],
        name: map['name'],
        contactPerson: map['contact_person'],
        phone: map['phone'],
        email: map['email'],
        address: map['address'],
      );

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        'name': name,
        'contact_person': contactPerson,
        'phone': phone,
        'email': email,
        'address': address,
      };
}

class SupplierDAO {
  static final SupplierDAO instance = SupplierDAO._();
  SupplierDAO._();

  Future<int> insertSupplier(Supplier supplier) async {
    final db = await DatabaseService.instance.database;
    return await db.insert('suppliers', supplier.toMap());
  }

  Future<Supplier?> getSupplierById(int id) async {
    final db = await DatabaseService.instance.database;
    final result =
        await db.query('suppliers', where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty ? Supplier.fromMap(result.first) : null;
  }

  Future<List<Supplier>> getAllSuppliers() async {
    final db = await DatabaseService.instance.database;
    final result = await db.query('suppliers');
    return result.map((map) => Supplier.fromMap(map)).toList();
  }

  Future<int> updateSupplier(Supplier supplier) async {
    final db = await DatabaseService.instance.database;
    return await db.update('suppliers', supplier.toMap(),
        where: 'id = ?', whereArgs: [supplier.id]);
  }

  Future<int> deleteSupplier(int id) async {
    final db = await DatabaseService.instance.database;
    return await db.delete('suppliers', where: 'id = ?', whereArgs: [id]);
  }
}
