import '../../shared/models/kampus_model.dart';
import '../../shared/models/kos_model.dart';

class DummyData {
  DummyData._();

  /// Daftar Kampus Populer di Kota Padang
  static const List<KampusModel> kampusList = [
    KampusModel(
      id: 'k-upi',
      name: 'Universitas Putra Indonesia YPTK Padang',
      shortName: 'UPI YPTK Padang',
      gateName: 'Gerbang Utama Lubuk Begalung',
      address: 'Jl. Raya Lubuk Begalung No.1, Lubuk Begalung Nan XX, Padang',
      latitude: -0.963428,
      longitude: 100.404225,
    ),
    KampusModel(
      id: 'k-unand',
      name: 'Universitas Andalas (UNAND)',
      shortName: 'UNAND',
      gateName: 'Gerbang Utama Limau Manis',
      address: 'Limau Manis, Kec. Pauh, Kota Padang, Sumatera Barat',
      latitude: -0.914652,
      longitude: 100.461019,
    ),
    KampusModel(
      id: 'k-unp',
      name: 'Universitas Negeri Padang (UNP)',
      shortName: 'UNP Air Tawar',
      gateName: 'Gerbang Depan Prof. Hamka',
      address: 'Jl. Prof. Dr. Hamka, Air Tawar Barat, Kec. Padang Utara, Padang',
      latitude: -0.897312,
      longitude: 100.350811,
    ),
  ];

