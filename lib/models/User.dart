import 'package:pharam_suite_v5/services/db_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  final int? id;
  final String username;
  final String email;
  final String password;
  final String role;

  User({
    this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.role,
  });

  factory User.fromMap(Map<String, dynamic> map) => User(
    id: map['id'],
    username: map['username'],
    email: map['email'],
    password: map['password'],
    role: map['role'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'username': username,
    'email': email,
    'password': password,
    'role': role,
  };
}

class UserDAO {
  static final UserDAO instance = UserDAO._();
  UserDAO._();

  // Insert user
  Future<int> insertUser(User user) async {
    final db = await DatabaseService.instance.database;
    return await db.insert('users', user.toMap());
  }

  // Get user by id
  Future<User?> getUserById(int id) async {
    final db = await DatabaseService.instance.database;
    final result = await db.query('users', where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty ? User.fromMap(result.first) : null;
  }

  // Get all users
  Future<List<User>> getAllUsers() async {
    final db = await DatabaseService.instance.database;
    final result = await db.query('users');
    return result.map((map) => User.fromMap(map)).toList();
  }

  // Update user
  Future<int> updateUser(User user) async {
    final db = await DatabaseService.instance.database;
    return await db.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  // Delete user
  Future<int> deleteUser(int id) async {
    final db = await DatabaseService.instance.database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  Future<User?> authenticate(String username, String password) async {
    final db = await DatabaseService.instance.database;
    final result = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    return result.isNotEmpty ? User.fromMap(result.first) : null;
  }

  Future<void> saveUserToPrefs(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('user_id', user.id!);
    await prefs.setString('username', user.username);
    await prefs.setString('email', user.email);
    await prefs.setString('role', user.role);
  }

  Future<User?> getUserFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('user_id');
    final username = prefs.getString('username');
    final email = prefs.getString('email');
    final role = prefs.getString('role');
    if (id != null && username != null && email != null && role != null) {
      return User(
        id: id,
        username: username,
        email: email,
        password: '',
        role: role,
      );
    }
    return null;
  }

  Future<void> clearUserPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_id');
    await prefs.remove('username');
    await prefs.remove('email');
    await prefs.remove('role');
  }
}
