// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:my_flutter_form_mvc_architecture/controllers/news_controller.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends StateMVC<NewsScreen> {
  final NewsController _newsController = NewsController();

  _NewsScreenState() : super(NewsController());

  @override
  void initState() {
    _newsController.getTodayNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text("News")),
        body: _newsController.newsModelList.isNotEmpty
            ? ListView.builder(
              itemCount: _newsController.newsModelList.length,
              itemBuilder: (con, index){
                return Card(
                  child: ListTile(
                    title: Image.network(
                        _newsController.newsModelList[index].urlToImage),
                    subtitle: Text(_newsController.newsModelList[index].title),
                  )

                );
                
              })
            : const Center(child:  CircularProgressIndicator()));
  }
}
