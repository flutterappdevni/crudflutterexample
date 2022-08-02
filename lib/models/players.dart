class Players {
  final int userId;
  final int id;
  final String title;

  const Players({
    required this.userId,
    required this.id,
    required this.title,
  });
  Map<String, dynamic> toJson() => {"userId": userId, "id": id, "title": title};

  factory Players.fromJson(Map<String, dynamic> json) {
    return Players(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
