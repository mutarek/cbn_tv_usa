import 'package:flutter/material.dart';

class VideoNewsScreen extends StatelessWidget {
  const VideoNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (_, index) {
                  return videoWidget(context, height);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget videoWidget(BuildContext context, double height) {
    return SizedBox(
      height: height * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              "আমাদের সংসদ ওয়েস্ট মিনিস্টার টাইপ পার্লামেন্ট, প্র্যাকটিস ভালো করে জানতে হবে : প্রধানমন্ত্রী ",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              )),
          const SizedBox(height: 5),
          ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "asset/images/youtube.jpg",
                height: height * 0.2,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              )),
          const SizedBox(height: 5),
          const Text("প্রকাশিত : ১৯:১৯, ২৮ জানুয়ারি ২০২৪")
        ],
      ),
    );
  }
}
