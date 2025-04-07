import 'package:flutter/material.dart';
import "../utilities/constants.dart";
import "../services/weather.dart";
import "city_screen.dart";

class LocationScreen extends StatefulWidget {

  LocationScreen({this.locationData});

  final locationData;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int? temperature;
  String? cityName;
  int? conditionID;

  String? weatherMessage;
  String? weatherIcon;

  final WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationData);
  }

  void updateUI(dynamic locationData){
    setState(() {
      if (locationData == null)
      {
        temperature=0;
        weatherMessage = "unable to receive weather data";
        weatherIcon = "Error";
        cityName = "";
        return;

      }
      temperature = locationData["main"]["temp"].toInt();
      weatherMessage = weatherModel.getMessage(temperature!);

      conditionID = locationData["weather"][0]["id"];
      weatherIcon = weatherModel.getWeatherIcon(conditionID!);

      cityName = locationData["name"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    style: kTextButtonStyle,
                    onPressed: () async {
                        var weatherData = await weatherModel.getPositionData();
                        updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    style: kTextButtonStyle,
                    onPressed: () async {
                        var typedCityName = await Navigator.push(context, MaterialPageRoute(builder: (context) {return CityScreen();}));

                        if (typedCityName != null){
                          var weatherData = await weatherModel.getCityWeather(typedCityName);

                          updateUI(weatherData);
                        }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon!,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "${weatherMessage!} in ${cityName!}!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
