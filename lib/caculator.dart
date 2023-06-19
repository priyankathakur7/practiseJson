import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 50.0;
  double resultFontSize = 48.0;


   buttonPressed(String buttonText) {
    // print("Button Pressed: $buttonText");
    setState(() {
      if (buttonText ==  "C") {
        equation = "0";
        result = "0";
         equationFontSize = 50.0;
         resultFontSize = 48.0;

      }else if (buttonText == "⌫"){
        equationFontSize = 50.0;
        resultFontSize = 48.0;

        equation = equation.substring(0, equation.length - 1);
        if (equation == ""){
          equation = "0";
        }
      }else if (buttonText == "=") {
        equationFontSize = 50.0;
        resultFontSize = 48.0;
         expression = equation;
        expression = expression.replaceAll( '×', '*');
        expression = expression.replaceAll('+', '/');

        try{
          Parser p = new Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        }catch(e){
          result = "Error";
        }

        } else{
          equationFontSize = 50.0;
          resultFontSize = 48.0;
          if (equation == "0"){
          } else {
          }equation = equation + buttonText;
        }

    });
  }

  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
              color: Colors.cyanAccent,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Calculator"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              equation,
              style: TextStyle(fontSize: equationFontSize, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: Text(
                result,
                style: TextStyle(fontSize: resultFontSize, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("C", 1, Colors.redAccent),
                        buildButton("⌫", 1, Colors.blueGrey),
                        buildButton(":", 1, Colors.blueGrey),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("7", 1, Colors.black54),
                        buildButton("8", 1, Colors.black54),
                        buildButton("9", 1, Colors.black54),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("4", 1, Colors.black54),
                        buildButton("5", 1, Colors.black54),
                        buildButton("6", 1, Colors.black54),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("1", 1, Colors.black54),
                        buildButton("2", 1, Colors.black54),
                        buildButton("3", 1, Colors.black54),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("00", 1, Colors.black54),
                        buildButton("0", 1, Colors.black54),
                        buildButton(".", 1, Colors.black54),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("×", 1, Colors.grey),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("-", 1, Colors.grey),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("+", 1, Colors.grey),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("=", 2, Colors.red),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
