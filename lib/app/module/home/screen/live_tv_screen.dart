import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:webview_flutter/webview_flutter.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // You can embed the video using an iframe or any HTML tag
          HtmlWidget(
            """
<iframe src="https://bradmax.com/client/embed-player/7cff169de3f966672f27976d1977eebca025271c_13416?mediaUrl=https%3A%2F%2Flive.cbntvusa.net%2Fhls%2Fcbntv%2Findex.m3u8&mediaUrl2=https%3A%2F%2Flive.cbntvusa.net%2Fhls%2Fcbntv%2Findex.m3u8&duration=734.097415" width="100%" height="400" frameBorder="0" style="width: 100%;" allow="autoplay; encrypted-media" allowfullscreen></iframe>
              """,
          ),
          SizedBox(height: 20),
          // Or you can use the video player directly
          ///EmbeddedVideoScreen(),
        ],
      ),
    );
  }
}
