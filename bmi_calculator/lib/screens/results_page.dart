import '../components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {

  final String? bmiResult;
  final String? resultText;
  final String? interpretationText;


  const ResultsPage({this.bmiResult, this.resultText,this.interpretationText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
            "YOUR RESULTS",
            style: kTitleTextStyle,
          ),
              )),
          Expanded(
            child: ReusableContainer(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText!,
                    style: kResultsTextStyle,
                  ),
                  Text(bmiResult!, style: kBMIResultsTextStyle,),
                  Text(interpretationText!, style: kBMIInterpretationTextStyle,)
                ],
              ),
            ),
            flex: 5,
          ),
          BottomButton(onTap: (){Navigator.pop(context);}, buttonName: "RE-CALCULATE")
        ],
      ),
    );
  }
}
