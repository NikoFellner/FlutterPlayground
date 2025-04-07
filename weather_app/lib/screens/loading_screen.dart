import 'package:flutter/material.dart';
import "location_screen.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";
import "../services/weather.dart";


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getPositionData() async {

    WeatherModel weatherModel = WeatherModel();

    var jsonLocationData = await weatherModel.getPositionData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationData: jsonLocationData,);
    }));

  }

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      getPositionData();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 100,
        ),
      ),
      );
    }
}
