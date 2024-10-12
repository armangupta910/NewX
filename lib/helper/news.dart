import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:news/models/articale_model.dart';
import 'package:http/http.dart' as http;

class News {

  
  List<ArticaleModel> news = [];

Future<void> getNews() async {

  final url = Uri.parse("https://newsapi.org/v2/top-headlines?country=us&apiKey=f69d8d148dce4b138ed4f441a78e6d6a");

  var response = await http.get(url);

  var jsonData = jsonDecode(response.body);

  print(jsonData);


  if(jsonData['status'] == "ok"){

    jsonData['articles'].forEach((element){
      
      if (element['urlToImage'] != null && element['description'] != null){
        ArticaleModel articaleModel = ArticaleModel(
          title: element['title'],
          author: element['author'],
          description: element['description'],
          url: element['url'],
          urlToImage: element['urlToImage'],
          // publishedAt: element['publishedAt'],
          // content: element['content']
        );
        news.add(articaleModel);
      }
    });

  }
}

}




class CategoriesNews {

  
  List<ArticaleModel> news = [];

Future<void> getNews(String category) async {

  final url = Uri.parse("https://newsapi.org/v2/everything?q=$category&sortBy=popularity&apiKey=f69d8d148dce4b138ed4f441a78e6d6a");

  var response = await http.get(url);

  var jsonData = jsonDecode(response.body);


  if(jsonData['status'] == "ok"){

    jsonData['articles'].forEach((element){
      
      if (element['urlToImage'] != null && element['description'] != null){
        ArticaleModel articaleModel = ArticaleModel(
          title: element['title'],
          author: element['author'],
          description: element['description'],
          url: element['url'],
          urlToImage: element['urlToImage'],
          // publishedAt: element['publishedAt'],
          // content: element['content']
        );
        news.add(articaleModel);
      }
    });

  }
}

}
