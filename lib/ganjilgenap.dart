import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobiletugas1/dashboard.dart';
import 'package:mobiletugas1/main.dart';

class GanjilGenap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ganjil Genap',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GanjilGenapScreen(),
    );
  }
}

class GanjilGenapScreen extends StatefulWidget {
  @override
  _GanjilGenapScreenState createState() => _GanjilGenapScreenState();
}

class _GanjilGenapScreenState extends State<GanjilGenapScreen> {
  final TextEditingController _num1Controller = TextEditingController();
  String status = "";

  @override
  void dispose() {
    _num1Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 60, 11, 68),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
             Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()), // Kembali ke halaman sebelumnya
              );
          }
        ),
        title: const Text('Ganjil Genap'),
        
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/ganjilgenap.png',
                  height: 200,
                ),
                const SizedBox(height: 18),
                TextField(
                  style: const TextStyle(color: Colors.white),  
                  controller: _num1Controller,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Masukkan bilangan',
                    filled: true,
                    fillColor: const Color.fromARGB(255, 45, 8, 51),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: MaterialButton(
                    onPressed: _check,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: const Text(
                      'Check Ganjil Genap',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  'Hasil: $status',
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _check() {
    double num1 = double.tryParse(_num1Controller.text) ?? 0;
    if (num1 % 1 != 0) {
      setState(() {
        status = "Bukan bilangan bulat";
      });
    } else {
      setState(() {
        if (num1 % 2 == 0) {
          status = "Genap";
        } else {
          status = "Ganjil";
        }
      });
    }
  }

  void _logOut() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyApp()),
    );
  }

  void _homePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Dashboard()),
    );
  }
}