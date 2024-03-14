import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'helper.dart';

class LiveTVScreen extends StatefulWidget {
  const LiveTVScreen({super.key});

  @override
  State<LiveTVScreen> createState() => _LiveTVScreenState();
}

class _LiveTVScreenState extends State<LiveTVScreen> {




  var loadingPercentage = 0;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  final String contentBase64 = base64Encode(const Utf8Encoder().convert(html));

  List<String> titles =[
    "জ্যাকসন হাইটসে শেফ’স মহলে তৈরী হচ্ছে বাহারী ইফতার",
    "'চট্টগ্রামের প্রথম জয় বাংলা কনসার্ট'",
    "যুক্তরাষ্ট্রের গণতন্ত্র স্বাধীনতা হুমকিতে, বললেন বাইডেন",
    "বিশ্বজুড়ে বেশ কয়েকটি দেশে বন্ধ ফেসবুক",
    "চট্টগ্রামে আগুনে পুড়লো ব্রাজিল থেকে আনা এস আলমের এক লাখ টন অপরিশোধিত চিনি",
    "নিউয়র্কে প্রাণহারানো দম্পতির সন্তানদের পাশে দাঁড়ানোর আহ্বান জানিয়ে 'GoFundMe' ক্যাম্পেইন"
  ];

  final List<YoutubePlayerController> _controllers = [
    'Y3jwvf_GibY',
    'VWPpFMY0sEs',
    '4Vu9VgVYWu0',
    'yGlEIEgqOco',
    'iRqXR7iy0H4',
    'UjOqgz3Iojg',
  ]
      .map<YoutubePlayerController>(
        (videoId) => YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
      ),
    ),
  )
      .toList();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          HtmlWidget(
            """
<iframe src="https://bradmax.com/client/embed-player/7cff169de3f966672f27976d1977eebca025271c_13416?mediaUrl=https%3A%2F%2Flive.cbntvusa.net%2Fhls%2Fcbntv%2Findex.m3u8&mediaUrl2=https%3A%2F%2Flive.cbntvusa.net%2Fhls%2Fcbntv%2Findex.m3u8&duration=734.097415" width="100%" height="400" frameBorder="0" style="width: 100%;" allow="autoplay; encrypted-media" allowfullscreen></iframe>
              """,
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Recent Video News",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16
                )),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: _controllers.length,
              itemBuilder: (_,index){
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  YoutubePlayer(
                  key: ObjectKey(_controllers[index]),
                  controller: _controllers[index],
                  actionsPadding: const EdgeInsets.only(left: 16.0),
                  bottomActions: [
                    CurrentPosition(),
                    const SizedBox(width: 10.0),
                    ProgressBar(isExpanded: true),
                    const SizedBox(width: 10.0),
                    RemainingDuration(),
                    FullScreenButton(),
                  ],
                ),
                      SizedBox(height: 10),
                      Text("${titles[index]}",style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16
                      )),
                      SizedBox(height: 10),
                    ],
                  ),
                );
              },
            ),
          )
          // Or you can use the video player directly
          ///EmbeddedVideoScreen(),
        ],
      ),
    );
  }
}
