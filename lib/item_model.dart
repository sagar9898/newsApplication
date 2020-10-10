import 'dart:convert';

class itemModel{
  int id,parent,score,descendantes,time;
  bool deleted,dead;
  String type,by,text,url,title;
  List<dynamic>kids;
  itemModel.fromJson(Map<String,dynamic>parsedJson){
    id=parsedJson['id'];
    parent=parsedJson['parent'];
    score=parsedJson['score'];
    descendantes=parsedJson['descendantes'];
    time=parsedJson['time'];
    deleted=parsedJson['deleted'];
    dead=parsedJson['dead'];
    type=parsedJson['type'];
    by=parsedJson['by'];
    text=parsedJson['text'];
    url=parsedJson['url'];
    title=parsedJson['title'];
    kids=parsedJson['kids'];
  }
  itemModel.fromDB(Map<String,dynamic>parsedJson){
    id=parsedJson['id'];
    parent=parsedJson['parent'];
    score=parsedJson['score'];
    descendantes=parsedJson['descendantes'];
    time=parsedJson['time'];
    deleted=parsedJson['deleted']==1;
    dead=parsedJson['dead']==1;
    type=parsedJson['type'];
    by=parsedJson['by'];
    text=parsedJson['text'];
    url=parsedJson['url'];
    title=parsedJson['title'];
    kids=jsonDecode(parsedJson['kids']);

  }
  Map<String,dynamic>toMapforDB(){
    return <String,dynamic>{"id": id,
      "type":type,
      "by":by,
      "time":time,
      "text":text,
      "parent":parent,
      "url":url,
      "score":score,
      "title":title,
      "descendantes":descendantes,
      "dead":dead?1:0,
      "deleted":deleted?1:0,
      "kids":jsonEncode(kids)

    };

  }
}