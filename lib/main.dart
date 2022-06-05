import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pr1_animator_app/screens/bmi_home_screen.dart';
import 'package:pr1_animator_app/screens/result_screen.dart';
import 'package:pr1_animator_app/screens/splash_screen.dart';
import 'package:pr1_animator_app/utils/vars.dart';

void main(){

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash_screen',
      routes: {
        'splash_screen' : (context) => const SplashScreen(),
        '/' : (context) =>  BMIHomeScreen(),
        'result_screen' : (context) => const ResultScreen(),
      },
    ),
  );
}


