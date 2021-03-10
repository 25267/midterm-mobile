import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CalculatorApp(),
    );
  }

}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key key}) : super(key: key);

  @override
  CalculatorAppState createState() => CalculatorAppState();

}

class CalculatorAppState extends State<CalculatorApp> {

  String _littleNumbers = '';
  String _numbers = '';




  void result(String text) {
    Parser pareser = Parser();
    Expression exp = pareser.parse(_numbers);

    ContextModel contextModel = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, contextModel);

    setState(() {
      _littleNumbers = _numbers;
      _numbers = eval.toString();
    });
  }


  void clickedNumbers(String number) {
    setState(() {
      _numbers += number;
    });
  }

  void clearResult(String number) {
    setState(() {
      _littleNumbers = '';
      _numbers = '';
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF212121),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12),
              child: Text(
                _numbers,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                      fontSize: 45),
                  color: Color(0xFFFAFAFA),
                ),
              ),
                alignment: Alignment(1.0, 2.0),
            ),
            Row(children: <Widget>[
                NumberButtons(ColorOfDigitBox: 0xFF303030, number: '∁', method: clearResult,
                ),
                NumberButtons(ColorOfDigitBox: 0xFF303030, number: '+/-', method: clickedNumbers,
                ),
                NumberButtons(ColorOfDigitBox: 0xFF303030, number: '%', method: clickedNumbers,
                ),
                NumberButtons(ColorOfDigitBox: 0xFFEF6C00, number: '/', method: clickedNumbers),
              ],
            ),
            Row(children: <Widget>[
                NumberButtons(ColorOfDigitBox: 0xFF424242, number: '7', method: clickedNumbers,
                ),
                NumberButtons(ColorOfDigitBox: 0xFF424242, number: '8', method: clickedNumbers,
                ),
                NumberButtons(ColorOfDigitBox: 0xFF424242, number: '9', method: clickedNumbers,
                ),
                NumberButtons(ColorOfDigitBox: 0xFFEF6C00, number: '*', method: clickedNumbers),
              ],
            ),
            Row(children: <Widget>[
                NumberButtons(ColorOfDigitBox: 0xFF424242, number: '4', method: clickedNumbers,
                ),
                NumberButtons(ColorOfDigitBox: 0xFF424242, number: '5', method: clickedNumbers,
                ),
                NumberButtons(ColorOfDigitBox: 0xFF424242, number: '6', method: clickedNumbers,
                ),
                NumberButtons(ColorOfDigitBox: 0xFFEF6C00, number: '-', method: clickedNumbers),
              ],
            ),
            Row(children: <Widget>[
                NumberButtons(ColorOfDigitBox: 0xFF424242, number: '1', method: clickedNumbers,
                ),
                NumberButtons(ColorOfDigitBox: 0xFF424242, number: '2', method: clickedNumbers,
                ),
                NumberButtons(ColorOfDigitBox: 0xFF424242, number: '3', method: clickedNumbers,
                ),
                NumberButtons(ColorOfDigitBox: 0xFFEF6C00, number: '+', method: clickedNumbers),
              ],
            ),
            Row(children: <Widget>[
                NumberButtons(ColorOfDigitBox: 0xFF424242, number: '0', widthOfText: 202, method: clickedNumbers,
                ),
                NumberButtons(number: '.', ColorOfDigitBox: 0xFF424242, method:clickedNumbers,
                ),
                NumberButtons(number: '=', ColorOfDigitBox: 0xFFEF6C00, method: result),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NumberButtons extends StatelessWidget {
  final String number;
  final int textColor;
  final double widthOfText;
  final Function method;
  final int ColorOfDigitBox;

  const NumberButtons({Key key, this.number, this.textColor, this.widthOfText = 99.5, this.method, this.ColorOfDigitBox, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.all(1.2),
      child: SizedBox(
        width: widthOfText,
        height: 80,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: Text(
            number,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: 35,
              ),
            ),
          ),
          onPressed: () {
            method(number);
          },
          color: ColorOfDigitBox !=  null ? Color(ColorOfDigitBox)  : null ,
          textColor: Color(0xFFFAFAFA),
        ),
      ),
    );
  }
}




