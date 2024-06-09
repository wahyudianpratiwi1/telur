class Sensor {
  int? heater;
  double? kelembapan;
  int? lampu;
  int? kipas;
  int? camera;
  double? suhu;

  Sensor({
    this.heater,
    this.kelembapan,
    this.lampu,
    this.kipas,
    this.camera,
    this.suhu,
  });

  factory Sensor.fromJson(Map<String, dynamic> json) => Sensor(
      heater: json["heater"],
      kelembapan: json["kelembapan"]?.toDouble(),
      lampu: json["lampu"],
      kipas: json["kipas"],
      camera: json["camera"],
      suhu: json["suhu"]?.toDouble());

  Map<String, dynamic> toJson() => {
        "heater": heater,
        "kelembapan": kelembapan,
        "lampu": lampu,
        "kipas": kipas,
        "camera": camera,
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
