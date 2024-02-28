import 'package:flutter/material.dart';

class CustomPopUp{
  static void showLoadingDialog
      (
      {
        required
        BuildContext
        context,
        String title = "প্রসেসিং চলছে...",
        String description = "অনুগ্রহ করে অপেক্ষা করুন, প্রসেসিং চলছে..."}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0XFFf1f2f3),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
//   contentPadding: const EdgeInsets.only(top: 10.0),
          insetPadding:
          const EdgeInsets.symmetric(horizontal: 25, vertical: 220),
/*  title: Center(
            child: Text(title,
                style: const TextStyle(
                    fontSize: 18,
                    color: ColorConfig.textColorPrimary,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis),
          ),*/
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 16,
                ),
                Center(
                  child: Text(title,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis),
                ),
                SizedBox(
                  height: (1.0),
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: (70),
                        width: (70),
                        child: Image.asset("asset/images/logo.png"),
                      ),
// child: Lottie.asset(AssetConfig.loadingAnimationAssetLottie),),
// child: Image.asset(AssetConfig.loadingAnimationAssetGif)),
                    ),

// SizedBox(height: getProportionateScreenHeight(15.0),),
// Text(message, style: const TextStyle(fontSize: 16, color: ColorConfig.textColorPrimary, fontWeight: FontWeight.w600),
//     textAlign: TextAlign.center, overflow: TextOverflow.ellipsis),

                    SizedBox(
                      height: (10.0),
                    ),
                    Text(description,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis),

                    SizedBox(
                      height: (15.0),
                    ),
// Padding(
//   padding: const EdgeInsets.all(20.0),
//   child: PrimaryButton(
//     btnText: StringConfig.goToNext,
//     onPressed: () {
//       onOkTapFunction();
//       Navigator.of(context).pop();
//     },
//   ),
// ),
// SizedBox(height: getProportionateScreenHeight(5.0),),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void hideLoadingDialog({required BuildContext context}) {
    Navigator.pop(context);
  }
}