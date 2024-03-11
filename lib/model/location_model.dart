class LocationModel {
  final double latitude;
  final double longitude;
  String? cityName;
  bool visible;

  LocationModel(this.latitude, this.longitude, this.cityName,
      {this.visible = false});
}
