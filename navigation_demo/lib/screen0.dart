import 'package:flutter/material.dart';

class Screen0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Screen 0'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(color: Colors.red,
              child: TextButton(
                child: Text('Go To Screen 1'),
                onPressed: () {
                  Navigator.pushNamed(context, "/first");
                },
              ),
            ),
            Container(
              color: Colors.blue,
              child: TextButton(
                child: Text('Go To Screen 2'),
                onPressed: () {
                  Navigator.pushNamed(context, "/second");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}