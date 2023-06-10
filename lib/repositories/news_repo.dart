import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_flutter_form_mvc_architecture/models/news_model.dart';


Future<List<NewsModel>> getNewsFromAPI()async{
  var data = await http.get(Uri.parse("https://newsapi.org/v2/everything?q=tesla&from=2023-04-08&sortBy=publishedAt&apiKey=63fd109e60bc497db28dc8c44a43f414"));
  var jsonData = jsonDecode(data.body);
  //NewsModel.fromJSON(jsonData["article"]);
  return (jsonData["articles"] as List).map((e) => NewsModel.fromJSON(e)).toList();

}