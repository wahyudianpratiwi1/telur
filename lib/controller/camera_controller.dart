import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/sensor.dart';

class CameraController extends GetxController {
  Rx<Esp32Cam> cameraData = Esp32Cam().obs;
  late DatabaseReference _databaseReference;
  @override
  void onInit() {
    super.onInit();
    //get data from Firebase Realtime Database
    _databaseReference = FirebaseDatabase.instance.ref('esp32-cam');

    _databaseReference.onValue.listen((event) {
      if (event.snapshot.value != null) {
        final data = Map<String, dynamic>.from(
            event.snapshot.value! as Map<Object?, Object?>);

        print("Raw data from Firebase: $data");
        cameraData.value = Esp32Cam.fromJson(data);
        var camera = Esp32Cam.fromJson(data);
        cameraData.value = camera;
        print("Camera data: ${cameraData.value}");
      } else {
        cameraData.value = Esp32Cam(
          photo: "",
        );
      }
    });
  }
}
