void main() {
  List<Pair<double>> coordinates = [
    Pair<double>(1, 1),
    Pair<double>(-1, -1),
    Pair<double>(-1, 1),
    Pair<double>(1, -1),
  ];
  int multiplier = 5;

  // Calculate the center of the coordinates
  Pair<double> center = calculateCenter(coordinates);

  // Subtract the center from each pair and multiply by the multiplier
  List<Pair<double>> transformedCoordinates =
      transformCoordinates(coordinates, center, multiplier);

  // Display the transformed coordinates
  print(center.first);
  for (var pair in transformedCoordinates) {
    print('Latitude: ${pair.first}, Longitude: ${pair.second}');
  }
}

class Pair<T> {
  final T first;
  final T second;

  Pair(this.first, this.second);
}

Pair<double> calculateCenter(List<Pair<double>> coordinates) {
  double sumLat = 0;
  double sumLng = 0;

  for (var pair in coordinates) {
    sumLat += pair.first;
    sumLng += pair.second;
  }

  double centerLat = sumLat / coordinates.length;
  double centerLng = sumLng / coordinates.length;

  return Pair<double>(centerLat, centerLng);
}

List<Pair<double>> transformCoordinates(
    List<Pair<double>> coordinates, Pair<double> center, int multiplier) {
  List<Pair<double>> transformedCoordinates = [];

  for (var pair in coordinates) {
    double latitude = pair.first - center.first;
    double longitude = pair.second - center.second;

    double transformedLatitude = latitude * multiplier;
    double transformedLongitude = longitude * multiplier;

    transformedLatitude += center.first;
    transformedLongitude += center.second;

    transformedCoordinates
        .add(Pair<double>(transformedLatitude, transformedLongitude));
  }

  return transformedCoordinates;
}
