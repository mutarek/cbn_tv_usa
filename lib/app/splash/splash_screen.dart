import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cbn_tv_usa/app/module/home/screen/home_screen.dart';
import 'package:cbn_tv_usa/app/splash/no_internet_screen.dart';
import 'package:cbn_tv_usa/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
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
                color: primaryColor,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  FadeAnimatedText('CBN TV USA'),
                ],
              ),
            ),
          ),
          // Row(
          //   mainAxisSize: MainAxisSize.min,
          //   children: <Widget>[
          //     const SizedBox(width: 20.0, height: 100.0),
          //     const Text(
          //       'To',
          //       style: TextStyle(fontSize: 43.0,color: Colors.white),
          //     ),
          //     const SizedBox(width: 20.0, height: 100.0),
          //     DefaultTextStyle(
          //       style: const TextStyle(
          //         fontSize: 40.0,
          //         fontFamily: 'Horizon',
          //         color: Colors.white
          //       ),
          //       child: AnimatedTextKit(
          //         animatedTexts: [
          //           RotateAnimatedText('Know'),
          //           RotateAnimatedText('See'),
          //           RotateAnimatedText('Know & See'),
          //         ],
          //       ),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }

  void navigate() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      // ignore: use_build_context_synchronously
      //Provider.of<SplashProvider>(context, listen: false).initializeVersion();
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (builder) => MainHomeScreen()),
                (route) => true);
      });
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (builder) => NoInternetScreen()),
              (route) => true);
      //Helper.toScreen(const NoInternetScreen());
      // Provider.of<SplashProvider>(context, listen: false).initializeVersion();
      // Future.delayed(const Duration(seconds: 5), () {
      //   if (Provider.of<AuthProvider>(context, listen: false).getUserToken().isEmpty) {
      //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const LoginScreen()), (route) => false);
      //   } else {
      //     Provider.of<NotificationProvider>(context, listen: false).check();
      //     Provider.of<AuthProvider>(context, listen: false).getUserInfo();
      //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const DashboardScreen()), (route) => false);
      //     Provider.of<ProfileProvider>(context, listen: false).initializeUserData();
      //   }
      // });
    }
  }
}
