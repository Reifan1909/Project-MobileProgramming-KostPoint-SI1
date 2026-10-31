import 'dart:math' as math;

/// Utility untuk perhitungan jarak koordinat dan estimasi waktu tempuh menuju lokasi/gerbang kampus.
class DistanceCalculator {
  DistanceCalculator._();

  /// Menghitung jarak lurus antara dua titik koordinat GPS (dalam kilometer)
  /// menggunakan rumus Haversine.
  static double calculateDistanceInKm({
    required double startLatitude,
    required double startLongitude,
    required double endLatitude,
    required double endLongitude,
  }) {
    const double earthRadiusKm = 6371.0;

    final double dLat = _degreesToRadians(endLatitude - startLatitude);
    final double dLon = _degreesToRadians(endLongitude - startLongitude);

    final double lat1 = _degreesToRadians(startLatitude);
    final double lat2 = _degreesToRadians(endLatitude);

    final double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.sin(dLon / 2) *
            math.sin(dLon / 2) *
            math.cos(lat1) *
            math.cos(lat2);

    final double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    return earthRadiusKm * c;
  }

  /// Estimasi waktu tempuh menggunakan sepeda motor (dalam menit).
  /// Asumsi kecepatan rata-rata motor di area sekitar kampus/gang adalah 25 km/jam.
  static int estimateMotorcycleMinutes(double distanceInKm) {
    if (distanceInKm <= 0) return 1;
    const double averageSpeedMotorKmPerHour = 25.0;
    final double hours = distanceInKm / averageSpeedMotorKmPerHour;
    final int minutes = (hours * 60).ceil();
    return minutes < 1 ? 1 : minutes;
  }

  /// Estimasi waktu tempuh berjalan kaki (dalam menit).
  /// Asumsi kecepatan rata-rata pejalan kaki adalah 4.5 km/jam.
  static int estimateWalkingMinutes(double distanceInKm) {
    if (distanceInKm <= 0) return 1;
    const double averageSpeedWalkingKmPerHour = 4.5;
    final double hours = distanceInKm / averageSpeedWalkingKmPerHour;
    final int minutes = (hours * 60).ceil();
    return minutes < 1 ? 1 : minutes;
  }

  /// Format teks jarak:
  /// Contoh: '450 m' jika < 1 km, atau '1.2 km' jika >= 1 km.
  static String formatDistance(double distanceInKm) {
    if (distanceInKm < 1.0) {
      final int meters = (distanceInKm * 1000).round();
      return '$meters m';
    }
    return '${distanceInKm.toStringAsFixed(1)} km';
  }
  
  /// Helper untuk format estimasi gabungan waktu tempuh:
  /// Contoh: '4 mnt motor • 15 mnt jalan'
  static String formatTravelEstimates(double distanceInKm) {
    final int motorMin = estimateMotorcycleMinutes(distanceInKm);
    final int walkMin = estimateWalkingMinutes(distanceInKm);
    return '$motorMin mnt motor • $walkMin mnt jalan';
  }

  static double _degreesToRadians(double degrees) {
    return degrees * math.pi / 180;
  }
}
