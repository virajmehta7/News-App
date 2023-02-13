class Article {
  Article(
      {required this.source,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt});

  Source source;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
      source: Source.fromJson(json["source"]),
      title: json["title"] == null ? '' : json["title"],
      description: json["description"] == null ? '' : json["description"],
      url: json["url"] == null ? '' : json["url"],
      urlToImage: json["urlToImage"] == null ? '' : json["urlToImage"],
      publishedAt: DateTime.parse(json["publishedAt"]));

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String()
      };
}

class Source {
  Source({required this.name});

  String name;

  factory Source.fromJson(Map<String, dynamic> json) =>
      Source(name: json["name"] == null ? '' : json["name"]);

  Map<String, dynamic> toJson() => {"name": name};
}
