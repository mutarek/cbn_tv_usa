import 'package:cbn_tv_usa/app/module/category/screen/category_screen.dart';
import 'package:cbn_tv_usa/app/module/home/components/custom_drawer.dart';
import 'package:cbn_tv_usa/app/module/home/controller/home_controller.dart';
import 'package:cbn_tv_usa/app/module/home/screen/secondpage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_colors.dart';
import 'home_page.dart';

class MainHomeScreen extends StatelessWidget {
  MainHomeScreen({super.key});

  var PagesAll = [
    const PageScreen(),
    HomePage(),
    CategoryScreen(),
    PageScreen()
  ];

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeController>(context, listen: false).getAllPosts(true);
    return Consumer<HomeController>
      (builder: (context, controller, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("CBN Tv usa"),
          centerTitle: true,
        ),
        drawer: const CustomDrawer(),
        body: PagesAll[controller.page],
        bottomNavigationBar: CurvedNavigationBar(
          key: controller.bottomNavigationKey,
          height: 50,
          index: controller.currentIndex,
          items: <Widget>[
            bottomItem(
                title: "TV",
                index: 0,
                icon: Icons.live_tv,
                controller: controller),
            bottomItem(
                title: "Home",
                index: 1,
                icon: Icons.home,
                controller: controller),
            bottomItem(
                title: "Live",
                index: 2,
                icon: Icons.face,
                controller: controller),
            bottomItem(
                title: "Video",
                index: 3,
                icon: Icons.video_call,
                controller: controller),

          ],
          color: kIConColor,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            controller.updateCurrentIndex(index);
          },
          letIndexChange: (index) => true,
        ),
      );
    });
  }

  Widget bottomItem({required int index,
    required String title,
    required IconData icon,
    required HomeController controller}) {
    if (index == controller.page) {
      return Icon(
        icon,
        size: 26,
        color: Colors.red,
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 22,
              color: Colors.white,
            ),
            const SizedBox(height: 5),
          ],
        ),
      );
    }
  }
}
