import 'package:newsapp/item_model.dart';
import 'package:newsapp/item_provider.dart';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' show Client, Response;
import 'package:http/testing.dart';

void main(){
  test('Testing Network provider class',() async{
    final newsApi=ItemProvider();
    newsApi.client=MockClient((request) async{
      return Response(json.encode([1,2,3,4]), 200);
    });
    final ids= await newsApi.fetchID();
    expect(ids, [1,2,3,4]);
  });
  test('Testing Fetch Item',() async {
    final newsApi=ItemProvider();
    newsApi.client=MockClient((request) async{
      final jsonMap={'id':123};
      return Response(json.encode(jsonMap),200);
    });
    final item= await newsApi.fetchStory(999);
    expect(item.id, 123);
  });
}