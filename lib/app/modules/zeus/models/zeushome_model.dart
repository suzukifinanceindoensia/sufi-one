class ZeushomeModel {
  final String platNomor;
  final String tipeMobil;
  final String status;
  final String skmbj;
  final String noSkmbj;

  ZeushomeModel({
    required this.platNomor,
    required this.tipeMobil,
    required this.status,
    required this.skmbj,
    required this.noSkmbj,
  });

  factory ZeushomeModel.fromJson(Map<String, dynamic> json) {
    return ZeushomeModel(
      platNomor: json['plat_nomor'] as String,
      tipeMobil: json['tipe_mobil'] as String,
      status: json['status'] as String,
      skmbj: json['skmbj'] as String,
      noSkmbj: json['no_skmbj'] as String,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'plat_nomor': platNomor,
      'tipe_mobil': tipeMobil,
      'status': status,
      'skmbj' : skmbj,
      'no_skmbj': noSkmbj,
    };
  }
}