class DicissionModel {
  int? pageId; //": 0,
  int? groupId; //": 0,
  int? dicissionGroupId; //": 0,
  int? dicissionQuestionId; //": 0,
  int? dicissionType; //": 0,
  String? dicissionValue; //": 0,
  String? groupCode; //": "string",
  String? groupName; //": "string",
  String? questionCode; //": "string",
  String? questionName; //": "string",
  String? questionLabel; //": "string",
  String? questionHint; //": "string",
  String? questionType; //": "string",
  int? questionCollectionId; //": 0
  bool? newData;

  DicissionModel({
    this.pageId,
    this.groupId,
    this.dicissionGroupId,
    this.dicissionQuestionId,
    this.dicissionType,
    this.dicissionValue,
    this.groupCode,
    this.groupName,
    this.questionCode,
    this.questionName,
    this.questionLabel,
    this.questionHint,
    this.questionType,
    this.questionCollectionId,
    this.newData = false,
  });

  static DicissionModel fromJson(Map<String, dynamic> json) {
    return DicissionModel(
      pageId: (json["page_id"] as num?)?.toInt(),
      groupId: (json["group_id"] as num?)?.toInt(),
      dicissionGroupId: (json["dicission_group_id"] as num?)?.toInt(),
      dicissionQuestionId: (json["dicission_question_id"] as num?)?.toInt(),
      dicissionType: (json["dicission_type"] as num?)?.toInt(),
      dicissionValue: (json["dicission_value"] as String?),
      groupCode: (json["group_code"] as String?),
      groupName: (json["group_name"] as String?),
      questionCode: (json["question_code"] as String?),
      questionName: (json["question_name"] as String?),
      questionLabel: (json["question_label"] as String?),
      questionHint: (json["question_hint"] as String?),
      questionType: (json["question_type"] as String?),
      questionCollectionId: (json["question_collection_id"] as num?)?.toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "page_id": pageId,
      "group_id": groupId,
      "dicission_group_id": dicissionGroupId,
      "dicission_question_id": dicissionQuestionId,
      "dicission_type": dicissionType,
      "dicission_value": dicissionValue,
      "group_code": groupCode,
      "group_name": groupName,
      "question_code": questionCode,
      "question_name": questionName,
      "question_label": questionLabel,
      "question_hint": questionHint,
      "question_type": questionType,
      "question_collection_id": questionCollectionId,
    };
  }

  Map<String, dynamic> toInputJson() {
    return {
      "page_id": pageId,
      "group_id": groupId,
      "dicission_group_id": dicissionGroupId,
      "dicission_question_id": dicissionQuestionId,
      "dicission_type": dicissionType,
      "dicission_value": dicissionValue,
    };
  }
}

class DicissionType {
  static const int notEqual = 401;
  static const int equal = 402;
  static const int gratherThen = 403;
  static const int lessThen = 404;
  static const int gratherAndEqual = 405;
  static const int lessAndEqual = 406;
  static const int inList = 407;
  static const int notInList = 408;
  static const int beetWeen = 409;
}
