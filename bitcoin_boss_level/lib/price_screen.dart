import "dart:convert";
import "coin_data.dart";
import "coin_card.dart";  // Fixed typo in filename
import 'package:flutter/material.dart';
import "networking.dart";

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String dropdownValue = "USD";

  // Store exchange rates for multiple cryptocurrencies
  Map<String, String> exchangeRates = {
    "BTC": "?",
    "ETH": "?",
    "LTC": "?",
  };

  @override
  void initState() {
    super.initState();
    updateUI(); // Fetch exchange rates when the screen loads
  }

  void updateUI() async {
    Map<String, String> updatedRates = {};

    for (String crypto in exchangeRates.keys) {
      var jsonData = await getCurrencyData(crypto);
      updatedRates[crypto] = jsonData["rate"].toStringAsFixed(2);
    }

    setState(() {
      exchangeRates = updatedRates; // Update all exchange rates
    });
  }

  Future<dynamic> getCurrencyData(String crypto) async {
    Networker networker = Networker(cryptoCurrency: crypto, currency: dropdownValue);
    return await networker.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('🤑 Coin Ticker')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CoinCard(cryptoCurrency: "BTC", dropdownValue: dropdownValue, currentRate: exchangeRates["BTC"]!),
          CoinCard(cryptoCurrency: "ETH", dropdownValue: dropdownValue, currentRate: exchangeRates["ETH"]!),
          CoinCard(cryptoCurrency: "LTC", dropdownValue: dropdownValue, currentRate: exchangeRates["LTC"]!),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton(
              value: dropdownValue,
              items: currenciesList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(value: value, child: Text(value));
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                  updateUI(); // Update exchange rates for all coins
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
