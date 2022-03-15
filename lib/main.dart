import 'dart:math';
import 'package:flutter/material.dart';
import 'components/widgets.dart';
import 'components/functions.dart';
import 'components/lists.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  bool freshRun = true;
  List<int> numberList = [];
  Random _rndImg =
      Random(); //late modifier allows use of non-nullable type for later assignment of value
  var _buttonColor = Colors.blueGrey;

  void _buttonColorCheck(int r) {
    setState(() {
      if (plantNames[r].toString() == plantNames[plantImgIndex].toString()) {

        _buttonColor = Colors.lightGreen;
        freshRun = false;
      } else {}
    });
  }

  void _nextButton() {
    setState(() {
      _rndImg = Random();
      _buttonColor = Colors.blueGrey;
      freshRun = true;
    });
  }

  var buttonList = [];

  // @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //creates an instance of the WidgetsApp
      home: Scaffold(
        //implements basic MD layout structure
        appBar: AppBar(
          //horizontal bar displayed at the top
          title: const Text('Aquatic Plant Quiz'),
          backgroundColor: Colors.blueGrey,
        ),
        body: ListView(
          //listview to allow for scrolling
          children: [
            buildImage(context, _rndImg, freshRun), //Random Image.asset
            titleSection,
            // textSection, //
            buildButtons(context),
            Container(
                padding:
                    const EdgeInsets.only(left: 100, right: 100, bottom: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () => _nextButton(),
                        child: const Text('Next Question'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                        ),
                      )
                    ]))
          ],
        ),
      ),
    );
  }

  Widget buildButtons(BuildContext context) {
    //generates random indices if counter == 0

    if (freshRun == true) {
      randomNumbers();
      numberList = [plantImgIndex, rndNameIndex, rndNameIndex2];
    }
    print(numberList);
    print(freshRun);

    if (freshRun == true) {
      numberList.shuffle();
    }

    freshRun = false;
    print(numberList[0]);

    buttonList = [
      ElevatedButton(
          onPressed: () => _buttonColorCheck(numberList[0]),
          child: Text(plantNames[numberList[0]]),
          style: ElevatedButton.styleFrom(
            primary: buttonVariable(numberList[0]),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          )),
      ElevatedButton(
          onPressed: () => _buttonColorCheck(numberList[1]),
          child: Text(plantNames[numberList[1]]),
          style: ElevatedButton.styleFrom(
            primary: buttonVariable(numberList[1]),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          )),
      ElevatedButton(
          onPressed: () => _buttonColorCheck(numberList[2]),
          child: Text(plantNames[numberList[2]]),
          style: ElevatedButton.styleFrom(
            primary: buttonVariable(numberList[2]),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          ))
    ];

    return Container(
        padding: const EdgeInsets.only(left: 50, right: 50, bottom: 5),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buttonList[0],
              const Padding(padding: EdgeInsets.only(top: 5)),
              buttonList[1],
              const Padding(padding: EdgeInsets.only(top: 5)),
              buttonList[2]
            ]));
  }

  Color buttonVariable(int r) {
    if (r == plantImgIndex) {
      return _buttonColor;
    }
    return Colors.blueGrey;
  }
}
