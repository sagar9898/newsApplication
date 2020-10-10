import 'package:newsapp/repositry.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class NewsBloc{
final _repo=Reposity();
final _topids=PublishSubject();
Observable<List<int>> get topIDS=>_topids.stream;
fetchTopdIds() async{
  final _ids=await _repo.fetchID();
  _topids.sink.add(_ids);
}
dispose(){
  _topids.close();
}
}