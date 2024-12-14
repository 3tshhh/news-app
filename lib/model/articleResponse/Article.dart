import '../sourceResponse/Source.dart';


/// source : {"id":"abc-news","name":"ABC News"}
/// author : "DIDI TANG Associated Press"
/// title : "US updates a science and technology pact with China to reflect growing rivalry and security threats"
/// description : "The U.S. has updated a decades-old science and technology agreement with China to reflect their growing rivalry for technological dominance"
/// url : "https://abcnews.go.com/Technology/wireStory/us-updates-science-technology-pact-china-reflect-growing-116760550"
/// urlToImage : "https://i.abcnewsfe.com/a/031c0d88-a17c-47b1-b06b-39beb40fa81c/wirestory_f15ec895ce37b793f0418000ff8a11de_16x9.jpg?w=1600"
/// publishedAt : "2024-12-13T13:18:26Z"
/// content : "WASHINGTON -- The U.S. has updated a decades-old science and technology agreement with China to reflect their growing rivalry for technological dominance. The new agreement, signed Friday after many … [+2788 chars]"

class Article {
  Article({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  Article.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}