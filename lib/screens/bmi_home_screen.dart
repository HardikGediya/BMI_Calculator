import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pr1_animator_app/utils/textStyle.dart';

import '../utils/colors.dart';
import '../utils/vars.dart';


class BMIHomeScreen extends StatefulWidget {
  @override
  _BMIHomeScreenState createState() => _BMIHomeScreenState();
}

class _BMIHomeScreenState extends State<BMIHomeScreen>  with TickerProviderStateMixin{
  late FToast fToast;
  double sliderVal = 50;
  int weight = 0;
  int age = 0;

  bool maleSelected = true;
  bool femaleSelected = false;

  late final AnimationController animationController;

  GlobalKey globalKey = GlobalKey();

  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color: Colors.black,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children:  [
        Text("Wrong Input",style: TextStyle(color: whiteColor,fontWeight: FontWeight.w500),),
      ],
    ),
  );

  Widget toast2 = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color: Colors.black,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children:  [
        Text("Select All Input",style: TextStyle(color: whiteColor,fontWeight: FontWeight.w500),),
      ],
    ),
  );

  _showToast() {
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 2),
    );
  }

  _showToast2() {
    fToast.showToast(
      child: toast2,
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 2),
    );
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
      lowerBound: -1,
      upperBound: 0,
    )..forward();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: mainBackColor,
      appBar: AppBar(
        backgroundColor: mainBackColor,
        title: Text(
          'BMI CALCULATOR',
          style: bigStyle,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            icon: Icon(
              Icons.refresh,
              color: whiteColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: SizedBox(
                height: 170,
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            maleSelected = !maleSelected;
                            if (maleSelected == true) {
                              femaleSelected = false;
                            }
                          });
                        },
                        child: AnimatedBuilder(
                          animation: animationController,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(
                                  animationController.value * 150, 0),
                              child: child,
                            );
                          },
                          child: Expanded(
                            child: Container(
                              width: 170,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: boxColor,
                              ),
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: Image.asset(
                                        'assets/icons/male-gender.png',
                                        color: (maleSelected)
                                            ? redColor
                                            : blueLightColor),
                                  ),
                                  Text(
                                    'MALE',
                                    style: subStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            femaleSelected = !femaleSelected;
                            if (femaleSelected == true) {
                              maleSelected = false;
                            }
                          });
                        },
                        child: Expanded(
                          child: AnimatedBuilder(
                            animation: animationController,
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(
                                    animationController.value * -150, 0),
                                child: child,
                              );
                            },
                            child: Container(
                              width: 170,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: boxColor,
                              ),
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: Image.asset(
                                        'assets/icons/femenine.png',
                                        color: (femaleSelected)
                                            ? redColor
                                            : blueLightColor),
                                  ),
                                  Text(
                                    'FEMALE',
                                    style: subStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
              child: AnimatedBuilder(
                animation: animationController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(animationController.value * -200, 0),
                    child: child,
                  );
                },
                child: Expanded(
                  child: Container(
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: boxColor,
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 10),
                    child: Column(
                      children: [
                        Text(
                          'HEIGHT',
                          style: subStyle,
                        ),
                        const SizedBox(height: 7),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              sliderVal.toString().split('.')[0],
                              style: boldBigStyle,
                            ),
                            Text(
                              'cm',
                              style: subStyle,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Slider(
                          value: sliderVal,
                          activeColor: redColor,
                          inactiveColor: blueLightColor,
                          min: 50,
                          max: 400,
                          onChanged: (sliderValue) {
                            setState(() {
                              sliderVal = sliderValue;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
              child: SizedBox(
                height: 190,
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedBuilder(
                        animation: animationController,
                        builder: (context, child) {
                          return Transform.translate(
                            offset:
                            Offset(animationController.value * 150, 0),
                            child: child,
                          );
                        },
                        child: Expanded(
                          child: Container(
                            width: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: boxColor,
                            ),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'WEIGHT',
                                  style: subStyle,
                                ),
                                const SizedBox(height: 7),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '$weight',
                                      style: boldBigStyle,
                                    ),
                                    Text(
                                      'kg',
                                      style: subStyle,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: mainBackColor
                                              .withOpacity(0.7),
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: blueLightColor,
                                              offset: const Offset(0, 0),
                                              blurRadius: 3,
                                              spreadRadius: 1,
                                            ),
                                          ],
                                        ),
                                        height: 50,
                                        width: 50,
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.add,
                                          color: whiteColor,
                                          size: 35,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (weight > 0) {
                                            weight--;
                                          }
                                          if(weight == 0){
                                            _showToast();
                                          }

                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: mainBackColor
                                              .withOpacity(0.7),
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: blueLightColor,
                                              offset: const Offset(0, 0),
                                              blurRadius: 3,
                                              spreadRadius: 1,
                                            ),
                                          ],
                                        ),
                                        height: 50,
                                        width: 50,
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.remove,
                                          color: whiteColor,
                                          size: 35,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      AnimatedBuilder(
                        animation: animationController,
                        builder: (context, child) {
                          return Transform.translate(
                            offset:
                            Offset(animationController.value * -150, 0),
                            child: child,
                          );
                        },
                        child: Expanded(
                          child: Container(
                            width: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: boxColor,
                            ),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'AGE',
                                  style: subStyle,
                                ),
                                const SizedBox(height: 7),
                                Text(
                                  '$age',
                                  style: boldBigStyle,
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: mainBackColor
                                              .withOpacity(0.7),
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: blueLightColor,
                                              offset: const Offset(0, 0),
                                              blurRadius: 3,
                                              spreadRadius: 1,
                                            ),
                                          ],
                                        ),
                                        height: 50,
                                        width: 50,
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.add,
                                          color: whiteColor,
                                          size: 35,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (age > 0) {
                                            age--;
                                          }
                                          if(weight == 0){
                                            _showToast();
                                          }
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: mainBackColor
                                              .withOpacity(0.7),
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: blueLightColor,
                                              offset: const Offset(0, 0),
                                              blurRadius: 3,
                                              spreadRadius: 1,
                                            ),
                                          ],
                                        ),
                                        height: 50,
                                        width: 50,
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.remove,
                                          color: whiteColor,
                                          size: 35,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 52),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    double height = sliderVal / 100;

                    BMI = weight / (height * height);

                    if (BMI < 16) {
                      category = 'SEVERE THINNESS';
                      text = 'You have a severe thinness body weight';
                    } else if (BMI >= 16 && BMI < 17) {
                      category = 'MODERATE THINNESS';
                      text = 'You have a moderate thinness body weight';
                    } else if (BMI >= 16 && BMI < 17) {
                      category = 'MILD THINNESS';
                      text = 'You have a mild thinness body weight';
                    } else if (BMI >= 16 && BMI < 17) {
                      category = 'NORMAL THINNESS';
                      text = 'You have a normal body weight Good Job';
                    } else if (BMI >= 16 && BMI < 17) {
                      category = 'OVER WEIGHT';
                      text = 'You have a over body weight Good Job';
                    } else if (BMI >= 16 && BMI < 17) {
                      category = 'OBESE CLASS I';
                      text = 'You have a obese class I body weight';
                    } else if (BMI >= 16 && BMI < 17) {
                      category = 'OBESE CLASS II';
                      text = 'You have a obese class II body weight';
                    } else if (BMI >= 16 && BMI < 17) {
                      category = 'OBESE CLASS III';
                      text = 'You have a obese class III body weight';
                    }
                  });

                  if (weight > 0 &&
                      age > 0 &&
                      (maleSelected == true || femaleSelected == true)) {
                    Navigator.of(context).pushReplacementNamed('result_screen');
                  } else {
                    _showToast2();
                  }
                },
                child: Container(
                  height: 60,
                  color: redColor,
                  alignment: Alignment.center,
                  child: Text(
                    'CALCULATE YOUR BMI',
                    style: simStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}