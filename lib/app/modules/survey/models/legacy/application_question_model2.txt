import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:suzuki/util/enum.dart';
import 'package:suzuki/util/network.dart';
import 'package:suzuki/util/system.dart';

class ApplicationQuestionModel {
  int? questionId; //": 1,
  String? code; //": "0001",
  String? name; //": null,
  String? label; //": "Nama",
  String? hint; //": "Nama",
  String? type; //": "text",
  int? collectionId; //": null
  String value;
  Object? valueObject;
  double lat;
  double lon;
  int? groupId;
  String? questionState;
  int? submissionId;
  int? formId;
  int? pageId;
  bool? mandatory; //": 1,
  int? refQuestionId; //": null,
  DateTime? inputDate;
  bool visible = false;
  String refValue;
  String cacheValue;

  ApplicationQuestionModel({
    this.questionId,
    this.code,
    this.name,
    this.label,
    this.hint,
    this.type,
    this.collectionId,
    this.value = "",
    this.questionState = QuestionState.read,
    this.lat = 0,
    this.lon = 0,
    this.formId,
    this.pageId,
    this.groupId,
    this.mandatory,
    this.refQuestionId,
    this.submissionId,
    this.inputDate,
    this.refValue = "",
    this.cacheValue = "",
  });

  static ApplicationQuestionModel fromJson(
    Map<String, dynamic> jsonData, {
    int? id,
  }) {
    var data = ApplicationQuestionModel(
      questionId: (jsonData["question_id"] as num?)?.toInt(),
      code: (jsonData["code"] as String?),
      name: (jsonData["name"] as String?),
      label: (jsonData["label"] as String?),
      hint: (jsonData["hint"] as String?),
      type: (jsonData["type"] as String?),
      value: ((jsonData["value"] as String?) ?? ""),
      lat: (jsonData["lat"] as num?)?.toDouble() ?? 0,
      lon: (jsonData["lon"] as num?)?.toDouble() ?? 0,
      collectionId: (jsonData["collection_id"] as num?)?.toInt(),
      questionState: (jsonData["question_state"] as String?),
      formId: (jsonData["form_id"] as num?)?.toInt(),
      pageId: (jsonData["page_id"] as num?)?.toInt(),
      groupId: (jsonData["group_id"] as num?)?.toInt(),
      mandatory: (jsonData["mandatory"] as num?)?.toInt() == 1 ? true : false,
      refQuestionId: (jsonData["ref_question_id"] as num?)?.toInt(),
      submissionId: (jsonData["submission_id"] as num?)?.toInt(),
      inputDate: jsonData["input_date"] != null && jsonData["input_date"] != ""
          ? DateTime.parse(jsonData["input_date"] as String)
          : null,
      cacheValue: (jsonData["cache_value"] as String?) ?? "",
    );

    if (id != null) {
      data.questionId = id;
    }

    return data;
  }

  Map<String, dynamic> toJson() {
    return {
      "question_id": questionId,
      "code": code,
      "name": name,
      "label": label,
      "hint": hint,
      "type": type,
      "value": value,
      "lat": lat,
      "lon": lon,
      "collection_id": collectionId,
      "question_state": questionState,
      "form_id": formId,
      "page_id": pageId,
      "group_id": groupId,
      "submission_id": submissionId,
      "mandatory": mandatory == true ? 1 : 0,
      "ref_question_id": refQuestionId ?? 0,
      "input_date": inputDate?.toIso8601String() ?? "",
      "cache_value": cacheValue,
    };
  }

  Map<String, dynamic> toSubmissionDataUloadJson(String token) {
    var data = {
      "submission_id": submissionId,
      "form_id": formId,
      "page_id": pageId,
      "group_id": groupId,
      "type": type,
      "cacheValue": cacheValue,
      "question_id": questionId,
      "lat": lat,
      "lon": lon,
      "input_date": inputDate == null
          ? ""
          : DateFormat("yyyy-MM-dd h:m:s").format(inputDate!.toUtc()),
    };

    try {
      data["value"] = type == QuestionTypes.foto
          ? base64.encode(File(cacheValue).readAsBytesSync())
          : value;
    } catch (e) {
      data["value"] = cacheValue;
    }

    return data;
  }

