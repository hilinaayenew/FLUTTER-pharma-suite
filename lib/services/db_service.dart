import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();

  DatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) return _db!;

    _db = await getDatabase();

    return _db!;
  }

  Future<Database> getDatabase() async {
    final dbDirPath = await getDatabasesPath();
    final dbPath = join(dbDirPath, 'pharma.db');

    final database = openDatabase(
      dbPath,
      onCreate: (db, version) async {
        await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT UNIQUE,
        email TEXT UNIQUE,
        password TEXT,
        role TEXT
      );
    ''');
        await db.execute('''
      CREATE TABLE employees (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        role TEXT,
        phone TEXT,
        email TEXT,
        address TEXT
      );
    ''');
        await db.execute('''
      CREATE TABLE suppliers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        contact_person TEXT,
        phone TEXT,
        email TEXT,
        address TEXT
      );
    ''');
        await db.execute('''
      CREATE TABLE medicines (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        category TEXT,
        description TEXT,
        price REAL,
        quantity INTEGER,
        expiry_date TEXT,
        supplier_id INTEGER,
        FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
      );
    ''');
        await db.insert('users', {
          'username': 'admin',
          'email': 'admin@example.com',
          'password': 'admin123',
          'role': 'admin'
        });
      },
      version: 1,
    );

    return database;
  }
}
