import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'buttons.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _output = '';
  double _num1 = 0;
  double _num2 = 0;
  String _operator = '';
  String history = '';

  void btnClick(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _output = '';
        _num1 = 0;
        _num2 = 0;
        _operator = '';
        history = '';
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '*' ||
          buttonText == '/' ||
          buttonText == '%') {
        _num1 = double.parse(_output);
        _operator = buttonText;
        _output = '';
        history = _num1.toString();
        print(history);
        if (history.endsWith(".0")) {
          history = history.substring(0, history.length - 2);
          history = " $history $_operator ";
        }
      } else if (buttonText == '.') {
        if (_output.contains('.')) {
          print("Already contain a decimal");
          return;
        } else {
          _output += buttonText;
        }
      } else if (buttonText == '=') {
        _num2 = double.parse(_output);
        if (_operator == '+') {
          _output = (_num1 + _num2).toString();
        }
        if (_operator == '-') {
          _output = (_num1 - _num2).toString();
        }
        if (_operator == '*') {
          _output = (_num1 * _num2).toString();
        }
        if (_operator == '/') {
          _output = (_num1 / _num2).toString();
        }
        history = "$history$_num2";
        _num1 = 0;
        _num2 = 0;
        _operator = '';
      } else if (buttonText == 'del') {
        if (_output.isNotEmpty) {
          _output = _output.substring(0, _output.length - 1);
        }
      } else {
        _output += buttonText;
      }
      if (_output.endsWith(".0")) {
        _output = _output.substring(0, _output.length - 2);
      }
      if (history.endsWith(".0")) {
        history = history.substring(0, history.length - 2);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: mediaquery.size.height * 0.06,
        title: Text(
          "Calculator",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: Container(
          height: mediaquery.size.height,
          width: mediaquery.size.width,
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: mediaquery.size.height * 0.15,
                  alignment: Alignment(1.0, 1.0),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      history,
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: Colors.orange.shade200),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: mediaquery.size.height * 0.14,
                  alignment: Alignment(1.0, 1.0),
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      _output,
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          color: Colors.orange.shade200),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Buttons(
                    text: 'C',
                    callback: btnClick,
                    textcolor: Colors.red,
                  ),
                  Buttons(
                    text: 'del',
                    callback: btnClick,
                    textcolor: Colors.red,
                  ),
                  Buttons(
                    text: '%',
                    callback: btnClick,
                    textcolor: Colors.pink.shade300,
                  ),
                  Buttons(
                    text: '/',
                    callback: btnClick,
                    textcolor: Colors.pink.shade300,
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Buttons(
                    text: '7',
                    callback: btnClick,
                    textcolor: Colors.orange,
                  ),
                  Buttons(
                    text: '8',
                    callback: btnClick,
                    textcolor: Colors.orange,
                  ),
                  Buttons(
                    text: '9',
                    callback: btnClick,
                    textcolor: Colors.orange,
                  ),
                  Buttons(
                    text: '*',
                    callback: btnClick,
                    textcolor: Colors.pink.shade300,
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Buttons(
                    text: '4',
                    callback: btnClick,
                    textcolor: Colors.orange,
                  ),
                  Buttons(
                    text: '5',
                    callback: btnClick,
                    textcolor: Colors.orange,
                  ),
                  Buttons(
                    text: '6',
                    callback: btnClick,
                    textcolor: Colors.orange,
                  ),
                  Buttons(
                    text: '-',
                    callback: btnClick,
                    textcolor: Colors.pink.shade300,
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Buttons(
                    text: '1',
                    callback: btnClick,
                    textcolor: Colors.orange,
                  ),
                  Buttons(
                    text: '2',
                    callback: btnClick,
                    textcolor: Colors.orange,
                  ),
                  Buttons(
                    text: '3',
                    callback: btnClick,
                    textcolor: Colors.orange,
                  ),
                  Buttons(
                    text: '+',
                    callback: btnClick,
                    textcolor: Colors.pink.shade300,
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Buttons(
                    text: '+/-',
                    callback: btnClick,
                    textcolor: Colors.pink,
                  ),
                  Buttons(
                    text: '0',
                    callback: btnClick,
                    textcolor: Colors.orange,
                  ),
                  Buttons(
                    text: '.',
                    callback: btnClick,
                    textcolor: Colors.orange,
                  ),
                  Buttons(
                    text: '=',
                    callback: btnClick,
                    textcolor: Colors.blueGrey,
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
