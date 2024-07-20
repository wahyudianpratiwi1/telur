class Sensor {
  int? heater;
  double? kelembapan;
  int? lampu;
  int? kipas;
  int? camera;
  int? stepper;
  double? suhu;

  Sensor({
    this.heater,
    this.kelembapan,
    this.lampu,
    this.kipas,
    this.camera,
    this.stepper,
    this.suhu,
  });

  factory Sensor.fromJson(Map<String, dynamic> json) => Sensor(
      heater: json["heater"],
      kelembapan: json["kelembapan"]?.toDouble(),
      lampu: json["lampu"],
      kipas: json["kipas"],
      camera: json["camera"],
      stepper: json["stepper"],
      suhu: json["suhu"]?.toDouble());

  Map<String, dynamic> toJson() => {
        "heater": heater,
        "kelembapan": kelembapan,
        "lampu": lampu,
        "kipas": kipas,
        "camera": camera,
        "stepper": stepper,
        "suhu": suhu,
      };
}

class Esp32Cam {
  String? photo;

  Esp32Cam({
    this.photo,
  });

  factory Esp32Cam.fromJson(Map<String, dynamic> json) => Esp32Cam(
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "photo": photo,
      };
}
