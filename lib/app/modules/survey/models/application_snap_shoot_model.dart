class ApplicationSnapshootModel {
  int? id; //": 113,
  String? code; //": "CUST_FULL_NAME",
  String? label; //": "NAMA LENGKAP PEMOHON",
  String? value; //": "DUDUNG JUNAEDI"

  ApplicationSnapshootModel({
    this.id,
    this.code,
    this.label,
    this.value,
  });

  static ApplicationSnapshootModel fromJson(Map<String, dynamic> json) {
    return ApplicationSnapshootModel(
      id: (json["id"] as int?)?.toInt(),
      code: (json["code"] as String?),
      label: (json["label"] as String?),
      value: (json["value"] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "code": code,
      "label": label,
      "value": value,
    };
  }
}
