import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColors) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColors,
      child: TextButton(
        child: Text(buttonText),
        onPressed: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              "0",
              style: TextStyle(fontSize: 38.0),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              "0",
              style: TextStyle(fontSize: 48.0),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(children: [
                  TableRow(
                    children: [
                      buildButton("C", 1, Colors.redAccent),
                      buildButton("C", 1, Colors.redAccent),
                      buildButton("C", 1, Colors.redAccent),
                      buildButton("C", 1, Colors.redAccent),
                    ],
                  )
                ]),
              )
            ],
          )
        ],
      ),
    );
  }
}
