import 'package:project_apk_catatan_keuangan/models/category_model.dart';
import 'package:project_apk_catatan_keuangan/models/setting_model.dart';
import 'package:project_apk_catatan_keuangan/models/transaction_models.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;
  final String _dbName = 'SaveMoney.db';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Categories (
        categories_id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        type TEXT
      )
    ''');

    await db.execute('''
    INSERT INTO Categories (title, type) VALUES 
    ('Makanan', 'Expense'),
    ('Transportasi', 'Expense'),
    ('Gaji', 'Income'),
    ('Investasi', 'Income')
  ''');

    await db.execute('''
      CREATE TABLE Transactions (
        transaction_id INTEGER PRIMARY KEY AUTOINCREMENT,
        amount REAL,
        description TEXT,
        date TEXT,
        categories_id INTEGER,
        FOREIGN KEY (categories_id) REFERENCES Categories (categories_id)
      )
    ''');

    await db.execute('''
      CREATE TABLE Settings (
        nama TEXT PRIMARY KEY
      )
    ''');
  }

  Future<List<String>> getAvailableMonths() async {
    final db = await database;

    final result = await db.rawQuery('''
    SELECT DISTINCT strftime('%m', date) AS month, strftime('%Y', date) AS year
    FROM Transactions
    WHERE date IS NOT NULL
    ORDER BY year DESC, month DESC
  ''');

    const List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    List<String> monthsWithYearList = result.map((row) {
      final monthNumber = int.parse((row['month'] ?? '1').toString());
      final year = row['year'] ?? '';
      final monthName = months[monthNumber - 1];
      return '$monthName $year';
    }).toList();

    return monthsWithYearList;
  }

  Future<double> getTotalIncome() async {
    final db = await database;
    final result = await db.rawQuery('''
      SELECT SUM(amount) as totalIncome 
      FROM Transactions 
      WHERE categories_id IN (
        SELECT categories_id FROM Categories WHERE type = 'Income'
      )
    ''');
    return result.first['totalIncome'] != null
        ? (result.first['totalIncome'] as double)
        : 0.0;
  }

  Future<double> getTotalExpense() async {
    final db = await database;
    final result = await db.rawQuery('''
      SELECT SUM(amount) as totalExpense 
      FROM Transactions 
      WHERE categories_id IN (
        SELECT categories_id FROM Categories WHERE type = 'Expense'
      )
    ''');
    return result.first['totalExpense'] != null
        ? (result.first['totalExpense'] as double)
        : 0.0;
  }

  Future<double> getTotalIncomeMounth() async {
    final db = await database;

    final now = DateTime.now();
    final month = now.month;
    final year = now.year;

    final result = await db.rawQuery('''
    SELECT SUM(amount) as totalIncome 
    FROM Transactions 
    WHERE categories_id IN (
      SELECT categories_id FROM Categories WHERE type = 'Income'
    ) 
    AND strftime('%m', date) = ? AND strftime('%Y', date) = ?
  ''', [
      month.toString().padLeft(2, '0'),
      year.toString(),
    ]);

    return result.first['totalIncome'] != null
        ? (result.first['totalIncome'] as double)
        : 0.0;
  }

  Future<double> getTotalExpenseMounth() async {
    final db = await database;

    final now = DateTime.now();
    final month = now.month;
    final year = now.year;

    final result = await db.rawQuery('''
    SELECT SUM(amount) as totalExpense 
    FROM Transactions 
    WHERE categories_id IN (
      SELECT categories_id FROM Categories WHERE type = 'Expense'
    )
    AND strftime('%m', date) = ? AND strftime('%Y', date) = ?
  ''', [
      month.toString().padLeft(2, '0'),
      year.toString(),
    ]);

    return result.first['totalExpense'] != null
        ? (result.first['totalExpense'] as double)
        : 0.0;
  }

  Future<List<TransactionModel>> getLargestExpensesForCurrentMonth() async {
    final db = await database;
    final now = DateTime.now();
    final currentMonth = now.month;
    final currentYear = now.year;

    try {
      final List<Map<String, dynamic>> result = await db.rawQuery('''
       SELECT t.*, c.title as category_title, c.type as category_type
      FROM Transactions t
      JOIN Categories c ON t.categories_id = c.categories_id
      WHERE strftime('%m', t.date) = ?
      AND strftime('%Y', t.date) = ?
      AND c.type = 'Expense'
      ORDER BY t.amount DESC
      LIMIT 3
    ''', [currentMonth.toString().padLeft(2, '0'), currentYear.toString()]);

      return result.map((map) => TransactionModel.fromMap(map)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<int> insertTransaction(TransactionModel transaction) async {
    final db = await database;
    try {
      final id = await db.insert('Transactions', transaction.toMap());
      return id;
    } catch (e) {
      throw Exception('Database insert error');
    }
  }

  Future<List<TransactionModel>> getAllTransactions() async {
    final db = await database;

    final result = await db.rawQuery('''
    SELECT t.*, c.title as category_title, c.type as category_type
    FROM Transactions t
    JOIN Categories c ON t.categories_id = c.categories_id
  ''');

    return result.map((map) => TransactionModel.fromMap(map)).toList();
  }

  Future<int> updateTransaction(TransactionModel transaction) async {
    final db = await database;
    return await db.update(
      'Transactions',
      transaction.toMap(),
      where: 'transaction_id = ?',
      whereArgs: [transaction.id],
    );
  }

  Future<int> deleteTransaction(int id) async {
    final db = await database;
    return await db.delete(
      'Transactions',
      where: 'transaction_id = ?',
      whereArgs: [id],
    );
  }

  Future<int> insertCategory(CategoryModel category) async {
    final db = await database;
    return await db.insert('Categories', category.toMap());
  }

  Future<List<CategoryModel>> getCategories() async {
    final db = await database;
    final maps = await db.query('Categories');
    return maps.map((map) => CategoryModel.fromMap(map)).toList();
  }

  Future<int> updateCategory(CategoryModel category) async {
    final db = await database;
    return await db.update(
      'Categories',
      category.toMap(),
      where: 'categories_id = ?',
      whereArgs: [category.id],
    );
  }

  Future<int> deleteCategory(int id) async {
    final db = await database;
    return await db.delete(
      'Categories',
      where: 'categories_id = ?',
      whereArgs: [id],
    );
  }

  Future<int> insertSetting(SettingsModel setting) async {
    final db = await database;
    return await db.insert(
      'Settings',
      setting.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<SettingsModel>> getSettings() async {
    final db = await database;
    final maps = await db.query('Settings');
    return maps.map((map) => SettingsModel.fromMap(map)).toList();
  }

  Future<int> updateSetting(SettingsModel setting) async {
    final db = await database;
    return await db.update(
      'Settings',
      setting.toMap(),
      where: 'nama = ?',
      whereArgs: [setting.name],
    );
  }

  Future<int> deleteSetting(String name) async {
    final db = await database;
    return await db.delete(
      'Settings',
      where: 'nama = ?',
      whereArgs: [name],
    );
  }

  Future<void> deleteAllTransactions() async {
    final db = await database;
    await db.delete('Transactions');
  }

  Future<void> deleteAllCategories() async {
    final db = await database;
    await db.delete('Categories');
  }

  Future<bool> isNameAvailable() async {
    final db = await database;

    final result = await db.query(
      'Settings',
      where: 'nama IS NOT NULL',
      limit: 1,
    );

    return result.isNotEmpty;
  }
}
