import 'package:cached_network_image/cached_network_image.dart';
import 'package:cbn_tv_usa/app/module/home/controller/home_controller.dart';
import 'package:cbn_tv_usa/app/module/home/screen/detail_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Consumer<HomeController>(builder: (context, controller, child) {
      return Scaffold(
        body: controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(16),
                child: ListView.builder(
                  itemCount: controller.postModelList.length,
                  itemBuilder: (_, index) {
                    var data = controller.postModelList[index];
                    return InkWell(
                      onTap: (){
                        controller.updatePostIndex(index);
                        Navigator.push(context, MaterialPageRoute(builder: (builder)=> DetailPostScreen()));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: CachedNetworkImage(
                                height: height * 0.2,
                                imageUrl:
                                (data.yoast_head_json?.ogImage[0].url ?? ""),
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                            colorFilter: const ColorFilter.mode(
                                                Colors.red, BlendMode.colorBurn)),
                                      ),
                                    ),
                                placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(data.title?.rendered ?? "",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                )),
                            const SizedBox(height: 5),
                            Text(
                                "প্রকাশিত : ${controller.enDaytoBdDay(data.date?.day ?? 0)} ${controller.enMonthtoBdMonth(data.date?.month ?? 1)}")
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
      );
    });
  }
}
