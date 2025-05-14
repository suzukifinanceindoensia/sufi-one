class SurveyCollectionModel {
  final int? id;
  final String? name;
  final String? hash;

  SurveyCollectionModel({this.id, this.name, this.hash});

  factory SurveyCollectionModel.fromJson(Map<String, dynamic> json) {
    return SurveyCollectionModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      hash: json['hash'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'hash': hash};
  }
}
