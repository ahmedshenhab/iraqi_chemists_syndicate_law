// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseHelper {
//   factory DatabaseHelper() => _instance;
//   DatabaseHelper._internal();
//   // Singleton setup
//   static final DatabaseHelper _instance = DatabaseHelper._internal();

//   Database? _database;

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     String path = join(await getDatabasesPath(), 'app_database.db');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         // await db.execute('''
//         //   CREATE TABLE cart (
//         //     id INTEGER PRIMARY KEY AUTOINCREMENT,
//         //     name TEXT,
//         //     ingrediant TEXT
//         //   )
//         // ''');
//       },
//     );
//   }
// }
