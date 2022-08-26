class wordsJSON {
  int? id;
  String? kafigna;
  String? amharic;
  String? english;

  wordsJSON(
    this.id,
    this.kafigna,
    this.amharic,
    this.english,
  );
  wordsJSON.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kafigna = json['kafigna'];
    amharic = json['Amharic'];
    english = json['English'];
  }
}
