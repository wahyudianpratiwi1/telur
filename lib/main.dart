import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monitoring_apps/config/color.dart';
import 'package:monitoring_apps/firebase_options.dart';
import 'package:monitoring_apps/page/home_page.dart';
import 'package:monitoring_apps/page/intro_page.dart';
import 'package:monitoring_apps/page/slider_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const IntroPage(),
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          primaryColor: ColorApp.primary,
          colorScheme: const ColorScheme.light(
              primary: ColorApp.primary, secondary: ColorApp.secondary)),
      routes: {
        '/home': (context) => const HomePage(),
        '/slider': (context) => const SliderPage()
      },
    );
  }
}
