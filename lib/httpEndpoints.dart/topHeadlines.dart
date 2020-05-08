import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:newsilise/models/news_headlinesandeverything.dart';




class TopHeadlines {
  String country;
  String category;
  String sources;
  String q;
  TopHeadlines({
   this.country='',
   this.category='',
   this.sources='',
   this.q='', 
  });
  
  Future<List<NewsAll>> getNews () async{
    String newsApi='';
 if(country!=''){
    if(country!=''&&category!='') {
    newsApi='https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=a5831a38d9ce4a1589b276ef92fce668';
    } else {
      newsApi='https://newsapi.org/v2/top-headlines?country=$country&apiKey=a5831a38d9ce4a1589b276ef92fce668';
    }
 }   else if(category!=''){

    newsApi='https://newsapi.org/v2/top-headlines?category=$category&apiKey=a5831a38d9ce4a1589b276ef92fce668';

      } else if(sources!=''){
     newsApi='https://newsapi.org/v2/top-headlines?sources=$sources&apiKey=a5831a38d9ce4a1589b276ef92fce668';
   
      } else if(q!=''){
        newsApi='https://newsapi.org/v2/top-headlines?q=$q&language=en&apiKey=a5831a38d9ce4a1589b276ef92fce668';
      }
 final response = await http.get(newsApi);
 if(response.statusCode==200){
   Map<String,dynamic> body = json.decode(response.body);
  //  print(body['articles']);
   List<NewsAll> news=[];
   body['articles'].forEach((article){
NewsAll newsAll = NewsAll.fromJson(article);
news.add(newsAll);
   });
    return news;
 }
 else {
   throw Exception('Failed to Retrieve News');
   
 }

  }
}