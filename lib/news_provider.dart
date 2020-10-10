import 'package:flutter/cupertino.dart';
import 'package:newsapp/news_bloc.dart';
import 'package:flutter/material.dart';

class NewsProvider extends InheritedWidget{
  final NewsBloc newsBloc;
  NewsProvider({Key key,Widget child})
    :newsBloc=NewsBloc(),
        super(key:key,child:child);
  static NewsBloc of(BuildContext context){
      return (context.inheritFromWidgetOfExactType(NewsProvider)as NewsProvider).newsBloc;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }}