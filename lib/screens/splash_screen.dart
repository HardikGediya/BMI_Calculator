import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pr1_animator_app/utils/colors.dart';

import '../utils/textStyle.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: whiteColor,
              ),
              alignment: Alignment.center,
              child: Transform.scale(
                scale: 0.55,
                child: Image.asset(
                  'assets/icons/mainLogo.png',
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'BMI CALCULATOR',
              style: bigStyle,
            ),
            const Spacer(),
            const SizedBox(height: 100),
            CircularProgressIndicator(color: redColor,),
            const SizedBox(height: 15),
            Text(
              'Check your BMI',
              style: smallStyle,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
