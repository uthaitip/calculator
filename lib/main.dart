import 'package:calculator_app/screen/calculator_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String outPut = "0";
  String _out = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  pressedButton(String val) {
    if (val == "C") {
      _out = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (val == "+" || val == "-" || val == "*" || val == "/") {
      num1 = double.parse(outPut);
      operand = val;
      _out = "0";
      outPut = outPut + val;
    } else if (val == ".") {
      if (_out.contains(".")) {
        return;
      } else {
        _out = _out + val;
      }
    } else if (val == "=") {
      num2 = double.parse(outPut);
      if (operand == "+") {
        _out = (num1 + num2).toString();
      }
      if (operand == "-") {
        _out = (num1 - num2).toString();
      }
      if (operand == "*") {
        _out = (num1 * num2).toString();
      }
      if (operand == "/") {
        _out = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
    } else {
      _out = _out + val;
    }

    setState(() {
      outPut = double.parse(_out).toStringAsFixed(2);
    });
    print(val);
    print(_out);
  }

  Widget calcBtn(String btn) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20.0),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.shade500,
          //     offset: Offset(2.0, 2.0),
          //     blurRadius: 8.0,
          //     spreadRadius: 1.0,
          //   ),
          //   BoxShadow(
          //     color: Colors.white,
          //     offset: Offset(-2.0, -2.0),
          //     blurRadius: 8.0,
          //     spreadRadius: 1.0,
          //   )
          // ],
        ),
        child: MaterialButton(
          padding: EdgeInsets.all(25.0),
          onPressed: () => pressedButton(btn),
          child: Text(
            btn,
            style: TextStyle(fontSize: 22.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Calculator',
        ),
        backgroundColor: Color(0xff28527a),
      ),
      body: Container(
          decoration: BoxDecoration(color: Color(0xff28527a)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 50.0),
                child: Text(
                  outPut,
                  style: TextStyle(fontSize: 60.0, color: Colors.white),
                ),
              ),
              // Expanded(child: Divider()),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      calcBtn("."),
                      calcBtn("C"),
                      calcBtn("00"),
                      calcBtn("*"),
                    ],
                  ),
                  Row(
                    children: [
                      calcBtn("7"),
                      calcBtn("8"),
                      calcBtn("9"),
                      calcBtn("/"),
                    ],
                  ),
                  Row(
                    children: [
                      calcBtn("4"),
                      calcBtn("5"),
                      calcBtn("6"),
                      calcBtn("+"),
                    ],
                  ),
                  Row(
                    children: [
                      calcBtn("1"),
                      calcBtn("2"),
                      calcBtn("3"),
                      calcBtn("-"),
                    ],
                  ),
                  Row(
                    children: [
                      calcBtn("0"),
                      calcBtn("="),
                    ],
                  ),
                ],
              )
            ],
          )),
    ));
  }
}
