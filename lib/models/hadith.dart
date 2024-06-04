class Hadith {
  final int id;
  final int sectionId;
  final String? ar;
  final String? narrator;
  final String? bn;

  Hadith({required this.id, required this.sectionId, this.ar, this.narrator, this.bn});

  factory Hadith.fromMap(Map<String, dynamic> json) {
    return Hadith(
      id: json['hadith_id'],
      sectionId: json['section_id'],
      ar: json['ar'] as String?,
      narrator: json['narrator'] as String?,
      bn: json['bn'] as String?,
    );
  }
}
