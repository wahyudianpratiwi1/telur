import 'package:flutter/material.dart';

import 'package:monitoring_apps/config/asset_apps.dart';

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
        .whenComplete(() => Navigator.pushNamed(context, '/awal'));
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
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.yellow], // Warna gradasi
                    begin: Alignment.topLeft, // Titik awal gradasi
                    end: Alignment.bottomRight, // Titik akhir gradasi
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    AppAsset.icon,
                    height: 189,
                    width: 134,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
