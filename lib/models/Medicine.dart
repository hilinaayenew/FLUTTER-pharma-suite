import 'package:pharam_suite_v5/services/db_service.dart';

class Medicine {
  final int? id;
  final String name;
  final String category;
  final String description;
  final double price;
  final int quantity;
  final String expiryDate;
  final int? supplierId;

  Medicine({
    this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.quantity,
    required this.expiryDate,
    this.supplierId,
  });

  factory Medicine.fromMap(Map<String, dynamic> map) => Medicine(
        id: map['id'],
        name: map['name'],
        category: map['category'],
        description: map['description'],
        price: map['price'] is int
            ? (map['price'] as int).toDouble()
            : map['price'],
        quantity: map['quantity'],
        expiryDate: map['expiry_date'],
        supplierId: map['supplier_id'],
      );

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        'name': name,
        'category': category,
        'description': description,
        'price': price,
        'quantity': quantity,
        'expiry_date': expiryDate,
        'supplier_id': supplierId,
      };
}

class MedicineDAO {
  static final MedicineDAO instance = MedicineDAO._();
  MedicineDAO._();

  Future<int> insertMedicine(Medicine medicine) async {
    final db = await DatabaseService.instance.database;
    return await db.insert('medicines', medicine.toMap());
  }

  Future<Medicine?> getMedicineById(int id) async {
    final db = await DatabaseService.instance.database;
    final result =
        await db.query('medicines', where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty ? Medicine.fromMap(result.first) : null;
  }

  Future<List<Medicine>> getAllMedicines() async {
    final db = await DatabaseService.instance.database;
    final result = await db.query('medicines');
    return result.map((map) => Medicine.fromMap(map)).toList();
  }

  Future<int> updateMedicine(Medicine medicine) async {
    final db = await DatabaseService.instance.database;
    return await db.update('medicines', medicine.toMap(),
        where: 'id = ?', whereArgs: [medicine.id]);
  }

  Future<int> deleteMedicine(int id) async {
    final db = await DatabaseService.instance.database;
    return await db.delete('medicines', where: 'id = ?', whereArgs: [id]);
  }
}
