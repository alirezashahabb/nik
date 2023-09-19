class CommentEntity {
  final int id;
  final String title;
  final String content;
  final String date;
  final String email;

  CommentEntity(
    this.id,
    this.title,
    this.content,
    this.date,
    this.email,
  );

  factory CommentEntity.fromJson(Map<String, dynamic> jsonObject) {
    return CommentEntity(
        jsonObject['id'],
        jsonObject['title'],
        jsonObject['content'],
        jsonObject['date'],
        jsonObject['author']['email']);
  }
}
