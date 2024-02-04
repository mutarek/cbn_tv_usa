import 'package:cached_network_image/cached_network_image.dart';
import 'package:cbn_tv_usa/app/module/home/components/drawer_shimmer.dart';
import 'package:cbn_tv_usa/app/module/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Consumer<HomeController>(builder: (context, controller, child) {
      return SafeArea(
        child: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: SizedBox(
                    width: width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset("asset/images/logo.png",
                        height: height * 0.4,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: controller.isLoading
                      ? const Center(
                          child: DrawerShimmer(),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            itemCount: controller.pageList.length,
                            itemBuilder: (_, index) {
                              var page = controller.pageList[index];
                              return Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.2)),
                                    borderRadius: BorderRadius.circular(8)),
                                child: ListTile(
                                  title: Text((page.title?.rendered ?? "")
                                      .capitalizeFirst
                                      .toString()),
                                  trailing: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 16,
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                    controller.updatePageIndex(index);
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
