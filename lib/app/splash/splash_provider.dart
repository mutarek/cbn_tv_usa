import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class SplashProvider with ChangeNotifier {

  Future<bool> checkConnection(){
    return InternetConnectionChecker().hasConnection;
  }
}