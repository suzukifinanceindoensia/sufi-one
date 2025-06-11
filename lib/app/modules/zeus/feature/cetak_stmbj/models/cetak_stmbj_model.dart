class StmbjModel {
  final String kontrak;
  final String nopol;
  final String cabang;
  final String kode;
  final String tanggal;

  StmbjModel({
    required this.kontrak,
    required this.nopol,
    required this.cabang,
    required this.kode,
    required this.tanggal,
  });

  factory StmbjModel.fromJson(Map<String, dynamic> json) {
    return StmbjModel(
      kontrak: json['kontrak'] ?? '',
      nopol: json['nopol'] ?? '',
      cabang: json['cabang'] ?? '',
      kode: json['kode'] ?? '',
      tanggal: json['tanggal'] ?? '',
    );
  }
}
