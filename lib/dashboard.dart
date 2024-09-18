import 'package:flutter/material.dart';
import 'package:mobiletugas1/developer.dart';
import 'package:mobiletugas1/loginpage.dart';
import 'package:mobiletugas1/penjumlahan.dart';
import 'package:mobiletugas1/ganjilgenap.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Dashboard(),
   )
  );
}

class Dashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 10, 45),
      body: SafeArea(
        child: InkWell(
          onTap: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back, color: Colors.white, size: 30.0,),
                  Image.asset("assets/avatarmen.png", width: 50.0)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Dashboard Options",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: [
                    SizedBox(
                      width: 160.0,
                      height: 250.0,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => penjumlahan()),
                            );
                          },
                      child: Card(
                        color: Colors.white,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset("assets/kalkulator.png", width: 150.0,),
                                SizedBox(height: 50.0),
                                Text("Kalkulator", style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                    SizedBox(
                      width: 160.0,
                      height: 250.0,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => GanjilGenap()),
                            );
                          },
                      child: Card(
                        color: Colors.white,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset("assets/ganjilgenap.png", width: 150.0,),
                                SizedBox(height: 50.0),
                                Text("Ganjil & Genap", style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                    SizedBox(
                      width: 160.0,
                      height: 250.0,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => Developer()),
                            );
                          },
                      child: Card(
                        color: Colors.white,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset("assets/about.jpeg", width: 150.0,),
                                SizedBox(height: 50.0),
                                Text("About Us", style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}