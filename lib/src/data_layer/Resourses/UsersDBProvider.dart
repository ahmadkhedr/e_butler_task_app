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
    print("HIII");
    // get adocumet to save your db in in the temprory memory of the mobile
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    //join the folder path to the actual database path to create a path to the database

    final path = join(documentDirectory.path, "butcherUsers.db");

    // openDataBase == > Chack if there is adata base in the mentioned path or not...if no then it create one

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
