import "../services/location.dart";
import "../services/networking.dart";

const apiKey = "Here belongs the API key";

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {
    Uri url = Uri.https("api.openweathermap.org", "/data/2.5/weather", {
      "q": cityName,
      "appid": apiKey,
      "units": "metric",
    });

    NetworkHelper networkHelper = NetworkHelper(url: url);

    var jsonData = await networkHelper.getData();

    print(jsonData["main"]["temp"]);
    print(jsonData["name"]);
    print(jsonData["weather"][0]["id"]);

    return jsonData;
  }


  Future<dynamic> getPositionData() async {

    Location currentLocation = Location();
    await currentLocation.getCurrentLocation();

    Uri url = Uri.https("api.openweathermap.org", "/data/2.5/weather", {
      "lat": currentLocation.latitude!.toStringAsFixed(2),
      "lon": currentLocation.longitude!.toStringAsFixed(2),
      "appid": apiKey,
      "units": "metric",
    });

    NetworkHelper networkHelper = NetworkHelper(url: url);

    var jsonData = await networkHelper.getData();

    print(jsonData["main"]["temp"]);
    print(jsonData["name"]);
    print(jsonData["weather"][0]["id"]);

    return jsonData;
  }



  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
