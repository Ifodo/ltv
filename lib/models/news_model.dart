


class NewsListItem {
  String? imageUrl;
  String? date;
  String? content;
  String? title;
  String? url;

  NewsListItem({
    this.imageUrl,
    this.date,
    this.content,
    this.title,
    this.url
  });

  factory NewsListItem.fromJSON(Map<String, dynamic> json) {
    return NewsListItem(
        imageUrl: json["image"],
        title: json["title"],
        content: json["content"],
        date: json["date"],
        url: json["link"]
    );
  }
}
