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
    return Scaffold(
        body: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
          ),
          child: Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Image(
                    image: new AssetImage(AppAsset.bgSplash),
                    width: 600,
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  children: [Widget1(), Widget2()],
                )
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
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: ColorApp.bg2),
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 67,
                          width: 67,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: ColorApp.bg3),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image(
                              image: AssetImage(AppAsset.iconTemp),
                            ),
                          ),
                        ),
                        Container(
                          height: 67,
                          width: 237,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorApp.bg3),
                          child: const Center(
                              child: Text(
                            "SUHU DAN KELEMBABAN",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 48,
                        width: 108,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: ColorApp.bg3),
                        child: const Center(
                            child: Text(
                          "SUHU",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        )),
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
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: ColorApp.yellowcolor),
                            ),
                            progressColor: ColorApp.graycolor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        height: 48,
                        width: 108,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: ColorApp.bg3),
                        child: const Center(
                            child: Text(
                          "KELEMBABAN",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        )),
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
                                sensorController.sensorData.value.kelembapan !=
                                        null
                                    ? (sensorController
                                            .sensorData.value.kelembapan! /
                                        100)
                                    : 0.0,
                            center: Text(
                              '${sensorController.sensorData.value.kelembapan}%',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: ColorApp.yellowcolor),
                            ),
                            progressColor: ColorApp.graycolor,
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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorApp.bg2),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 30),
                  child: Container(
                    height: 48,
                    width: 108,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorApp.bg3),
                    child: const Center(
                        child: Text(
                      "HEATER",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 209),
                  child: Obx((() {
                    return Transform.scale(
                      scale: 2,
                      child: SwitchListTile(
                        value: sensorController.sensorData.value.heater == 1,
                        onChanged: (bool value) {
                          int heaterValue = value ? 1 : 0;
                          sensorController.updateHeater(heaterValue);
                        },
                        activeColor: ColorApp.yellowcolor,
                        inactiveThumbColor: Colors.grey,
                        inactiveTrackColor: Colors.grey,
                      ),
                    );
                  })),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 30),
                  child: Container(
                    height: 48,
                    width: 108,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorApp.bg3),
                    child: const Center(
                        child: Text(
                      "KIPAS",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 209),
                  child: Obx((() {
                    return Transform.scale(
                      scale: 2,
                      child: SwitchListTile(
                        value: sensorController.sensorData.value.kipas == 1,
                        onChanged: (bool value) {
                          int kipasValue = value ? 1 : 0;
                          sensorController.updateKipas(kipasValue);
                        },
                        activeColor: ColorApp.yellowcolor,
                        inactiveThumbColor: Colors.grey,
                        inactiveTrackColor: Colors.grey,
                      ),
                    );
                  })),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, top: 30),
                  child: Text("By: Salsa & Azrah",
                      style:
                          TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
