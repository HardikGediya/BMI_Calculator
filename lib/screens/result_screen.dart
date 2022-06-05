import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/textStyle.dart';
import '../utils/vars.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackColor,
      appBar: AppBar(
        title: Text(
          'Your BMI Result',
          style: bigStyle,
        ),
        backgroundColor: mainBackColor,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: Text(
                  category,
                  style: catagorieStyle,
                ),
              ),
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: Text(
                  BMI.toStringAsFixed(2),
                  style: BMIStyle,
                ),
              ),
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: SizedBox(
                  height: 100,
                  child: Text(text,style: pStyle,textAlign: TextAlign.center),
                ),
              ),
              const SizedBox(height: 180),
              GestureDetector(
                onTap: () {
                  setState(() {});
                  Navigator.of(context).pushReplacementNamed('/');
                },
                child: Container(
                  height: 60,
                  color: redColor,
                  alignment: Alignment.center,
                  child: Text(
                    'RE-CALCULATE',
                    style: simStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
