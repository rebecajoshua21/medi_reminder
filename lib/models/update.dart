class Update {
  final String imageUrl;
  final String headline;
  final String content;
  final String date;

  Update({
    required this.imageUrl,
    required this.headline,
    required this.content,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'headline': headline,
      'content': content,
      'date': date,
    };
  }

  factory Update.fromJson(Map<String, dynamic> json) {
    return Update(
      imageUrl: json['imageUrl'],
      headline: json['headline'],
      content: json['content'],
      date: json['date'],
    );
  }
}