  void setToUploading() {
    questionState = QuestionState.uploading;
  }

  void setToUploaded() {
    questionState = QuestionState.uploaded;
  }

  void setUploadFailed() {
    questionState = QuestionState.uploadFailed;
  }

  Future<bool?> upload({
    required String? token,
    required String? message,
  }) {
    return readImage(token: token).then((value) {
      // print("upload data");
      // print(
      //   toSubmissionDataUloadJson(token ?? ""),
      // );
      return Network.post(
        url: Uri.parse(
          System.data.apiEndPoint.url +
              System.data.apiEndPoint.applicationConfirmUploaded,
        ),
        querys: {
          "message": "$message",
        },
        body: toSubmissionDataUloadJson(token ?? ""),
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
    });
  }

  Future<String> readImage({
    required String? token,
  }) {
    if (value == "[foto]" && type == QuestionTypes.foto) {
      if (cacheValue != "") {
        return Future.value().then((response) => cacheValue);
      }
      return Network.get(
        url: Uri.parse(
          //https://form.bagdja.com/api/publics/value?submissionId=1107&questionId=17
          System.data.apiEndPoint.url + System.data.apiEndPoint.getValuesUrl,
        ),
        querys: {
          "submissionId": "${submissionId ?? ""}",
          "questionId": "${questionId ?? ""}",
        },
        otpRequired: null,
        headers: {
          HttpHeaders.authorizationHeader: token ?? "",
        },
      ).then((response) {
        var data = ApplicationQuestionModel.fromJson(response);
        //save base64 to file
        Uint8List bytes = base64.decode(data.value.split(",").last);
        File file = File(System.data.getDir(DirKey.images).path +
            "/" +
            DateTime.now().millisecondsSinceEpoch.toString() +
            ".png");
        file.writeAsBytesSync(List.from(bytes));
        cacheValue = file.path;
        return cacheValue;
      }).catchError((onError) {
        throw onError;
      });
    } else {
      cacheValue = value;
      return Future.value().then((response) => value);
    }
  }

  bool get validate {
    if (mandatory == true && value == "") {
      return false;
    } else {
      if (type == QuestionTypes.foto) {
        try {
          base64.encode(File(cacheValue).readAsBytesSync());
          return true;
        } catch (e) {
          try {
            if (value != "" && value.split("/")[1] == "storage") {
              return true;
            } else {
              base64.encode(File(value).readAsBytesSync());
              return true;
            }
          } catch (e) {
            if (mandatory == false) {
              return true;
            } else {
              return false;
            }
          }
        }
      } else {
        return true;
      }
    }
  }
}

class QuestionTypes {
  static const String checkbox = "checkbox";
  static const String decimal = "decimal";
  static const String dropdown = "dropdown";
  static const String radio = "radio";
  static const String foto = "foto";
  static const String locationpicker = "locationpicker";
  static const String number = "number";
  static const String positiontag = "positiontag";
  static const String text = "text";
  static const String video = "video";
  static const String phone = "phone";
  static const String digit = "digit";
  static const String date = "date";

  static bool needCollectionData(String code) {
    switch (code) {
      case QuestionTypes.dropdown:
      case QuestionTypes.checkbox:
        return true;
      default:
        return false;
    }
  }

  static bool usingLocalController(String code) {
    return [
      QuestionTypes.foto,
      QuestionTypes.text,
      QuestionTypes.number,
      QuestionTypes.decimal,
      QuestionTypes.phone,
    ].contains(code);
  }
}

class QuestionState {
  static const String read = "read";
  static const String edit = "edit";
  static const String upload = "upload";
  static const String uploading = "uploading";
  static const String uploaded = "uploaded";
  static const String uploadFailed = "uploadFailed";
}
