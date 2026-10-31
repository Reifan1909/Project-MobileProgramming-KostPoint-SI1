import '../../shared/models/kampus_model.dart';
import '../../shared/models/kos_model.dart';
import 'distance_calculator.dart';

class KosSorter {
  KosSorter._();

  /// Menghitung jarak masing-masing kos ke kampus target,
  /// lalu mengurutkannya:
  /// 1. Kos status Premium (isPremium == true) selalu di urutan teratas.
  /// 2. Diurutkan berdasarkan jarak terdekat (ascending).
  static List<KosModel> getSortedKosList({
    required List<KosModel> kosList,
    required KampusModel targetCampus,
  }) {
    final listWithDistance = kosList.map((kos) {
      final double distance = DistanceCalculator.calculateDistanceInKm(
        startLatitude: kos.latitude,
        startLongitude: kos.longitude,
        endLatitude: targetCampus.latitude,
        endLongitude: targetCampus.longitude,
      );
      return kos.copyWith(distanceInKm: distance);
    }).toList();

    listWithDistance.sort((a, b) {
      if (a.isPremium != b.isPremium) {
        return a.isPremium ? -1 : 1;
      }
      final double distA = a.distanceInKm ?? double.infinity;
      final double distB = b.distanceInKm ?? double.infinity;
      return distA.compareTo(distB);
    });

    return listWithDistance;
  }
}
