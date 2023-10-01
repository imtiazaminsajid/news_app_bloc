import 'dart:convert';

class Articles {
  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Source? source;

  String? author;

  String? title;

  String? description;

  String? url;

  String? urlToImage;

  String? publishedAt;

  String? content;

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"] != null ? "${json["publishedAt"]}" : "",
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source!.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt,
        "content": content,
      };

  static Map<String, dynamic> toMap(Articles articles) => {
    "source": articles.source!.toJson(),
    "author": articles.author,
    "title": articles.title,
    "description": articles.description,
    "url": articles.url,
    "urlToImage": articles.urlToImage,
    "publishedAt": articles.publishedAt,
    "content": articles.content,
  };

  static String encode(List<Articles> articles) => json.encode(
    articles
        .map<Map<String, dynamic>>((music) => Articles.toMap(music))
        .toList(),
  );

  static List<Articles> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<Articles>((item) => Articles.fromJson(item))
          .toList();
}

class Source {
  Source({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}


