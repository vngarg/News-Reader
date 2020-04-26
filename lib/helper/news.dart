import 'dart:convert';

import 'package:new_reader/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        // print(element['urlToImage']);
         if(element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              url: element['url'],
              author: element['author'],
              description: element['description'],
              urlToImage: element['urlToImage'],
              content: element['content']);

          news.add(articleModel);
        }
      });
    }
  }
}
