import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();  // Ensure the binding is initialized
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  final AudioPlayer _player = AudioPlayer();

  void playMusic(int soundNumber) async{
    await _player.play(AssetSource("audio/note$soundNumber.wav"));
  }

  Widget createButton({required int soundNumber, required Color buttonColor}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory,enableFeedback: false),
        onPressed: () {
          playMusic(soundNumber);
        },
        child: Container(color: buttonColor,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              createButton(soundNumber:1, buttonColor: Colors.blue),
              createButton(soundNumber:2, buttonColor: Colors.red),
              createButton(soundNumber:3, buttonColor: Colors.green),
              createButton(soundNumber:4, buttonColor: Colors.purple),
              createButton(soundNumber:5, buttonColor: Colors.yellow),
              createButton(soundNumber:6, buttonColor: Colors.orange),
              createButton(soundNumber:7, buttonColor: Colors.pink),
            ],
          ),
        ),
      ),
    );
  }
}
