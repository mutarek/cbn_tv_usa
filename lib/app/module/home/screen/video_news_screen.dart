import 'package:cbn_tv_usa/app/module/home/screen/live_tv_screen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoNewsScreen extends StatefulWidget {
  const VideoNewsScreen({super.key});

  @override
  State<VideoNewsScreen> createState() => _VideoNewsScreenState();
}

class _VideoNewsScreenState extends State<VideoNewsScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the video player controller with your live streaming video URL
    _controller = VideoPlayerController.network(
        'https://www.youtube.com/watch?v=AcJXWj5k2SA');
    _controller.initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // return Scaffold(
    //   body: Padding(
    //     padding: const EdgeInsets.all(16),
    //     child: Column(
    //       children: [
    //         Expanded(
    //           child: ListView.builder(
    //             itemCount: 3,
    //             itemBuilder: (_, index) {
    //               return videoWidget(context, height);
    //             },
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text('Embedded Live Streaming Video'),
      ),
      body: LiveTVScreen()
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

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
