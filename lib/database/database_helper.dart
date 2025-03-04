import "package:sqflite/sqflite.dart";
import "package:path/path.dart";

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if(_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), "app_database.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute("""CREATE TABLE users( 
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT,
        password TEXT
        )""");
      }
    );
  }

  Future<int> insertUser(String email, String password) async {
    final db = await database;
    return await db.insert('users', {"email": email, "password": password});
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    return await db.query("users");
  }
}