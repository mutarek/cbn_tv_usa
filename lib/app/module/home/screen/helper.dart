String iFrameUrl = "https://bradmax.com/client/embed-player/7cff169de3f966672f27976d1977eebca025271c_13416?mediaUrl=https%3A%2F%2Flive.cbntvusa.net%2Fhls%2Fcbntv%2Findex.m3u8&mediaUrl2=https%3A%2F%2Flive.cbntvusa.net%2Fhls%2Fcbntv%2Findex.m3u8&duration=734.097415";

String html = """<!DOCTYPE html>
          <html><head>
  <style>
  body {
  overflow: hidden;
  }
      .embed-youtube {
  position: relative;
  padding-bottom: 56.25%;
  padding-top: 0px;
  height: 0;
  overflow: hidden;
  }

      .embed-youtube iframe,
      .embed-youtube object,
      .embed-youtube embed {
  border: 0;
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  }
  </style>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  </head>
  <body bgcolor="#121212">
  <div class="embed-youtube">
  <iframe
  id="vjs_video_3_Youtube_api"
  style="width:100%;height:100%;top:0;left:0;position:absolute;"
  class="vjs-tech holds-the-iframe"
  frameborder="0"
  allowfullscreen="1"
  allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
  webkitallowfullscreen mozallowfullscreen allowfullscreen
  title="Live Tv"
  frameborder="0"
  src="https://bradmax.com/client/embed-player/7cff169de3f966672f27976d1977eebca025271c_13416?mediaUrl=https%3A%2F%2Flive.cbntvusa.net%2Fhls%2Fcbntv%2Findex.m3u8&mediaUrl2=https%3A%2F%2Flive.cbntvusa.net%2Fhls%2Fcbntv%2Findex.m3u8&duration=734.097415"
  ></iframe></div>
  </body>
  </html>
  """;