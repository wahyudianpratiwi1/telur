import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoring_apps/helper/notification_helper.dart';
import 'package:monitoring_apps/model/sensor.dart';

class SensorController extends GetxController {
  Rx<Sensor> sensorData = Sensor().obs;
  late DatabaseReference _databaseReference;

  @override
  void onInit() {
    super.onInit();
    //get data from Firebase Realtime Database
    _databaseReference = FirebaseDatabase.instance.ref('Sensor');

    _databaseReference.onValue.listen((event) {
      if (event.snapshot.value != null) {
        final data = Map<String, dynamic>.from(
            event.snapshot.value! as Map<Object?, Object?>);

        print("Raw data from Firebase: $data");
        sensorData.value = Sensor.fromJson(data);
        var sensor = Sensor.fromJson(data);
        sensorData.value = sensor;
        print("Sensor data: ${sensorData.value}");
        _showLocalNotification(sensor);
      } else {
        sensorData.value = Sensor(
          heater: 0,
          kelembapan: 0.0,
          suhu: 0.0,
          lampu: 0,
          camera: 0,
          kipas: 0,
        );
      }
    });
  }

  void _showLocalNotification(Sensor sensor) {
    final heaterValue = sensor.heater;
    final kelembapanValue = sensor.kelembapan;
    if (heaterValue! < 36 || heaterValue > 40.2) {
      NotificationHelper.showNotification(
        title: 'Monitoring Inkubator',
        body: 'Hallo, Cek Suhu Inkubatormu Yuk!!',
      );
    }

    if (kelembapanValue! < 50 || kelembapanValue > 60) {
      NotificationHelper.showNotification(
        title: 'Monitoring Inkubator',
        body: 'Hallo, Cek Kelembaban Inkubatormu Yuk!!',
      );
    }
  }

  void updateHeater(int value) {
    _databaseReference.update({"heater": value});
  }

  void updateKipas(int value) {
    _databaseReference.update({"kipas": value});
  }

  void updateStepper(int value) {
    _databaseReference.update({"stepper": value});
  }

  void updateCamera(int value) {
    _databaseReference.update({"camera": value}).then((_) {
      Get.snackbar(
        'Success',
        'Successfully sent $value to Firebase',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }).catchError((error) {
      Get.snackbar(
        'Error',
        'Failed to send $value to Firebase: $error',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    });
  }
}
