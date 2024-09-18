import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobiletugas1/dashboard.dart';
import 'package:mobiletugas1/loginpage.dart';

void main() => runApp(Penjumlahan());

class Penjumlahan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: penjumlahan(),
    );
  }
}

class penjumlahan extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<penjumlahan> {
  final TextEditingController _number1Controller = TextEditingController();
  final TextEditingController _number2Controller = TextEditingController();
  String _result = '';
  bool _isFirstNumberInput = true; // To switch between number 1 and number 2 input

  void _calculate(String operation) {
    final double? number1 = double.tryParse(_number1Controller.text);
    final double? number2 = double.tryParse(_number2Controller.text);

    if (number1 == null || number2 == null) {
      setState(() {
        _result = 'Please enter valid numbers';
      });
      return;
    }

    double calculation;
    if (operation == '+') {
      calculation = number1 + number2;
    } else {
      calculation = number1 - number2;
    }

    setState(() {
      _result = 'Result: $calculation';
    });
  }

  void _appendNumber(String number) {
    if (_isFirstNumberInput) {
      _number1Controller.text += number;
    } else {
      _number2Controller.text += number;
    }
  }

  void _toggleNumberInput() {
    setState(() {
      _isFirstNumberInput = !_isFirstNumberInput;
    });
  }

  void _clearInput() {
    _number1Controller.clear();
    _number2Controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator'),
      ),
      body: Container(color: const Color.fromARGB(255, 43, 7, 50),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Image.asset(
                  'assets/kalkulator.png',
                  height: 200,
                ),
            TextField(
              style: const TextStyle(color: Colors.white),  
               controller: _number1Controller,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                  ],
              decoration: InputDecoration(
                labelText: 'Number 1',
                border: OutlineInputBorder(),
                
              ),
              onTap: () => _isFirstNumberInput = true, // Switch to number 1 input
            ),
            SizedBox(height: 20),
            TextField(
              style: const TextStyle(color: Colors.white),
              controller: _number2Controller,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                  ],
              decoration: InputDecoration(
                labelText: 'Number 2',
                border: OutlineInputBorder(),
              ),
              onTap: () => _isFirstNumberInput = false, // Switch to number 2 input
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _calculate('+'),
                  child: Text('+', style: TextStyle(fontSize: 20)),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('-'),
                  child: Text('-', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              
              _result,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Removed numpad grid view
          ],
        ),
      ),
    );
  }
}
