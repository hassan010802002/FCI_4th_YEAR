import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:souqey/Helpers/Local_DB_Helper/Base_Local_DB_Helper.dart';
import 'package:sqflite/sqflite.dart';

@injectable
class FavoriteDbHelper implements BaseDbHelper {
  final String _DB_Name = "favorite_products.dp";
  final String _Products_Table = "FavoriteProducts";
  final String _ID_Column = "ID";
  final String _Product_ID = "Product_ID";
  late final String _DB_Path;

  late final Database? favDB;

  FavoriteDbHelper._Init() {
    OpenDB();
  }

  @factoryMethod
  factory FavoriteDbHelper() => FavoriteDbHelper._Init();

  @override
  void CloseDB() async {
    await favDB!.close();
  }

  @override
  deleteDbProduct({required String? productId}) async {
    await favDB!.transaction(
      (txn) async {
        Batch txnBatch = txn.batch();
        txnBatch.delete(
          _Products_Table,
          where: "$_Product_ID = ?",
          whereArgs: [productId!],
        );
        await txnBatch.commit();
      },
    ).then((value) async {
      final List<Map<String, Object?>> favProducts = await getDbFavProducts();
      log(favProducts.length.toString(), name: "Fav Products Count");
    }).whenComplete(() {
      log("Product Deleted Successfully", name: "Product Delete");
    });
  }

  @override
  insertDbProduct({required String? productId}) async {
    await favDB!.transaction(
      (txn) async {
        Batch txnBatch = txn.batch();
        txnBatch.insert(
          _Products_Table,
          {_Product_ID: productId},
          conflictAlgorithm: ConflictAlgorithm.ignore,
        );
        await txnBatch.commit();
      },
    ).then((value) async {
      final List<Map<String, Object?>> favProducts = await getDbFavProducts();
      log(favProducts.length.toString(), name: "Fav Products Count");
    }).whenComplete(() {
      log("Product Inserted Successfully", name: "Product Insert");
    });
  }

  @override
  void OpenDB() async {
    _DB_Path = await getDatabasesPath();
    final String path = join(_DB_Path, _DB_Name);
    favDB = await openDatabase(
      path,
      onCreate: _onCreateDB,
      version: 1,
    ).whenComplete(() {
      log("Favorite Products Database is Opened", name: "Favorite DB Status");
    });
  }

  @override
  updateDbProduct({required String? productId}) async {
    await favDB!.transaction(
      (txn) async {
        Batch txnBatch = txn.batch();
        txnBatch.update(
          _Products_Table,
          {_Product_ID: productId},
          where: "$_Product_ID = ?",
          whereArgs: [productId!],
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        await txnBatch.commit();
      },
    );
  }

  Future<void> _onCreateDB(Database dp, int version) async {
    await dp.execute("CREATE TABLE $_Products_Table($_ID_Column INTEGER PRIMARY KEY AUTOINCREMENT,$_Product_ID TEXT)");
  }

  @override
  Future<List<Map<String, Object?>>> getDbFavProducts() async {
    List<Map<String, Object?>>? favProducts = await favDB!.transaction<List<Map<String, Object?>>?>(
      (txn) async => await txn.query(
        _Products_Table,
        distinct: true,
      ),
    );
    if (favProducts != null) {
      return favProducts;
    } else {
      throw Exception("Favorite Products DB Exception");
    }
  }
}
