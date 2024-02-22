import 'package:cached_network_image/cached_network_image.dart';
import 'package:cbn_tv_usa/app/module/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wordpress_content/wp_content.dart';
import 'package:provider/provider.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class DetailPostScreen extends StatelessWidget {
  const DetailPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Consumer<HomeController>(builder: (context, controller, child) {
      var data = controller.postModelList[controller.postIndex];
      return Scaffold(
        appBar: AppBar(
          title: Text(data.title?.rendered ?? ""),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                height: height * 0.2,
                imageUrl: (data.yoast_head_json?.ogImage[0].url ?? ""),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        colorFilter: const ColorFilter.mode(
                            Colors.red, BlendMode.colorBurn)),
                  ),
                ),
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              data.title?.rendered ?? "",
              style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            HtmlWidget(data.content?.rendered ?? "",customStylesBuilder: (element) {
              return {
                'font-size': '50px',
              };
            },),
          ],
        ),
      );
    });
  }
}
