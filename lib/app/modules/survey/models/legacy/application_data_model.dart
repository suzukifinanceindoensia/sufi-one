class ApplicationDataModel {
  int? submissionId; //	:	29
  int? questionId; //	:	101
  String? value; //	:	LOLOS
  double? lat; //	:	0
  double? lon; //	:	0

  ApplicationDataModel({
    this.submissionId,
    this.questionId,
    this.value,
    this.lat,
    this.lon,
  });

  static ApplicationDataModel fromJson(Map<String, dynamic> json) {
    return ApplicationDataModel(
      submissionId: (json["submission_id"] as num?)?.toInt(),
      questionId: (json["question_id"] as num?)?.toInt(),
      value: (json["value"] as String?),
      lat: (json["lat"] as num?)?.toDouble(),
      lon: (json["lon"] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "submission_id": submissionId,
      "question_id": questionId,
      "value": value,
      "lat": lat,
      "lon": lon,
    };
  }
}
