class Hadith {
  String key;
  String nameHadith;
  String textHadith;
  String explanationHadith;
  String translateNarrator;
  String audioHadith;
  bool fav;

  Hadith(
      {this.key = "",
      this.nameHadith = "",
      this.textHadith = "",
      this.explanationHadith = "",
      this.translateNarrator = "",
      this.audioHadith = "",
      this.fav = false});

  //To insert the data in the bd, we need to convert it into a Map
  //Para insertar los datos en la bd, necesitamos convertirlo en un Map
  Map<String, dynamic> toMap() => {
        "key": key,
        "nameHadith": nameHadith,
        "textHadith": textHadith,
        "explanationHadith": explanationHadith,
        "translateNarrator": translateNarrator,
        "audioHadith": audioHadith,
        "fav": fav
      };

  //to receive the data we need to pass it from Map to json
  //para recibir los datos necesitamos pasarlo de Map a json
  factory Hadith.fromMap(Map<String, dynamic> json) => Hadith(
      key: json["key"],
      nameHadith: json["nameHadith"],
      textHadith: json["textHadith"],
      explanationHadith: json["explanationHadith"],
      translateNarrator: json["translateNarrator"],
      audioHadith: json["audioHadith"],
      fav: false
  );
}
