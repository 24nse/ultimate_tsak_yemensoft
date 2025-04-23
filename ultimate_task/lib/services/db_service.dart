
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/delivery_bill_model.dart';

class DBService {
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }
 // Init DataBase Method
  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'bills.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE bills (
            BILL_SRL TEXT PRIMARY KEY,
            BILL_TYPE INTEGER,
            BILL_NO TEXT,
            BILL_DATE TEXT,
            BILL_TIME TEXT,
            BILL_AMT REAL,
            TAX_AMT REAL,
            DLVRY_AMT REAL,
            MOBILE_NO TEXT,
            CSTMR_NM TEXT,
            RGN_NM TEXT,
            CSTMR_BUILD_NO TEXT,
            CSTMR_FLOOR_NO TEXT,
            CSTMR_APRTMNT_NO TEXT,
            CSTMR_ADDRSS TEXT,
            LATITUDE TEXT,
            LONGITUDE TEXT,
            DLVRY_STATUS_FLG INTEGER
          )
        ''');
      },
    );
  }

// Insert Bills Method

  Future<void> insertBills(List<DeliveryBill> bills) async {
    final db = await database;
    final batch = db.batch();

    for (var bill in bills) {
      batch.insert(
        'bills',
        bill.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
  }


// Get All Bills Method
  Future<List<DeliveryBill>> getAllBills() async {
    final db = await database;
    final result = await db.query('bills');
    return result.map((e) => DeliveryBill.fromMap(e)).toList();
  }


// Filter By Status Method
  Future<List<DeliveryBill>> filterByStatus(int status) async {
    final db = await database;
    final result = await db.query(
      'bills',
      where: 'DLVRY_STATUS_FLG = ?',
      whereArgs: [status],
    );
    return result.map((e) => DeliveryBill.fromMap(e)).toList();
  }
}


