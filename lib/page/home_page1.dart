import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:monitoring_apps/config/asset_apps.dart';
import 'package:monitoring_apps/controller/camera_controller.dart';
import 'package:monitoring_apps/controller/sensor_controller.dart';
import 'package:permission_handler/permission_handler.dart';

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
                    image: new AssetImage(AppAsset.bgcamera),
                    width: 600,
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
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Center(
                    child: Container(
                      height: 67,
                      width: 237,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorApp.bg3,
                          border: Border.all(color: Colors.white, width: 2)),
                      child: const Center(
                          child: Text(
                        "KAMERA",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'JacquesFrancois'),
                      )),
                    ),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Widget3()],
                  ),
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

  Future<void> saveImageToGallery(String base64Image) async {
    try {
      Uint8List bytes = base64Decode(base64Image);
      // Request permissions if not already granted
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
      }

      final result = await ImageGallerySaver.saveImage(bytes,
          quality: 80, name: "my_image");
      if (result['isSuccess']) {
        Fluttertoast.showToast(
            msg: "Image Saved Successfully", toastLength: Toast.LENGTH_SHORT);
      } else {
        Fluttertoast.showToast(
            msg: "Failed to Save Image", toastLength: Toast.LENGTH_SHORT);
      }
    } on PlatformException catch (e) {
      print('Error: $e');
      Fluttertoast.showToast(
          msg: "Error Saving Imgae", toastLength: Toast.LENGTH_SHORT);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Container(
                  height: 370,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorApp.bg2),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // Container(
                                //   height: 67,
                                //   width: 67,
                                //   decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(100),
                                //       color: ColorApp.bg3),
                                //   child: const Padding(
                                //     padding: EdgeInsets.all(8.0),
                                //     child: Image(
                                //       image: AssetImage(AppAsset.iconCamera),
                                //     ),
                                //   ),
                                // ),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  sensorController.updateCamera(1);
                                },
                                child: Container(
                                  height: 90,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          color: Colors.white, width: 2),
                                      color: ColorApp.bg3),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Image(
                                      image: AssetImage(AppAsset.iconCamera),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  String? photoBase64 =
                                      cameraController.cameraData.value.photo;
                                  if (photoBase64 != null &&
                                      photoBase64.isNotEmpty) {
                                    // Decode any URL encoded characters in the Base64 string
                                    photoBase64 =
                                        Uri.decodeComponent(photoBase64);

                                    // If the Base64 string contains a prefix like "data:image/jpeg;base64,"
                                    if (photoBase64.contains(',')) {
                                      photoBase64 = photoBase64.split(',')[1];
                                    }

                                    saveImageToGallery(photoBase64);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "No image to save",
                                        toastLength: Toast.LENGTH_SHORT);
                                  }
                                },
                                child: Container(
                                  height: 90,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: ColorApp.bg3,
                                      border: Border.all(
                                          color: Colors.white, width: 2)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Image(
                                      image: AssetImage(AppAsset.icondownload),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 300.0, top: 270),
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
            ])
          ])
        ]);
  }
}