  /// Daftar Data Dummy Kos di Sekitar Kampus Padang
  /// Minimal 6 kos, 2 dengan isPremium = true
  static const List<KosModel> kosList = [
    // 1. Premium Kos di dekat UPI YPTK
    KosModel(
      id: 'kos-1',
      name: 'Kos Graha YPTK Exclusive',
      description:
          'Kos eksklusif modern dengan lingkungan tenang dan nyaman. Hanya 2 menit ke gerbang UPI YPTK Padang. Dilengkapi sistem keamanan CCTV 24 jam dan akses kartu kunci.',
      address: 'Jl. Aru Indah No. 12, Lubuk Begalung, Padang',
      pricePerMonth: 850000,
      availableRooms: 2,
      totalRooms: 10,
      isPremium: true,
      latitude: -0.964100,
      longitude: 100.405200,
      whatsappNumber: '6281234567801',
      rating: 4.8,
      reviewCount: 24,
      facilities: [
        'AC Dingin',
        'Kamar Mandi Dalam',
        'WiFi 100 Mbps',
        'Kasur Springbed',
        'Lemari Pakaian',
        'Parkir Motor Aman'
      ],
      images: [
        'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=800&q=80',
        'https://images.unsplash.com/photo-1598928506311-c55ded91a20c?w=800&q=80',
      ],
      genderType: KosGenderType.putra,
      virtualTourUrl: 'https://youtu.be/dummy-tour-1',
    ),

    // 2. Premium Kos di dekat UNAND
    KosModel(
      id: 'kos-2',
      name: 'Kos Putri Syariah Limau Manis',
      description:
          'Hunian islami yang aman dan bersih khusus mahasiswi UNAND. Fasilitas lengkap dengan view perbukitan asri dan penjagaan 24 jam.',
      address: 'Jl. Kampus Unand, Pasar Baru, Limau Manis, Pauh, Padang',
      pricePerMonth: 950000,
      availableRooms: 3,
      totalRooms: 12,
      isPremium: true,
      latitude: -0.916000,
      longitude: 100.459500,
      whatsappNumber: '6281234567802',
      rating: 4.9,
      reviewCount: 38,
      facilities: [
        'AC Dingin',
        'Kamar Mandi Dalam',
        'Dapur Bersama',
        'WiFi Super Cepat',
        'CCTV 24 Jam',
        'Penjaga Kos'
      ],
      images: [
        'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?w=800&q=80',
        'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=800&q=80',
      ],
      genderType: KosGenderType.putri,
      virtualTourUrl: 'https://youtu.be/dummy-tour-2',
    ),

    // 3. Reguler Kos dekat UPI YPTK
    KosModel(
      id: 'kos-3',
      name: 'Kos Melati Lubeg Indah',
      description:
          'Kos hemat dan strategis untuk mahasiswa rantau, dekat warung makan, fotokopi, dan minimarket.',
      address: 'Gang Melati No. 5, Lubuk Begalung, Padang',
      pricePerMonth: 600000,
      availableRooms: 4,
      totalRooms: 8,
      isPremium: false,
      latitude: -0.966000,
      longitude: 100.407500,
      whatsappNumber: '6281234567803',
      rating: 4.5,
      reviewCount: 15,
      facilities: [
        'Kamar Mandi Luar',
        'Kasur Busa',
        'Lemari Kayu',
        'WiFi',
        'Dapur Bersama'
      ],
      images: [
        'https://images.unsplash.com/photo-1540518614846-7ede433c4ef7?w=800&q=80',
      ],
      genderType: KosGenderType.campur,
    ),

    // 4. Reguler Kos dekat UNP
    KosModel(
      id: 'kos-4',
      name: 'Kos Garuda Air Tawar',
      description:
          'Sangat dekat dengan kampus UNP, bisa jalan kaki santai ke fakultas teknik dan bahasa.',
      address: 'Jl. Cendrawasih No. 18, Air Tawar Barat, Padang Utara',
      pricePerMonth: 750000,
      availableRooms: 1,
      totalRooms: 15,
      isPremium: false,
      latitude: -0.895500,
      longitude: 100.352200,
      whatsappNumber: '6281234567804',
      rating: 4.6,
      reviewCount: 19,
      facilities: [
        'Kamar Mandi Dalam',
        'Meja Belajar',
        'Lemari',
        'Parkir Motor Luas',
        'Dapur Bersama'
      ],
      images: [
        'https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?w=800&q=80',
      ],
      genderType: KosGenderType.putra,
    ),

    // 5. Reguler Kos dekat UNAND (Penuh / 0 Kamar)
    KosModel(
      id: 'kos-5',
      name: 'Kos Ananda Limau Manis',
      description:
          'Kos sejuk bernuansa alam dekat jembatan batu busuk UNAND. Saat ini kamar terisi penuh.',
      address: 'Jl. Limau Manis Baru No. 7, Pauh, Padang',
      pricePerMonth: 550000,
      availableRooms: 0,
      totalRooms: 10,
      isPremium: false,
      latitude: -0.919200,
      longitude: 100.457800,
      whatsappNumber: '6281234567805',
      rating: 4.3,
      reviewCount: 11,
      facilities: [
        'Kamar Mandi Luar',
        'Kasur Busa',
        'Lemari',
        'Parkir Motor Luas'
      ],
      images: [
        'https://images.unsplash.com/photo-1505693357370-58c2f7366f37?w=800&q=80',
      ],
      genderType: KosGenderType.putra,
    ),

    // 6. Reguler Kos Putri dekat UNP
    KosModel(
      id: 'kos-6',
      name: 'Kos Cendrawasih UNP Putri',
      description:
          'Hunian mahasiswi yang ramah dan aman. Bebas jam malam dengan koordinasi ibu kos.',
      address: 'Jl. Air Tawar Timur Gang 3 No. 4, Padang',
      pricePerMonth: 800000,
      availableRooms: 5,
      totalRooms: 10,
      isPremium: false,
      latitude: -0.899800,
      longitude: 100.348900,
      whatsappNumber: '6281234567806',
      rating: 4.7,
      reviewCount: 22,
      facilities: [
        'Kamar Mandi Dalam',
        'Kasur Springbed',
        'WiFi',
        'CCTV',
        'Mesin Cuci Bersama'
      ],
      images: [
        'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=800&q=80',
      ],
      genderType: KosGenderType.putri,
    ),
  ];
}
