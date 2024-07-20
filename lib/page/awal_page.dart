import 'package:flutter/material.dart';
import '../config/asset_apps.dart';
import '../config/color.dart';

class AwalPage extends StatefulWidget {
  const AwalPage({super.key});

  @override
  State<AwalPage> createState() => _AwalPageState();
}

class _AwalPageState extends State<AwalPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      const Center(
        child: Image(
          image: AssetImage(AppAsset.bgawal),
          width: 600,
          fit: BoxFit.fill,
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.only(top: 450.0),
      //   child: GestureDetector(
      //       onTap: () => Navigator.pushNamed(context, '/pilihan'),
      //       child: Container(
      //         height: 50,
      //         width: 150,
      //         decoration: BoxDecoration(
      //             color: ColorApp.yellowcolor,
      //             borderRadius: BorderRadius.circular(20),
      //             border: Border.all(color: Colors.white, width: 2)),
      //         child: Center(
      //           child: const Text("Mulai",
      //               style: TextStyle(
      //                   fontSize: 20,
      //                   fontWeight: FontWeight.bold,
      //                   color: Colors.black,
      //                   fontFamily: 'JacquesFrancois')),
      //         ),
      //       )),
      // ),
      Padding(
        padding: const EdgeInsets.only(top: 450.0),
        child: ElevatedButton(
          style: ButtonStyle(
            fixedSize: WidgetStateProperty.all<Size>(const Size(150, 50)),
            shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.white))),
            backgroundColor:
                WidgetStateProperty.all<Color>(ColorApp.yellowcolor),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/pilihan');
          },
          child: Center(
            child: const Text("Mulai",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'JacquesFrancois')),
          ),
        ),
      ),
    ]);
  }
}
