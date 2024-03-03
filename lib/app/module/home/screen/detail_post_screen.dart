import 'package:cached_network_image/cached_network_image.dart';
import 'package:cbn_tv_usa/app/module/home/controller/home_controller.dart';
import 'package:custom_social_share/custom_social_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wordpress_content/wp_content.dart';
import 'package:provider/provider.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../utils/app_colors.dart';

class DetailPostScreen extends StatelessWidget {
  const DetailPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Consumer<HomeController>(builder: (context, controller, child) {
      var data = controller.postModelList[controller.postIndex];
      return Scaffold(
        appBar: AppBar(
          elevation: 10,
          title: Text(data.title?.rendered ?? ""),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            // Container(
            //   margin: EdgeInsets.all(5),
            //   height: height * 0.1,
            //   decoration: BoxDecoration(
            //       border: Border.all(color: primaryColor2),
            //       borderRadius: BorderRadius.circular(8)
            //   ),
            //   child: Center(child: Text("Custom Ads Box")),
            // ),
            SizedBox(height: 10),
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
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(height: 10),
            Text(
                "প্রকাশিত : ${data.date?.day ?? 0} ${controller.enMonthtoBdMonth(data.date?.month ?? 1)} ${controller.enMonthtoBdMonth(data.date?.year ?? 1)}"),
            const SizedBox(height: 10),
            Container(
              margin: EdgeInsets.all(5),
              height: height * 0.1,
              decoration: BoxDecoration(
                  border: Border.all(color: primaryColor2),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Center(child: Text("Custom Ads Box")),
            ),
            const SizedBox(height: 10),
            Text(
              data.title?.rendered ?? "",
              style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            HtmlWidget(data.content?.rendered ?? "",customStylesBuilder: (element) {
              return {
                "font-family": "Shurjo",
                'font-size': '18px',
                'font-weight': '400',
                'font-display': 'swap',
                'url':"https://assets.prothomalo.com/prothomalo/assets/ShurjoWeb_700_v2-ef9e058ccc3a98d85030.woff2"
              };
            },),
            // Container(
            //   margin: EdgeInsets.all(5),
            //   height: height * 0.1,
            //   decoration: BoxDecoration(
            //       border: Border.all(color: primaryColor2),
            //       borderRadius: BorderRadius.circular(8)
            //   ),
            //   child: Center(child: Text("Custom Ads Box")),
            // ),
            Text("Share this post",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600)),
            SizedBox(height: 15),
            InkWell(
              onTap: ()async{
                 await CustomSocialShare().getInstalledAppsForShare();
              },
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius:25,
                          child: Image.asset("asset/icons/imo_icon.png")
                        ),
                        SizedBox(height: 5),
                        Text("Imo",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),)
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                            radius:25,
                            child: Image.asset("asset/icons/whatsapp_icon.png")
                        ),
                        SizedBox(height: 5),
                        Text("Whatsapp",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),)
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                            radius:25,
                            child: Image.asset("asset/icons/option.png")
                        ),
                        SizedBox(height: 5),
                        Text("Messenger",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),)
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                            radius:25,
                            child: Image.asset("asset/icons/others_share.png")
                        ),
                        SizedBox(height: 5),
                        Text("Others",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),)
                      ],
                    ),

                  ],
                )),
            SizedBox(height: 30),
          ],
        ),
      );
    });
  }
}
