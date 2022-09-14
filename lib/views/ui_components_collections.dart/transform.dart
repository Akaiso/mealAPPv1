import 'dart:math';

import 'package:flutter/material.dart';

class TransformWidgets extends StatefulWidget {
  const TransformWidgets({Key key}) : super(key: key);


  @override
  State<TransformWidgets> createState() => _TransformWidgetsState();
}

int scores = 30;
 String firstScreen;


class _TransformWidgetsState extends State<TransformWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.black,
            child: Transform(
              alignment: Alignment.topRight,
              transform: Matrix4.skewY(0.3)..rotateZ(1 * 0.5),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: const Color(0xFFE8581C),
                child: const Text('Apartment for rent!'),
              ),
            ),
          ),
          SizedBox(height: 50),
          Container(
            color: Colors.black26,
            height: 100,
            width: 100,
            transform: Matrix4.rotationZ(-10 * pi / 180)..translate(-10.0),
          ),
          SizedBox(height: 40),
          Container(
              height: 50,
              width: 60,
              color: Colors.blue,
              child: Transform(
                transform: Matrix4.rotationZ(10 * pi / 180)..translate(-10.0),
                child: Container(
                  color: Colors.yellow,
                  height: 20,
                  width: 20,
                ),
              )),
          ElevatedButton(
            onPressed: () async {
              String newValue = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NextScreen(
                            score: 20,
                          )));
                firstScreen = newValue;
              print(firstScreen);
            },
            child: Icon(Icons.add),
          )
        ],
      )),
    );
  }
}

class NextScreen extends StatefulWidget {
  final int score;
  const NextScreen({Key key, this.score,}):super(key: key);


  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("${widget.score}"),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context , 'HailMary');
                },
                child: Icon(Icons.backspace_outlined))
          ],
        ),
      ),
    );
  }
}

class PreviousScreen extends StatefulWidget {
  const PreviousScreen({Key key}) : super(key: key);

  @override
  State<PreviousScreen> createState() => _PreviousScreenState();
}

class _PreviousScreenState extends State<PreviousScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
