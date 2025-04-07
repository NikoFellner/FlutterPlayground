import "package:geolocator/geolocator.dart";

class Location{
  double? latitude;
  double? longitude;

  Location();


  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;

      //print("Current Position: Latitude $latitude and Longitude $longitude");

    } catch (error_) {
      print(error_);
    }
  }

}