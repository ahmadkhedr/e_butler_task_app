import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../data_layer/Models/LocalModels/DbModel.dart';

Database? _db;

class DbHelper {
  DbHelper() {
    init();
  }

  void init() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentDirectory.path, "butcherUsers.db");

    _db = await openDatabase(path, version: 1,
        onCreate: ((Database newDb, int version) {
      newDb.execute("create table Users(mail TEXT)");
    }));
  }

  Future<DbModel?> getUserMAil(String mail) async {
    final map = await _db!.rawQuery('select * from Users where mail ="$mail"');

    if (map.length > 0) {
      return DbModel.fromJson(map.first);
    }

    return null;
  }

  Future<int> addItem(DbModel item) {
    return _db!.insert("Users", item.toJson());
  }
}
