import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  static Future<Database?> get db async {
    if (_db == null) {
      _db = await initDb();
    }
    return _db;
  }

  static Future<Database> initDb() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'hadith_db.db');

    // Check if the database exists
    bool dbExists = await databaseExists(path);

    if (!dbExists) {
      // If not, copy from asset
      ByteData data = await rootBundle.load('assets/hadith_db.db');
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write the byte data to the file
      await File(path).writeAsBytes(bytes);
    }

    return await openDatabase(path);
  }

  static Future<List<Map<String, dynamic>>> getBooks() async {
    final dbClient = await db;
    return await dbClient!.query('books');
  }

  static Future<List<Map<String, dynamic>>> getChapters() async {
    final dbClient = await db;
    return await dbClient!.query('chapter');
  }

  static Future<List<Map<String, dynamic>>> getSections() async {
    final dbClient = await db;
    return await dbClient!.query('section');
  }

  static Future<List<Map<String, dynamic>>> getHadiths() async {
    final dbClient = await db;
    return await dbClient!.query('hadith');
  }




// Add similar methods for 'chapter', 'hadith', and 'section' tables if needed
}
