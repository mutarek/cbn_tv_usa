import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cbn_tv_usa/app/module/home/screen/home_screen.dart';
import 'package:cbn_tv_usa/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () async {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (builder) => MainHomeScreen()),
          (route) => true);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primaryColor.withOpacity(0.5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "asset/images/logo.png",
            // width: SizeConfig.screenWidth,
            height: screenHeight * 0.15,
            width: double.infinity,
            // fit: BoxFit.fitHeight,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  FadeAnimatedText('CBN'),
                  FadeAnimatedText('CBN TV'),
                  FadeAnimatedText('CBN TV USA'),
                ],
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(width: 20.0, height: 100.0),
              const Text(
                'To',
                style: TextStyle(fontSize: 43.0,color: Colors.white),
              ),
              const SizedBox(width: 20.0, height: 100.0),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Horizon',
                  color: Colors.white
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText('Know'),
                    RotateAnimatedText('See'),
                    RotateAnimatedText('Know & See'),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
