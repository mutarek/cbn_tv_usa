import 'package:cbn_tv_usa/app/module/category/controller/category_controller.dart';
import 'package:cbn_tv_usa/app/module/home/controller/home_controller.dart';
import 'package:cbn_tv_usa/app/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'app/module/home/screen/home_screen.dart';
import 'app/utils/app_colors.dart';
import 'di_container.dart' as di;
import 'package:flutter/services.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<HomeController>()),
      ChangeNotifierProvider(create: (context) => di.sl<CategoryController>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
