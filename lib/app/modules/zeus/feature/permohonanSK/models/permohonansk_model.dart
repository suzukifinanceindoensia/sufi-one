class SkModel {
  final String kontrak;
  final String nopol;
  final String cabang;
  final String kode;
  final String tanggal;

  SkModel({
    required this.kontrak,
    required this.nopol,
    required this.cabang,
    required this.kode,
    required this.tanggal,
  });

  factory SkModel.fromJson(Map<String, dynamic> json) {
    return SkModel(
      kontrak: json['kontrak'] ?? '',
      nopol: json['nopol'] ?? '',
      cabang: json['cabang'] ?? '',
      kode: json['kode'] ?? '',
      tanggal: json['tanggal'] ?? '',
    );
  }
}
