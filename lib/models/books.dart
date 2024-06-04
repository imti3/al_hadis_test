class Book {
  final int id;
  final String? title;
  final String? titleAr;
  final int? numberOfHadis;
  final String? abvrCode;
  final String? bookName;
  final String? bookDesc;

  Book({
    required this.id,
    this.title,
    this.titleAr,
    this.numberOfHadis,
    this.abvrCode,
    this.bookName,
    this.bookDesc,
  });

  factory Book.fromMap(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'] as String?,
      titleAr: json['title_ar'] as String?,
      numberOfHadis: json['number_of_hadis'] as int?,
      abvrCode: json['abvr_code'] as String?,
      bookName: json['book_name'] as String?,
      bookDesc: json['book_descr'] as String?,
    );
  }
}
