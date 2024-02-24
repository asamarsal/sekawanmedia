import 'package:flutter/material.dart';
import 'package:animate_gradient/animate_gradient.dart';
import 'package:lottie/lottie.dart';

import 'homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToDashboard();
  }

  _navigateToDashboard() async {
    await Future.delayed(Duration(milliseconds: 4000));

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage())
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AnimateGradient(
              primaryColors: const [
                Color(0XFF105D38),
                Color(0XFF105D38),
                Color(0xFF2C8C6D),
              ],
              secondaryColors: const [
                Color(0xFF38BF93),
                Color(0XFF105D38),
                Color(0XFF105D38),
              ],
              child: Container(
                decoration: const BoxDecoration(),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Lottie.asset(
                            'assets/animations/splashscreenanimation.json',
                            width: 280,  // Ubah ukuran lebar sesuai kebutuhan
                            height: 280, // Ubah ukuran tinggi sesuai kebutuhan
                          ),
                          SizedBox(height: 20.0,),
                          const Text(
                            'Sekawan Media',
                            style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w500,),
                          ),
                          const Text(
                            'by Asa Salsabila Marsal',
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400,),
                          ),
                        ]
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
