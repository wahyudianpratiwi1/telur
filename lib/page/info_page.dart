import 'package:flutter/material.dart';

import 'package:monitoring_apps/config/asset_apps.dart';

// import '../config/color.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Center(
              child: Image(
                image: new AssetImage(AppAsset.bginfo),
                width: screenWidth,
                fit: BoxFit.fill,
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.pushNamed(context, '/pilihan');
            //   },
            //   child: Image.asset(
            //     AppAsset.back,
            //     height: 47,
            //     width: 64,
            //   ),
            // ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 20),
                child: Container(
                  height: screenHeight * 0.80,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            "INFO",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'JacquesFrancois'),
                          ),
                        ),
                        const Text(
                          "Penetas Telur adalah aplikasi sistem monitoring suhu dan kelembaban serta  pengambilan gambar didalam inkubator dengan memanfaatkan teknologi Internet of Things (IoT).  Komponen yang umumnya digunakan dalam aplikasi ini diantaranya,  Android Studio, Sensor DHT22, Mikrokontroler NodeMCU ESP32, dan ESP32 Cam.",
                          style: TextStyle(
                              fontSize: 15, fontFamily: 'JacquesFrancois'),
                        ),
                        const Text(
                          'Aplikasi ini memberikan data/informasi terkait suhu/kelemaban yang telah dibaca oleh sensor dan dikirimkan melalui database yang telah diatur secara realtime.',
                          style: TextStyle(
                              fontSize: 15, fontFamily: 'JacquesFrancois'),
                        ),
                        const Text(
                          'Aplikasi ini dapat memudahkan pengguna dapat mengkontrol Heater, Kipas, dan Stepper secara manual, dengan menekan tombol ON/OFF yang tersedia di aplikasi.',
                          style: TextStyle(
                              fontSize: 15, fontFamily: 'JacquesFrancois'),
                        ),
                        const Text(
                          'Pengguna dapat Memanfaatkan fitur kamera untuk melihat kondisi didalam inkubator, tidak hanya itu pengguna juga dapat menginstal gambar terbaru dengan menekan button unduh.',
                          style: TextStyle(
                              fontSize: 15, fontFamily: 'JacquesFrancois'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 70),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: new AssetImage(AppAsset.iconcopyright),
                                width: 60,
                                height: 60,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "42620032 & 42620037 ",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Text(
                                    "TMJ ANGKATAN 20, \ntahun 2024",
                                    style: TextStyle(fontSize: 17),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 800.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/pilihan');
                },
                child: Image.asset(
                  AppAsset.back,
                  height: 47,
                  width: 64,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
