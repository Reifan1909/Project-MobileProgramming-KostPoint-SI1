class KampusModel {
  final String id;
  final String name;
  final String shortName;
  final String gateName;
  final String address;
  final double latitude;
  final double longitude;

  const KampusModel({
    required this.id,
    required this.name,
    required this.shortName,
    required this.gateName,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  KampusModel copyWith({
    String? id,
    String? name,
    String? shortName,
    String? gateName,
    String? address,
    double? latitude,
    double? longitude,
  }) {
    return KampusModel(
      id: id ?? this.id,
      name: name ?? this.name,
      shortName: shortName ?? this.shortName,
      gateName: gateName ?? this.gateName,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'shortName': shortName,
      'gateName': gateName,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory KampusModel.fromMap(Map<String, dynamic> map) {
    return KampusModel(
      id: map['id'] as String? ?? '',
      name: map['name'] as String? ?? '',
      shortName: map['shortName'] as String? ?? '',
      gateName: map['gateName'] as String? ?? '',
      address: map['address'] as String? ?? '',
      latitude: (map['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (map['longitude'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
