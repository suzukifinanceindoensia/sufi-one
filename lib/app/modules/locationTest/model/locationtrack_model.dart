class LocationTrackModel {
  final int id;
  final String name;
  final String hash;

  LocationTrackModel({
    required this.id, 
    required this.name, 
    required this.hash
  });

  factory LocationTrackModel.fromJson(Map<String, dynamic> json) {
    return LocationTrackModel(
      id: json['id'] as int,
      name: json['name'] as String,
      hash: json['hash'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'hash': hash,
    };
  }
}