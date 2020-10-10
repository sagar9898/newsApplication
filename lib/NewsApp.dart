//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:newsapp/news_bloc.dart';
import 'package:newsapp/news_provider.dart';

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc=NewsProvider.of(context);
    bloc.fetchTopdIds();

    return Scaffold(
      appBar: AppBar(title: Text("Top News!!"),),
      body:storyWidegt(bloc),

    );
  }
  Widget storyWidegt(NewsBloc newsBloc){
    return StreamBuilder(stream:newsBloc.topIDS,builder:(context,AsyncSnapshot<List<int>> snapshot){
      if (!snapshot.hasData){
        return Text("Still Waiting for Story");
      }
      else{
        return ListView.builder(itemCount:snapshot.data.length,itemBuilder: (context,int index){
          return Text('${snapshot.data[index]}');
        });
      }


    });
  }
}
