class Article {
  Source? source;
  String? title;
  String? description;
  String? url;
  String? urlToImage;

  Article({
    this.source,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
    );
  }
}

class Source {
  String? name;

  Source({this.name});

  factory Source.fromJson(Map<String,dynamic> json) {
    return Source(
      name: json['name']
    );
  }
}