import 'package:flutter/material.dart';
import 'package:monitoring_apps/page/home_page.dart';
import 'package:monitoring_apps/page/home_page1.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: PageView(
            children: const [
              Center(
                child: HomePage(),
              ),
              Center(
                child: HomePage1(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
