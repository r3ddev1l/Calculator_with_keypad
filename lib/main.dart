import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

void main() => runApp(MyCalculator());

class MyCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //to force the ui into landscape mode
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight
    // ]);
    
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme:  ThemeData(
        primarySwatch: Colors.red,
        
      ),
      home:  MyHomePage(title: "Srijan's Calculator"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "÷" ||
        buttonText == "X") {
      num1 = double.parse(output);

      operand = buttonText;

      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already conatains a decimals");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "÷") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return  Expanded(
      child:  OutlineButton(
        padding:  EdgeInsets.all(24.0),
        child:  Text(
          buttonText,
          style: TextStyle(color: Colors.red, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.black,
        appBar:  AppBar(
          title:  Text(widget.title),
        ),
        body:  Container(
            child:  Column(
          children: <Widget>[
             Container(
                alignment: Alignment.centerRight,
                padding:
                     EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                child:  Text(output,
                    style:  TextStyle(
                      color: Colors.red,
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                      
                    ))),
             Expanded(
              child:  Divider(),
            ),
             Column(children: [
               Row(children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("÷")
              ]),
               Row(children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("X")
              ]),
               Row(children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-")
              ]),
               Row(children: [
                buildButton("."),
                buildButton("0"),
                buildButton("00"),
                buildButton("+")
              ]),
               Row(children: [
                buildButton("CLEAR"),
                buildButton("="),
              ])
            ])
          ],
        )));
  }
}
