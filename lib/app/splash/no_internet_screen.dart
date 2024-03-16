import 'package:cbn_tv_usa/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("asset/icons/no_internet.png",
              height: 100,
              width: 100),
              SizedBox(height: 20),
              Text("Ops We Can't Work Without Internet",style: TextStyle(
                fontSize: 16,
                color: Colors.red,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 40),
              InkWell(
                onTap: (){
                  SystemNavigator.pop();
                },
                child: Container(
                  width: 300,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: primaryColor
                  ),
                  child: Center(child: Text("Exit",style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18
                  ),)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
