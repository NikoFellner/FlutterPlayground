import 'dart:math';

class CalculatorBrain {
  final int weight;
  final int height;

  double? _bmi;

  CalculatorBrain({required this.weight, required this.height});

  String calculateBMI(){
    _bmi = weight/pow(height/100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String getResult(){
    if (_bmi!>=25){
      return "Overweight";
    }else if (_bmi! > 18.5){
      return "Normal";
    }else{
      return "Underweight";
    }
  }

  String getInterpretation(){
    if (_bmi!>=25){
      return "Go and get some Workout done! You should get it lower ... i guess";
    }else if (_bmi! > 18.5){
      return "All fine, doing great!";
    }else{
      return "It is time for some FOOOOOOOOOD!";
    }
  }
}