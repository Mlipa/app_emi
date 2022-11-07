class News {
  final String? title;
  final String? author;
  final String? content;
  final String? urlToImg;
  final DateTime? date;

  News({this.title, this.author, this.content, this.urlToImg, this.date});

  News.fromJson(Map<String, Object?> json)
      : this(
          title: json['title']! as String,
          author: json['author']! as String,
          content: json['content']! as String,
          urlToImg: json['urlToImg'] as String,
          date: json['date'] as DateTime,
        );

  Map<String, Object?> toJson() {
    return {
      'title': title,
      'author': author,
      'content': content,
      'urlToImg': urlToImg,
      'date': date,
    };
  }
}
