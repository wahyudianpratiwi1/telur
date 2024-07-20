import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoring_apps/config/asset_apps.dart';
import 'package:monitoring_apps/config/color.dart';
import 'package:monitoring_apps/controller/sensor_controller.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    return Scaffold(
        body: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
          ),
          child: Container(
            child: Stack(
              // alignment: Alignment.center,
              children: [
                Center(
                  child: Image(
                    image: new AssetImage(AppAsset.bghome),
                    width: screenWidth,
                    height: screenHeight,
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
                Column(
                  children: [Widget1(), Widget2()],
                ),
              ],
            ),
          ),
        ),
      );
    })));
  }
}

class Widget1 extends StatefulWidget {
  const Widget1({super.key});

  @override
  State<Widget1> createState() => _Widget1State();
}

class _Widget1State extends State<Widget1> {
  final SensorController sensorController = Get.put(SensorController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            height: 520,
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Container(
                        //   height: 67,
                        //   width: 67,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(100),
                        //       color: ColorApp.yellowcolor),
                        //   child: const Padding(
                        //     padding: EdgeInsets.all(8.0),
                        //     child: Image(
                        //       image: AssetImage(AppAsset.iconTemp),
                        //     ),
                        //   ),
                        // ),
                        Container(
                          height: 67,
                          width: 240,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorApp.bg3),
                          child: const Center(
                              child: Text(
                            "MONITORING & KONTROL",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'JacquesFrancois'),
                          )),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                      child: Center(
                        child: Container(
                          height: 30,
                          width: 300,
                          child: const Center(
                              child: Text(
                            "Suhu Inkubator",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'JacquesFrancois'),
                          )),
                        ),
                      ),
                    ),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: CircularPercentIndicator(
                            animation: true,
                            animationDuration: 1000,
                            radius: 60.0,
                            lineWidth: 15.0,
                            percent:
                                sensorController.sensorData.value.suhu != null
                                    ? (sensorController.sensorData.value.suhu! /
                                        100)
                                    : 0.0,
                            center: Text(
                              '${sensorController.sensorData.value.suhu?.toStringAsFixed(1) ?? "0.0"}°C',
                              style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: ColorApp.primary),
                            ),
                            progressColor: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          height: 70,
                          width: 300,
                          child: const Center(
                              child: Text(
                            "Kelembaban\n  Inkubator",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'JacquesFrancois'),
                          )),
                        ),
                      ),
                    ),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Center(
                          child: CircularPercentIndicator(
                            animation: true,
                            animationDuration: 1000,
                            radius: 60.0,
                            lineWidth: 15.0,
                            percent:
                                sensorController.sensorData.value.kelembapan !=
                                        null
                                    ? (sensorController
                                            .sensorData.value.kelembapan! /
                                        100)
                                    : 0.0,
                            center: Text(
                              '${sensorController.sensorData.value.kelembapan}%',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            progressColor: ColorApp.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}

class Widget2 extends StatefulWidget {
  const Widget2({super.key});

  @override
  State<Widget2> createState() => _Widget2State();
}

class _Widget2State extends State<Widget2> {
  final SensorController sensorController = Get.put(SensorController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 306,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0, left: 0),
                    child: Container(
                      height: 40,
                      width: 200,
                      child: const Center(
                          child: Text(
                        "PEMANAS",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'JacquesFrancois'),
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 190),
                  child: Obx((() {
                    return Transform.scale(
                      scale: 1.6,
                      child: SwitchListTile(
                        value: sensorController.sensorData.value.heater == 1,
                        onChanged: (bool value) {
                          int heaterValue = value ? 1 : 0;
                          sensorController.updateHeater(heaterValue);
                        },
                        activeColor: ColorApp.orangecolor,
                        inactiveThumbColor: Colors.transparent,
                        inactiveTrackColor: Colors.grey,
                      ),
                    );
                  })),
                ),
                Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 0, right: 10),
                    child: Container(
                      height: 40,
                      width: 108,
                      child: const Center(
                          child: Text(
                        "KIPAS",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'JacquesFrancois'),
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 190),
                  child: Obx((() {
                    return Transform.scale(
                      scale: 1.6,
                      child: SwitchListTile(
                        value: sensorController.sensorData.value.kipas == 1,
                        onChanged: (bool value) {
                          int kipasValue = value ? 1 : 0;
                          sensorController.updateKipas(kipasValue);
                        },
                        activeColor: ColorApp.orangecolor,
                        inactiveThumbColor: Colors.transparent,
                        inactiveTrackColor: Colors.grey,
                      ),
                    );
                  })),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/pilihan');
                      },
                      child: Image.asset(
                        AppAsset.back,
                        height: 47,
                        width: 64,
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 40),
                        child: Container(
                          height: 40,
                          width: 200,
                          child: const Center(
                              child: Text(
                            "STEPPER",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'JacquesFrancois'),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 190),
                  child: Obx((() {
                    return Transform.scale(
                      scale: 1.6,
                      child: SwitchListTile(
                        value: sensorController.sensorData.value.stepper == 1,
                        onChanged: (bool value) {
                          int stepperValue = value ? 1 : 0;
                          sensorController.updateStepper(stepperValue);
                        },
                        activeColor: ColorApp.orangecolor,
                        inactiveThumbColor: Colors.transparent,
                        inactiveTrackColor: Colors.grey,
                      ),
                    );
                  })),
                ),
                // const Padding(
                //   padding: const EdgeInsets.only(left: 50.0, top: 30),
                //   child: Text("By: Salsa & Azrah",
                //       style:
                //           TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
                // )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
