import 'package:cbn_tv_usa/app/module/home/components/page_details_scrren.dart';
import 'package:cbn_tv_usa/app/module/home/controller/home_controller.dart';
import 'package:cbn_tv_usa/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:provider/provider.dart';

import 'drawer_shimmer.dart';

class CustomizeDrawer extends StatefulWidget {
  const CustomizeDrawer({super.key});

  @override
  State<CustomizeDrawer> createState() => _CustomizeDrawerState();
}

class _CustomizeDrawerState extends State<CustomizeDrawer> {

  @override
  void initState() {
    Provider.of<HomeController>(context,listen: false).getAllPages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, controller,child) {
        return Container(
          width: MediaQuery.of(context).size.width / 1.25,
          child: Drawer(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: SizedBox(
                      height: 100,
                      width: MediaQuery.of(context).size.width/2,
                      child: Image.asset(
                        "asset/images/logo.png",
                        fit: BoxFit.contain,
                      )),
                ),
                Expanded(
                  child: controller.isLoading
                      ? const Center(
                    child: DrawerShimmer(),
                  )
                      : Padding(
                    padding: const EdgeInsets.only(left: 8,right: 8),
                    child: ListView.builder(
                      itemCount: controller.pageList.length,
                      itemBuilder: (_, index) {
                        var page = controller.pageList[index];
                        return Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
                            child: ListTile(
                              title: Text((page.title?.rendered ?? "")
                                  .capitalizeFirst
                                  .toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  fontFamily: "Poppins"
                                ),),
                              trailing: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 16,
                              ),
                              onTap: () {
                                controller.updatePageIndex(index);
                                Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(builder: (builder)=> PageDetailsScreen()));
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: const Center(
                      child: Text(
                        'v1.0.1',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 20,
                          color: primaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
