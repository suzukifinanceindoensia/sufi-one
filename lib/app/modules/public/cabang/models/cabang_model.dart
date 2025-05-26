class CabangModel {
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  String distance; // bisa diupdate nanti

  CabangModel({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.distance = 'Menghitung...',
  });

  factory CabangModel.fromJson(Map<String, dynamic> json) {
    return CabangModel(
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      latitude:
          (json['latitude'] is String)
              ? double.tryParse(json['latitude']) ?? 0
              : (json['latitude']?.toDouble() ?? 0),
      longitude:
          (json['longitude'] is String)
              ? double.tryParse(json['longitude']) ?? 0
              : (json['longitude']?.toDouble() ?? 0),
      distance: json['distance'] ?? 'Menghitung...',
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'address': address,
    'latitude': latitude,
    'longitude': longitude,
    'distance': distance,
  };
}
