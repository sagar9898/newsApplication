
import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:newsapp/item_model.dart';
import 'package:newsapp/repositry.dart';
class ItemProvider implements Source {
  final _BASEURL='https://hacker-news.firebaseio.com/v0';
  Client client = Client();
  Future<List<int>>fetchID() async {
    final response= await client.get('$_BASEURL/topstories.json');
    final ids=json.decode(response.body);
    return ids.cast<int>();

  }
  Future<itemModel>fetchStory(int id) async{
    final response= await client.get('$_BASEURL/item/$id.json');
    final story=json.decode(response.body);
    return itemModel.fromJson(story);
  }



}