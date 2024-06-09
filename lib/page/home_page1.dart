import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:monitoring_apps/config/asset_apps.dart';
import 'package:monitoring_apps/controller/camera_controller.dart';
import 'package:monitoring_apps/controller/sensor_controller.dart';

import '../config/color.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
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
              children: [
                Center(
                  child: Image(
                    image: new AssetImage(AppAsset.bgSplash),
                    width: 600,
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Widget3()],
                )
              ],
            ),
          ),
        ),
      );
    })));
  }
}

class Widget3 extends StatefulWidget {
  const Widget3({super.key});

  @override
  State<Widget3> createState() => _Widget3State();
}

class _Widget3State extends State<Widget3> {
  final CameraController cameraController = Get.put(CameraController());
  final SensorController sensorController = Get.put(SensorController());
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorApp.bg2),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
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
                                image: AssetImage(AppAsset.iconCamera),
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
                              "CAMERA",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )),
                          ),
                        ],
                      ),
                    ),
                    Obx(() {
                      String? photoBase64 =
                          cameraController.cameraData.value.photo;
                      if (photoBase64 != null && photoBase64.isNotEmpty) {
                        try {
                          // Debug print to check the Base64 string
                          print("Base64 String: $photoBase64");

                          // Decode any URL encoded characters in the Base64 string
                          photoBase64 = Uri.decodeComponent(photoBase64);

                          // If the Base64 string contains a prefix like "data:image/jpeg;base64,"
                          if (photoBase64.contains(',')) {
                            photoBase64 = photoBase64.split(',')[1];
                          }

                          Uint8List bytes = base64Decode(photoBase64);
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              width: 200, // Set the desired width
                              height: 200, // Set the desired height
                              child: Image.memory(
                                bytes,
                                fit: BoxFit
                                    .cover, // Adjust this based on your need
                              ),
                            ),
                          );
                        } catch (e) {
                          return Text('Error decoding image: $e');
                        }
                      } else {
                        return Text('Loading... or No image found');
                      }
                    }),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all<Size>(
                                  const Size(130, 38)),
                              shape: MaterialStatePropertyAll<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  ColorApp.graycolor)),
                          onPressed: () {
                            sensorController.updateCamera(1);
                          },
                          child: const Text(
                            'Capture',
                            style: TextStyle(fontSize: 16),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ])
        ]);
  }
}
