import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:my_flutter_form_mvc_architecture/models/news_model.dart';
import 'package:my_flutter_form_mvc_architecture/repositories/news_repo.dart';

class NewsController extends ControllerMVC {
  List<NewsModel> newsModelList = [];

  var globalKey = GlobalKey<ScaffoldState>();

  NewsController(){
    getTodayNews();
  }

  getTodayNews() async {
    try{
      var newsModelList = await getNewsFromAPI();
      setState(() {});
      print("Controller News Model List $newsModelList");
      debugPrint("${newsModelList.length}");
    }catch(e){
      print(e);
    }
    
  }
}
