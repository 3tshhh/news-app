import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/articleResponse/ArticleResponse.dart';
import 'package:news_app/model/sourceResponse/SourceResponse.dart';
class ApiManager{
    static Future<SourceResponse?> getSources(String category)async{
      try{
        Uri url = Uri.https("newsapi.org","/v2/top-headlines/sources",{
          "apiKey":"829cab809508409c986c6eaba90c331f",
          "category":category,
        });
        var response =  await http.get(url);
        var json = jsonDecode(response.body);
        var sourceResponse = SourceResponse.fromJson(json);
        return sourceResponse;
      }catch(error){
        print(error.toString());
      }
    }
    static Future<ArticleResponse?> getArticles(String sourceId)async{
      try{
        Uri url = Uri.https("newsapi.org","/v2/everything",{
          "apiKey":"829cab809508409c986c6eaba90c331f",
          "sources":sourceId,
        });
        var response =  await http.get(url);
        var json = jsonDecode(response.body);
        var articleResponse = ArticleResponse.fromJson(json);
        return articleResponse;
      }catch(error){
        print(error.toString());
      }
    }
}