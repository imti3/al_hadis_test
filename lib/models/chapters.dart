class Chapter {
  final int id;
  final int chapter_id;
  final int book_id;
  final String? title;
  final int number;
  final String? hadis_range;
  final String? bookName;

  Chapter({
    required this.id,
    required this.chapter_id,
    required this.book_id,
    this.title,
    required this.number,
    this.hadis_range,
    this.bookName,

  });

  factory Chapter.fromMap(Map<String, dynamic> json) {
    return Chapter(
      id: json['id'],
      chapter_id: json['chapter_id'],
      book_id: json['book_id'],
      title: json['title'] as String?,
      number: json['number'],
      hadis_range: json['hadis_range'] as String?,
      bookName: json['book_name'] as String?,

    );
  }
}
