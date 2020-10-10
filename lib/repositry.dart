import 'dart:core';

import 'package:newsapp/db_item.dart';
import 'package:newsapp/item_model.dart';
import 'package:newsapp/item_provider.dart';

class Reposity{
  //newsDB DB=newsDB();
  List<Source> sourcs=<Source>[
    ItemProvider(),
    ndb,
  ];
  List<Cache> caches=<Cache>[ndb,];
  //ItemProvider itemProvider=ItemProvider();
  Future<List<int>>fetchID(){
  return sourcs[1].fetchID();
  }
  Future<itemModel> fetchStory(int id)async{
    itemModel item;
    Source source;
    for (source in sourcs){
      item =await source.fetchStory(id);
      if(item!=null){
        break;
      }
    }
    for(var cache in caches){
      cache.addItem(item);
    }
    return item;

  }
}
abstract class Source{
  Future<List<int>>fetchID();
  Future<itemModel> fetchStory(int id);
}
abstract class Cache{
  addItem(itemModel i);

}