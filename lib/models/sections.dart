class Section {
  final int id;
  final String? title;
  final String? preface;
  final String? number;

  Section({required this.id, this.title, this.preface, this.number});

  factory Section.fromMap(Map<String, dynamic> json) {
    return Section(
      id: json['id'],
      title: json['title'] as String?,
      preface: json['preface'] as String?,
      number: json['number'] as String?,
    );
  }
}
