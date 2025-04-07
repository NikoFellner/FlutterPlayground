import "package:flutter/material.dart";

class CoinCard extends StatelessWidget {
  const CoinCard({
    super.key,
    required this.cryptoCurrency,
    required this.dropdownValue,
    required this.currentRate, // Receive the updated rate
  });

  final String cryptoCurrency;
  final String dropdownValue;
  final String currentRate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptoCurrency = $currentRate $dropdownValue',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
