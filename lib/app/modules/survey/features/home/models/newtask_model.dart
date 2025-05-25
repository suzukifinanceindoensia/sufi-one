import 'package:sufi_one/app/modules/survey/models/application_snap_shoot_model.dart';

class SurveyNewtaskModel {
  int? submissionId; // 0,
  String? submissionNumber; // "String",
  int? applicationId; // 0,
  String? applicationCode; // "String",
  String? applicationName; // "String",
  DateTime? submissionDate; // "String",
  DateTime? finishedDate; // "String",
  int? submissionLat; // 0,
  int? submissionLon; // 0,
  int? stateId;
  String? stateName; // "String",
  String? stateStatus; // "String",
  int? userId; // 0,
  String? userName; // "String",
  int? organitationId; // 0,
  String? organitaionName; // "String",
  String? deviceId; // "String",
  String? deviceModel; // "String",
  String? submitMessage; // "string"
  List<ApplicationSnapshootModel?>? data;

  SurveyNewtaskModel({
    this.submissionId,
    this.submissionNumber,
    this.applicationId,
    this.applicationCode,
    this.applicationName,
    this.submissionDate,
    this.finishedDate,
    this.submissionLat,
    this.submissionLon,
    this.stateId,
    this.stateName,
    this.stateStatus,
    this.userId,
    this.userName,
    this.organitationId,
    this.organitaionName,
    this.deviceId,
    this.deviceModel,
    this.submitMessage,
    this.data,
  });

  factory SurveyNewtaskModel.fromJson(Map<String, dynamic> json) {
    return SurveyNewtaskModel(
      submissionId: (json["submission_id"] as int?)?.toInt(),
      submissionNumber: (json["submission_number"] as String?),
      applicationId: (json["application_id"] as num?)?.toInt(),
      applicationCode: (json["application_code"] as String?),
      applicationName: (json["application_name"] as String?),
      submissionDate:
          (json["submission_date"] != null
              ? DateTime.parse(
                (json["submission_date"] as String).toLowerCase().contains(
                          "z",
                        ) ==
                        false
                    ? (json["submission_date"] as String) + "z"
                    : (json["submission_date"] as String),
              )
              : null),
      finishedDate:
          (json["finished_date"] != null
              ? DateTime.parse(
                (json["finished_date"] as String).toLowerCase().contains("z") ==
                        false
                    ? (json["finished_date"] as String) + "z"
                    : (json["finished_date"] as String),
              )
              : null),
      submissionLat: (json["submission_lat"] as num?)?.toInt(),
      submissionLon: (json["submission_lon"] as num?)?.toInt(),
      stateId: (json["state_id"] as num?)?.toInt(),
      stateName: (json["state_name"] as String?),
      stateStatus: (json["state_status"] as String?),
      userId: (json["user_id"] as num?)?.toInt(),
      userName: (json["user_name"] as String?),
      organitationId: (json["organitation_id"] as num?)?.toInt(),
      organitaionName: (json["organitaion_name"] as String?),
      deviceId: (json["device_id"] as String?),
      deviceModel: (json["device_model"] as String?),
      submitMessage: (json["submit_message"] as String?),
      data:
          (json["data"] as List?)
              ?.map((e) => ApplicationSnapshootModel.fromJson(e))
              .toList() ??
          [],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "submission_id": submissionId,
      "submission_number": submissionNumber,
      "application_id": applicationId,
      "application_code": applicationCode,
      "application_name": applicationName,
      "submission_date": submissionDate?.toIso8601String(),
      "finished_date": finishedDate?.toIso8601String(),
      "submission_lat": submissionLat,
      "submission_lon": submissionLon,
      "state_id": stateId,
      "state_name": stateName,
      "state_status": stateStatus,
      "user_id": userId,
      "user_name": userName,
      "organitation_id": organitationId,
      "organitaion_name": organitaionName,
      "device_id": deviceId,
      "device_model": deviceModel,
      "submit_message": submitMessage,
      "data": data?.map((e) => e?.toJson()).toList(),
    };
  }
}
