class Article{
  final String title;
  final String timeAgo;
  final String source;
  final String comments;
  final String imageUrl;
  final String description;

  Article({
    required this.title,
    required this.source,
    required this.imageUrl,
    required this.description,
    required this.comments,
    required this.timeAgo
  });
}