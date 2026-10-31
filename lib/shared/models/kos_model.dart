enum KosGenderType {
  putra('Putra'),
  putri('Putri'),
  campur('Campur');

  final String label;
  const KosGenderType(this.label);

  static KosGenderType fromString(String value) {
    switch (value.toLowerCase()) {
      case 'putri':
        return KosGenderType.putri;
      case 'campur':
        return KosGenderType.campur;
      case 'putra':
      default:
        return KosGenderType.putra;
    }
  }
}

class KosModel {
  final String id;
  final String name;
  final String description;
  final String address;
  final double pricePerMonth;
  final int availableRooms;
  final int totalRooms;
  final bool isPremium;
  final double latitude;
  final double longitude;
  final String whatsappNumber;
  final double rating;
  final int reviewCount;
  final List<String> facilities;
  final List<String> images;
  final KosGenderType genderType;
  final String? virtualTourUrl;

  // Nilai jarak dinamis terhadap kampus/posisi yang dipilih (opsional saat perhitungan)
  final double? distanceInKm;

  const KosModel({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.pricePerMonth,
    required this.availableRooms,
    required this.totalRooms,
    required this.isPremium,
    required this.latitude,
    required this.longitude,
    required this.whatsappNumber,
    required this.rating,
    required this.reviewCount,
    required this.facilities,
    required this.images,
    required this.genderType,
    this.virtualTourUrl,
    this.distanceInKm,
  });

  bool get isAvailable => availableRooms > 0;

  String get roomStatusText =>
      isAvailable ? 'Sisa $availableRooms Kamar' : 'Penuh';

  String get formattedPrice {
    final int priceInt = pricePerMonth.toInt();
    final String priceString = priceInt.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}.',
        );
    return 'Rp $priceString / bulan';
  }

  KosModel copyWith({
    String? id,
    String? name,
    String? description,
    String? address,
    double? pricePerMonth,
    int? availableRooms,
    int? totalRooms,
    bool? isPremium,
    double? latitude,
    double? longitude,
    String? whatsappNumber,
    double? rating,
    int? reviewCount,
    List<String>? facilities,
    List<String>? images,
    KosGenderType? genderType,
    String? virtualTourUrl,
    double? distanceInKm,
  }) {
    return KosModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      address: address ?? this.address,
      pricePerMonth: pricePerMonth ?? this.pricePerMonth,
      availableRooms: availableRooms ?? this.availableRooms,
      totalRooms: totalRooms ?? this.totalRooms,
      isPremium: isPremium ?? this.isPremium,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      whatsappNumber: whatsappNumber ?? this.whatsappNumber,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      facilities: facilities ?? this.facilities,
      images: images ?? this.images,
      genderType: genderType ?? this.genderType,
      virtualTourUrl: virtualTourUrl ?? this.virtualTourUrl,
      distanceInKm: distanceInKm ?? this.distanceInKm,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'address': address,
      'pricePerMonth': pricePerMonth,
      'availableRooms': availableRooms,
      'totalRooms': totalRooms,
      'isPremium': isPremium,
      'latitude': latitude,
      'longitude': longitude,
      'whatsappNumber': whatsappNumber,
      'rating': rating,
      'reviewCount': reviewCount,
      'facilities': facilities,
      'images': images,
      'genderType': genderType.name,
      'virtualTourUrl': virtualTourUrl,
      'distanceInKm': distanceInKm,
    };
  }

  factory KosModel.fromMap(Map<String, dynamic> map) {
    return KosModel(
      id: map['id'] as String? ?? '',
      name: map['name'] as String? ?? '',
      description: map['description'] as String? ?? '',
      address: map['address'] as String? ?? '',
      pricePerMonth: (map['pricePerMonth'] as num?)?.toDouble() ?? 0.0,
      availableRooms: map['availableRooms'] as int? ?? 0,
      totalRooms: map['totalRooms'] as int? ?? 0,
      isPremium: map['isPremium'] as bool? ?? false,
      latitude: (map['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (map['longitude'] as num?)?.toDouble() ?? 0.0,
      whatsappNumber: map['whatsappNumber'] as String? ?? '',
      rating: (map['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: map['reviewCount'] as int? ?? 0,
      facilities: List<String>.from(map['facilities'] as List? ?? []),
      images: List<String>.from(map['images'] as List? ?? []),
      genderType: KosGenderType.fromString(map['genderType'] as String? ?? 'putra'),
      virtualTourUrl: map['virtualTourUrl'] as String?,
      distanceInKm: (map['distanceInKm'] as num?)?.toDouble(),
    );
  }
}
