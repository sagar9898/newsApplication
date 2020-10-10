import 'dart:io';

import 'package:http/http.dart';
import 'package:newsapp/item_model.dart';
import 'package:newsapp/repositry.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:newsapp/item_provider.dart';

class newsDB implements Source,Cache{
  Database db;
  newsDB(){
    init();
  }
  void init() async{
    Directory dir=await getApplicationDocumentsDirectory();
    final path=join(dir.path,'items.db');
    db=await openDatabase(
      path,
      version:1,
      onCreate: (Database newDB,int version) {
        newDB.execute(
            """
          CREATE TABLE NEWS (
          id INTEGER PRIMARY KEY,
          type TEXT,
          by TEXT,
          time INTEGER,
          text TEXT,
          parent INTEGER,
          kids BLOB,
          dead INTEGER,
          deleted INTEGER,
          url TEXT,
          score INTEGER,
          title TEXT,
          descendants INTEGER
          )
          """
        );
      }
        );
      }
      fetchStory(int id) async{
        final maps=await db.query(
          "NEWS",
          columns: null,
          where: "id=?",
          whereArgs: [id],
    );
        if(maps.length>0){
          return itemModel.fromDB(maps.first);

        }
        else{
          return null;
        }
  }
  Future<int> addItem(itemModel i) {
    return db.insert("NEWS", i.toMapforDB());
  }

  @override
  Future<List<int>> fetchID() {
    // TODO: implement fetchID
    return null;
  }
}

final ndb=newsDB();