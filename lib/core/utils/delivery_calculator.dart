import 'dart:math';

class DeliveryCalculator {
  // إحداثيات مقهى مُكال الافتراضية
  static const double cafeLatitude = 21.4858;
  static const double cafeLongitude = 39.1925;

  static const double standardDeliveryFee = 5.0;

  static double calculateDistanceInKm({
    required double userLat,
    required double userLng,
  }) {
    const double earthRadiusKm = 6371.0;

    double dLat = _degToRad(userLat - cafeLatitude);
    double dLon = _degToRad(userLng - cafeLongitude);

    double lat1 = _degToRad(cafeLatitude);
    double lat2 = _degToRad(userLat);

    double a =
        sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1) * cos(lat2) * sin(dLon / 2) * sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadiusKm * c;
  }

  static double _degToRad(double degree) {
    return degree * (pi / 180.0);
  }

  static double calculateFee({
    required double userLat,
    required double userLng,
    required double cartSubtotal,
  }) {
    double distanceKm = calculateDistanceInKm(
      userLat: userLat,
      userLng: userLng,
    );

    if (distanceKm <= 3.0 && cartSubtotal >= 35.0) {
      return 0.0;
    }

    return standardDeliveryFee;
  }
}
