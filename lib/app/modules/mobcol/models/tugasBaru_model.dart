class AllTugasBaruModel {
  final String? id;
  final String? name;
  final DateTime? dateTime;
  final int? money;
  final Coordinate? coordinate;
  final String? email;
  final String? phoneNumber;
  final String? kelurahan;
  final String? kecamatan;
  final String? alamatLengkap;
  final String? typeUnit;
  final String? policeNumber;
  final String? colorOfCar;
  final int? angsuranKe;
  final String? kondisi;

  AllTugasBaruModel({
    this.id,
    this.name,
    this.dateTime,
    this.money,
    this.coordinate,
    this.email,
    this.phoneNumber,
    this.kelurahan,
    this.kecamatan,
    this.alamatLengkap,
    this.typeUnit,
    this.policeNumber,
    this.colorOfCar,
    this.angsuranKe,
    this.kondisi,
  });

  factory AllTugasBaruModel.fromJson(Map<String, dynamic> json) {
    return AllTugasBaruModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      money: json['money'] as int?,
      coordinate: json['coordinate'] == null
          ? null
          : Coordinate.fromJson(json['coordinate'] as Map<String, dynamic>),
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      kelurahan: json['kelurahan'] as String?,
      kecamatan: json['kecamatan'] as String?,
      alamatLengkap: json['alamatLengkap'] as String?,
      typeUnit: json['typeUnit'] as String?,
      policeNumber: json['policeNumber'] as String?,
      colorOfCar: json['colorOfCar'] as String?,
      angsuranKe: json['angsuranKe'] as int?,
      kondisi: json['kondisi'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'dateTime': dateTime?.toIso8601String(),
      'money': money,
      'coordinate': coordinate?.toJson(),
      'email': email,
      'phoneNumber': phoneNumber,
      'kelurahan': kelurahan,
      'kecamatan': kecamatan,
      'alamatLengkap': alamatLengkap,
      'typeUnit': typeUnit,
      'policeNumber': policeNumber,
      'colorOfCar': colorOfCar,
      'angsuranKe': angsuranKe,
      'kondisi': kondisi,
    };
  }
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