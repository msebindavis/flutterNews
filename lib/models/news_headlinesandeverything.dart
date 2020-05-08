class NewsAll {
  Map  source = {};
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;
  
  NewsAll({
this.source,
  this.author,
  this.title,
  this.description,
  this.url,
  this.urlToImage,
  this.publishedAt,
  this.content,
  });

  factory NewsAll.fromJson(Map<String,dynamic> json) {
    return NewsAll(
  source:json['source'],
  author:json['author'],
  title:json['title'],
  description:json['description'],
  url:json['url'],
  urlToImage:json['urlToImage'],
  publishedAt:json['publishedAt'],
  content:json['content'],
    );
  }

}