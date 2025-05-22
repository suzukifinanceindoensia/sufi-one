import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:suzuki/model/application_snap_shoot_model.dart';
import 'package:suzuki/model/application_question_model.dart';
import 'package:suzuki/util/enum.dart';
import 'package:suzuki/util/network.dart';
import 'package:suzuki/util/system.dart';

class ApplicationModel {
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
  List<ApplicationQuestionModel> dataHistory;
  bool newRestored;
  bool modified = false;
  StreamController<bool> modifiedStream = StreamController<bool>.broadcast();

  ApplicationModel({
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
    this.dataHistory = const [],
    this.newRestored = false,
    this.modified = false,
  });

  Duration get duration {
    if (stateId != 102) {
      if (submissionDateLocal == null) {
        return const Duration(seconds: 0);
      }
      return DateTime.now().difference(submissionDateLocal!);
    } else {
      if (submissionDateLocal == null || finishedDateLocal == null) {
        return const Duration(seconds: 0);
      }
      return finishedDateLocal!.difference(submissionDateLocal!);
    }
  }

  DateTime? get submissionDateLocal {
    return submissionDate?.toLocal();
  }

  DateTime? get finishedDateLocal {
    return finishedDate?.toLocal();
  }

  void setAsModified() {
    modified = true;
    modifiedStream.add(true);
  }

  void setAsSaved() {
    modified = false;
    modifiedStream.add(false);
  }

