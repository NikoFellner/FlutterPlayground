import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const ButtonStyle kTextButtonStyle = ButtonStyle(
  backgroundColor: MaterialStatePropertyAll(Color(0xFF36486C)),
  padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
  foregroundColor: MaterialStatePropertyAll(Color(0xFF89AAAF)),
);

const InputDecoration kTextFieldStyle = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(Icons.location_city, color: Colors.white,),
  hintText: "Enter city name",
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide.none),

);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
