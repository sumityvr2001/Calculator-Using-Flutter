import 'package:flutter/material.dart';
import 'widgets/calc_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _expression = "";
  String _history = "";

  void numClick(String text) {
    setState(() {
      _expression += text;
      _history = _expression;
    });
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        // backgroundColor: Colors.blue[100],
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE3F2FD),
              Color(0xFFBBDEFB),
              // Color(0xFF90CAF9),
            ],
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(right: 12),
                child: Text(
                  _history,
                  style: GoogleFonts.rubik(
                      textStyle: TextStyle(fontSize: 24),
                      color: Color(0xFF9E9E9E)),
                ),
                alignment: Alignment(1, 1),
              ),
              Container(
                padding: EdgeInsets.all(12),
                child: Text(
                  _expression,
                  style: GoogleFonts.rubik(
                      textStyle: TextStyle(fontSize: 58), color: Colors.black),
                ),
                alignment: Alignment(1, 1),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: 'AC',
                      fillColor: 0xFF6C807F,
                      textColor: 0xFFFFFFFF,
                      textsize: 22,
                      callback: allClear,
                    ),
                    CalcButton(
                      text: 'C',
                      fillColor: 0xFF6C807F,
                      textColor: 0xFFFFFFFF,
                      callback: clear,
                    ),
                    CalcButton(
                      text: '%',
                      fillColor: 0xFFFFFFFF,
                      textColor: 0xFF000000,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '/',
                      fillColor: 0xFFFFFFFF,
                      textColor: 0xFF000000,
                      callback: numClick,
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: '7',
                      textColor: 0xFF000000,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '8',
                      textColor: 0xFF000000,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '9',
                      textColor: 0xFF000000,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '*',
                      fillColor: 0xFFFFFFFF,
                      textColor: 0xFF000000,
                      callback: numClick,
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: '4',
                      textColor: 0xFF000000,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '5',
                      textColor: 0xFF000000,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '6',
                      textColor: 0xFF000000,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '-',
                      fillColor: 0xFFFFFFFF,
                      textColor: 0xFF000000,
                      callback: numClick,
                      textsize: 30,
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: '1',
                      textColor: 0xFF000000,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '2',
                      textColor: 0xFF000000,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '3',
                      textColor: 0xFF000000,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '+',
                      fillColor: 0xFFFFFFFF,
                      textColor: 0xFF000000,
                      callback: numClick,
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: '.',
                      textColor: 0xFF000000,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '0',
                      textColor: 0xFF000000,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '00',
                      textColor: 0xFF000000,
                      textsize: 26,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '=',
                      fillColor: 0xFFFFFFFF,
                      textColor: 0xFF000000,
                      callback: evaluate,
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }

  void Button() {
    CalcButton();
  }
}