  static ApplicationModel fromJson(Map<String, dynamic> json) {
    return ApplicationModel(
      submissionId: (json["submission_id"] as int?)?.toInt(),
      submissionNumber: (json["submission_number"] as String?),
      applicationId: (json["application_id"] as num?)?.toInt(),
      applicationCode: (json["application_code"] as String?),
      applicationName: (json["application_name"] as String?),
      submissionDate: (json["submission_date"] != null
          ? DateTime.parse(
              (json["submission_date"] as String).toLowerCase().contains("z") ==
                      false
                  ? (json["submission_date"] as String) + "z"
                  : (json["submission_date"] as String))
          : null),
      finishedDate: (json["finished_date"] != null
          ? DateTime.parse(
              (json["finished_date"] as String).toLowerCase().contains("z") ==
                      false
                  ? (json["finished_date"] as String) + "z"
                  : (json["finished_date"] as String))
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
      data: (json["data"] as List?)
              ?.map((e) => ApplicationSnapshootModel.fromJson(e))
              .toList() ??
          [],
      dataHistory: (json["data_history"] as List?)
              ?.map((e) => ApplicationQuestionModel.fromJson(e))
              .toList() ??
          [],
      newRestored: ((json["newRestored"] ?? false) as bool),
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
      "data_history": dataHistory.map((e) => e.toJson()).toList(),
      'newRestored': newRestored,
    };
  }

  static Future<ApplicationModel?> fromFile(File? file) {
    if (file == null) {
      return Future.value().then((value) => null);
    } else {
      return file.readAsString().then((value) {
        return ApplicationModel.fromJson(json.decode(value));
      }).catchError(
        (onError) {
          throw onError;
        },
      );
    }
  }

  static Future<List<ApplicationModel?>> inbox({
    required String? token,
  }) {
    return Network.get(
      url: Uri.parse(
        System.data.apiEndPoint.url + System.data.apiEndPoint.applicationInbox,
      ),
      otpRequired: null,
      headers: {
        HttpHeaders.authorizationHeader: "$token",
      },
    ).then((value) {
      if (value == null) {
        return <ApplicationModel>[];
      } else {
        return (value as List)
            .map((e) => ApplicationModel.fromJson(e))
            .toList();
      }
    }).catchError(
      (onError) {
        throw onError;
      },
    );
  }

  static Future<List<ApplicationModel?>> finished({
    required String? token,
    int? skip = 0,
    int? limit = 10,
    String? searchKey = "",
  }) {
    return Network.get(
      url: Uri.parse(
        System.data.apiEndPoint.url +
            System.data.apiEndPoint.applicationFinished,
      ),
      otpRequired: null,
      headers: {
        HttpHeaders.authorizationHeader: "$token",
      },
      querys: {
        "skip": "${skip ?? ""}",
        "limit": "${limit ?? ""}",
        "searchKey": searchKey ?? "",
      },
    ).then((value) {
      if (value == null) {
        return <ApplicationModel>[];
      } else {
        return (value as List)
            .map((e) => ApplicationModel.fromJson(e))
            .toList();
      }
    }).catchError(
      (onError) {
        throw onError;
      },
    );
  }

  static Future<bool?> confirmReaded({
    required String? token,
    required int? submissionId,
  }) {
    return Network.get(
      url: Uri.parse(
        System.data.apiEndPoint.url +
            System.data.apiEndPoint.applicationConfirmReaded,
      ),
      querys: {
        "submissionId": "$submissionId",
      },
      otpRequired: null,
      headers: {
        HttpHeaders.authorizationHeader: "$token",
      },
    ).then((value) {
      if (value == null) {
        return null;
      } else {
        return (value as bool);
      }
    }).catchError(
      (onError) {
        throw onError;
      },
    );
  }

  static Future<bool?> confirmProcess({
    required String? token,
    required int? submissionId,
  }) {
    return Network.get(
      url: Uri.parse(
        System.data.apiEndPoint.url +
            System.data.apiEndPoint.applicationConfirmProcess,
      ),
      querys: {
        "submissionId": "$submissionId",
      },
      otpRequired: null,
      headers: {
        HttpHeaders.authorizationHeader: "$token",
      },
    ).then((value) {
      if (value == null) {
        return null;
      } else {
        return (value as bool);
      }
    }).catchError(
      (onError) {
        throw onError;
      },
    );
  }

  static Future<bool?> confirmUploading({
    required String? token,
    required int? submissionId,
    required String? message,
  }) {
    return Network.get(
      url: Uri.parse(
        System.data.apiEndPoint.url +
            System.data.apiEndPoint.applicationConfirmUploading,
      ),
      querys: {
        "submissionId": "$submissionId",
        "message": "$message",
      },
      otpRequired: null,
      headers: {
        HttpHeaders.authorizationHeader: "$token",
      },
    ).then((value) {
      if (value == null) {
        return null;
      } else {
        return (value as bool);
      }
    }).catchError(
      (onError) {
        throw onError;
      },
    );
  }

  static Future<bool?> confirmFinish({
    required String? token,
    required int? submissionId,
    required String? message,
  }) {
    return Network.get(
      url: Uri.parse(
        System.data.apiEndPoint.url +
            System.data.apiEndPoint.applicationConfirmFinished,
      ),
      querys: {
        "submissionId": "$submissionId",
        "message": "$message",
      },
      otpRequired: null,
      headers: {
        HttpHeaders.authorizationHeader: "$token",
      },
    ).then((value) {
      if (value == null) {
        return null;
      } else {
        return (value as bool);
      }
    }).catchError(
      (onError) {
        throw onError;
      },
    );
  }

  bool existOnProcess() {
    try {
      var found = getSubmissionInProcess();

      if (found != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  File? getSubmissionInProcess() {
    try {
      var found = System.data
          .getDir(DirKey.process)
          .listSync()
          .whereType<File>()
          .toList()
          .where(
            (file) =>
                file.path.split('/').last.split('.').first.split('#').last ==
                    "submission" &&
                file.path.split('/').last.split('.').first.split('#')[1] ==
                    "${submissionId ?? ""}",
          )
          .toList();

      if (found.isNotEmpty) {
        return found.first;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  File? getSubmissionInUpload() {
    try {
      var found = System.data
          .getDir(DirKey.upload)
          .listSync()
          .whereType<File>()
          .toList()
          .where(
            (file) =>
                file.path.split('/').last.split('.').first.split('#').last ==
                    "submission" &&
                file.path.split('/').last.split('.').first.split('#')[1] ==
                    "${submissionId ?? ""}",
          )
          .toList();

      if (found.isNotEmpty) {
        return found.first;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  File? getFormRefInProcess() {
    try {
      var found = System.data
          .getDir(DirKey.process)
          .listSync()
          .whereType<File>()
          .toList()
          .where(
            (file) =>
                file.path.split('/').last.split('.').first.split('#').last ==
                    "fref" &&
                file.path.split('/').last.split('.').first.split('#')[1] ==
                    "${submissionId ?? ""}",
          )
          .toList();

      if (found.isNotEmpty) {
        return found.first;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  File? getFormRefInLocalInbox() {
    try {
      var found = System.data
          .getDir(DirKey.inbox)
          .listSync()
          .whereType<File>()
          .toList()
          .where(
            (file) =>
                file.path.split('/').last.split('.').first.split('#').last ==
                    "fref" &&
                file.path.split('/').last.split('.').first.split('#')[1] ==
                    "${submissionId ?? ""}",
          )
          .toList();

      if (found.isNotEmpty) {
        return found.first;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  File? getFormRefInUpload() {
    try {
      var found = System.data
          .getDir(DirKey.upload)
          .listSync()
          .whereType<File>()
          .toList()
          .where(
            (file) =>
                file.path.split('/').last.split('.').first.split('#').last ==
                    "fref" &&
                file.path.split('/').last.split('.').first.split('#')[1] ==
                    "${submissionId ?? ""}",
          )
          .toList();

      if (found.isNotEmpty) {
        return found.first;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  File? getFormInProcess() {
    try {
      var found = System.data
          .getDir(DirKey.process)
          .listSync()
          .whereType<File>()
          .toList()
          .where(
            (file) =>
                file.path.split('/').last.split('.').first.split('#').last ==
                    "form" &&
                file.path.split('/').last.split('.').first.split('#')[1] ==
                    "${submissionId ?? ""}",
          )
          .toList();

      if (found.isNotEmpty) {
        return found.first;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  File? getFormInUpload() {
    try {
      var found = System.data
          .getDir(DirKey.upload)
          .listSync()
          .whereType<File>()
          .toList()
          .where(
            (file) =>
                file.path.split('/').last.split('.').first.split('#').last ==
                    "form" &&
                file.path.split('/').last.split('.').first.split('#')[1] ==
                    "${submissionId ?? ""}",
          )
          .toList();

      if (found.isNotEmpty) {
        return found.first;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> safeSubmissionToUpload() {
    try {
      File file = File(System.data.getDir(DirKey.upload).path +
          "/submission#$submissionId#submission.json"); // 1
      return Future.value().then(
        (value) {
          return file.writeAsStringSync(json.encode(this),
              mode: FileMode.writeOnly);
        },
      );
      // return file
      //     .writeAsString(json.encode(this), mode: FileMode.writeOnly)
      //     .then((value) {
      //   return;
      // }).catchError(
      //   (onError) {
      //     throw onError;
      //   },
      // );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> safeSubmissionToProcess() {
    try {
      File file = File(System.data.getDir(DirKey.process).path +
          "/submission#$submissionId#submission.json"); // 1
      return Future.value().then(
        (value) {
          return file.writeAsStringSync(jsonEncode(toJson()),
              mode: FileMode.writeOnly);
        },
      );
      // return file
      //     .writeAsString(json.encode(this), mode: FileMode.writeOnly)
      //     .then((value) {
      //   return;
      // }).catchError(
      //   (onError) {
      //     throw onError;
      //   },
      // );
    } catch (e) {
      rethrow;
    }
  }

  static List<ApplicationQuestionModel> setAllQuestionState(
    List<ApplicationQuestionModel> data, {
    String questionState = QuestionState.read,
    List<String>? oldQuestionState,
  }) {
    for (var f in data) {
      if (oldQuestionState == null ||
          oldQuestionState.contains(f.questionState)) {
        f.questionState = questionState;
      }
    }
    return data;
  }
}

class StateStatus {
  static const submited = "SUBMITED";
  static const readed = "READED";
  static const processed = "PROCESSED";
  static const upload = "UPLOAD";
  static const uploading = "UPLOADING";
  static const uploadFailed = "UPLOADFAILED";
  static const uploaded = "UPLOADED";
  static const finished = "FINISHED";
}
