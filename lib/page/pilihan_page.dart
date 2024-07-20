import 'package:flutter/material.dart';
import 'package:monitoring_apps/config/asset_apps.dart';

import '../config/color.dart';

class PilihanPage extends StatefulWidget {
  const PilihanPage({super.key});

  @override
  State<PilihanPage> createState() => _PilihanPageState();
}

class _PilihanPageState extends State<PilihanPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    return Scaffold(
      body: Container(
        child: Stack(
          // alignment: Alignment.center,
          children: [
            Center(
              child: Image(
                image: const AssetImage(AppAsset.bgpilihan),
                width: screenWidth,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 800.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/awal');
                },
                child: Image.asset(
                  AppAsset.back,
                  height: 47,
                  width: 64,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 350.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                              fixedSize: WidgetStateProperty.all<Size>(Size(
                                  screenWidth * 0.75, screenHeight * 0.10)),
                              shape: WidgetStatePropertyAll<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: BorderSide(color: Colors.black))),
                              backgroundColor: WidgetStateProperty.all<Color>(
                                  ColorApp.yellowcolor),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/page');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Image(
                                        image: AssetImage(AppAsset.iconTemp),
                                      ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  'MONITORING',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontFamily: 'JacquesFrancois',
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                fixedSize: WidgetStateProperty.all<Size>(Size(
                                    screenWidth * 0.75, screenHeight * 0.10)),
                                shape: WidgetStatePropertyAll<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        side: BorderSide(color: Colors.black))),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                    ColorApp.yellowcolor),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/page1');
                              },
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Image(
                                      image: AssetImage(AppAsset.camera),
                                    ),
                                  ),
                                  Text(
                                    '     KAMERA    ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontFamily: 'JacquesFrancois',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/info');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 100.0),
                      child: Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.black),
                            color: ColorApp.yellowcolor),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image(
                            image: AssetImage(AppAsset.iconInfo),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
