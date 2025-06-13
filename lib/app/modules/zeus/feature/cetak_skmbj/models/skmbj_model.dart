class SkmbjModel {
  final String kontrak;
  final String nopol;
  final String cabang;
  final String kode;
  final DateTime tanggal;

  SkmbjModel({
    required this.kontrak,
    required this.nopol,
    required this.cabang,
    required this.kode,
    required this.tanggal,
  });

  factory SkmbjModel.fromJson(Map<String, dynamic> json) {
    return SkmbjModel(
      kontrak: json['kontrak'] as String,
      nopol: json['nopol'] as String,
      cabang: json['cabang'] as String,
      kode: json['kode'] as String,
      tanggal: DateTime.parse(json['tanggal'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'kontrak': kontrak,
      'nopol': nopol,
      'cabang': cabang,
      'kode': kode,
      'tanggal': tanggal.toIso8601String(),
    };
  }
}
