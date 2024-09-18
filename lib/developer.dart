import 'package:flutter/material.dart';
import 'package:mobiletugas1/dashboard.dart';

void main() {
  runApp(Developer());
}

class Developer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tentang Kami',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Kami',style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
        ),
        backgroundColor: const Color.fromARGB(255, 40, 5, 47),
      ),
      backgroundColor: const Color.fromARGB(255, 40, 7, 45), // Mengatur latar belakang menjadi ungu terang
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/tomo.png'), // Pastikan ekstensi file ada
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/evo.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Dafa Bagus Utama / 124220134',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              'Evo Aninditya Rais / 124220139',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => Dashboard()), // Kembali ke halaman sebelumnya
              );
            },
            child: Text('Kembali'),
          ),
        ),
      ),
    );
  }
}
