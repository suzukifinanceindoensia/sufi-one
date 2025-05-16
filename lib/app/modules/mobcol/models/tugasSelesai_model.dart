class AllTugasSelesaiModel {
  final String id;
  final String name;
  final DateTime dateTime;
  final int money;
  final Coordinate coordinate;
  final String email;
  final String phoneNumber;
  final String kelurahan;
  final String kecamatan;
  final String alamatLengkap;
  final String typeUnit;
  final String policeNumber;
  final String colorOfCar;
  final int angsuranKe;
  final String kondisi;

  AllTugasSelesaiModel({
    required this.id,
    required this.name,
    required this.dateTime,
    required this.money,
    required this.coordinate,
    required this.email,
    required this.phoneNumber,
    required this.kelurahan,
    required this.kecamatan,
    required this.alamatLengkap,
    required this.typeUnit,
    required this.policeNumber,
    required this.colorOfCar,
    required this.angsuranKe,
    required this.kondisi,
  });

  factory AllTugasSelesaiModel.fromJson(Map<String, dynamic> json) =>
      AllTugasSelesaiModel(
        id: json["id"],
        name: json["name"],
        dateTime: DateTime.parse(json["dateTime"]),
        money: json["money"],
        coordinate: Coordinate.fromJson(json["coordinate"]),
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        kelurahan: json["kelurahan"],
        kecamatan: json["kecamatan"],
        alamatLengkap: json["alamatLengkap"],
        typeUnit: json["typeUnit"],
        policeNumber: json["policeNumber"],
        colorOfCar: json["colorOfCar"],
        angsuranKe: json["angsuranKe"],
        kondisi: json["kondisi"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "dateTime": dateTime.toIso8601String(),
        "money": money,
        "coordinate": coordinate.toJson(),
        "email": email,
        "phoneNumber": phoneNumber,
        "kelurahan": kelurahan,
        "kecamatan": kecamatan,
        "alamatLengkap": alamatLengkap,
        "typeUnit": typeUnit,
        "policeNumber": policeNumber,
        "colorOfCar": colorOfCar,
        "angsuranKe": angsuranKe,
        "kondisi": kondisi,
      };
}

class Coordinate {
  final double? latitude;
  final double? longitude;

  Coordinate({this.latitude, this.longitude});

  factory Coordinate.fromJson(Map<String, dynamic> json) {
    return Coordinate(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'latitude': latitude, 'longitude': longitude};
  }
}