import 'package:flutter/material.dart';

import 'package:monitoring_apps/config/asset_apps.dart';

import 'package:monitoring_apps/config/color.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller
        .forward()
        .whenComplete(() => Navigator.pushNamed(context, '/slider'));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Opacity(
              opacity: _animation.value,
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
                    Container(
                      color: ColorApp.bg1,
                      height: 167,
                      width: 287,
                      child: const Center(
                          child: Text(
                        "APLIKASI MONITORING \n BERBASIS ANDROID",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Text("By: Salsa & Azrah",
                          style: TextStyle(
                              fontSize: 16, fontStyle: FontStyle.italic)),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
