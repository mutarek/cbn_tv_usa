import 'package:cbn_tv_usa/app/module/home/controller/home_controller.dart';
import 'package:custom_social_share/custom_social_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

class SearchDetailPost extends StatelessWidget {
  const SearchDetailPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, controller,child) {
        var data = controller.searchModelList[controller.searchPostIndex];
        return Scaffold(
          appBar: AppBar(
            title: Text(data.title?.rendered ?? ""),
          ),
          body: ListView(
            padding: EdgeInsets.all(16),
            children: [
              HtmlWidget(data.content?.rendered ?? "",customStylesBuilder: (element) {
                return {
                  "font-family": "Shurjo",
                  'font-size': '18px',
                  'font-weight': '400',
                  'font-display': 'swap',
                  'url':"https://assets.prothomalo.com/prothomalo/assets/ShurjoWeb_700_v2-ef9e058ccc3a98d85030.woff2"
                };
              },),
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
      }
    );
  }
}
