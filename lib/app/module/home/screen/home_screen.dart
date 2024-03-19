import 'package:cbn_tv_usa/app/module/category/screen/category_screen.dart';
import 'package:cbn_tv_usa/app/module/home/components/search_screen.dart';
import 'package:cbn_tv_usa/app/module/home/controller/home_controller.dart';
import 'package:cbn_tv_usa/app/module/home/screen/secondpage.dart';
import 'package:cbn_tv_usa/app/module/home/screen/test_patment.dart';
import 'package:cbn_tv_usa/app/splash/no_internet_screen.dart';
import 'package:cbn_tv_usa/app/splash/splash_provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_colors.dart';
import '../components/customize_drawer.dart';
import 'home_page.dart';
import 'live_tv_screen.dart';

class MainHomeScreen extends StatefulWidget {
  MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  var pagesAll = [
    //TestPaymentScreen(),
    const LiveTVScreen(),
    const HomePage(),
    const CategoryScreen(),
    const PageScreen()
  ];

  @override
  void initState() {
    Provider.of<HomeController>(context, listen: false).getAllPosts(true);
    Provider.of<SplashProvider>(context, listen: false).checkConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Consumer2<HomeController, SplashProvider>(builder: (context, controller,splash, child) {
      return splash.checkConnection() == true ?
      NoInternetScreen():Scaffold(
        appBar: AppBar(
          elevation: 1.5,
          title: Image.asset("asset/images/logo.png",height: height * 0.06,),
          centerTitle: true,
          iconTheme: const IconThemeData(color: primaryColor),
          actions: [
            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=> SearchScreen()));
                },
                child: Icon(CupertinoIcons.search)),
            SizedBox(width: 15)
          ],
        ),
        drawer: const CustomizeDrawer(),
        body: pagesAll[controller.page],
        bottomNavigationBar: CurvedNavigationBar(
          key: controller.bottomNavigationKey,
          height: 50,
          index: controller.currentIndex,
          items: <Widget>[
            bottomItem(
                title: "Video",
                index: 0,
                icon: "asset/images/video.png",
                controller: controller),
            bottomItem(
                title: "Home",
                index: 1,
                icon: "asset/images/home.png",
                controller: controller),
            bottomItem(
                title: "Category",
                index: 2,
                icon: "asset/images/categories.png",
                controller: controller),
            bottomItem(
                title: "Profile",
                index: 3,
                icon: "asset/images/user.png",
                controller: controller),
          ],
          color: Colors.transparent,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeOutSine,
          //animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            controller.updateCurrentIndex(index);
          },
          letIndexChange: (index) => true,
        ),
      );
    });
  }

  Widget bottomItem(
      {required int index,
      required String title,
      required String icon,
      required HomeController controller}) {
    if (index == controller.page) {
      return CircleAvatar(
        child: Image.asset(
          icon,
          height: 22,
          color: primaryColor,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: 22,
              color: Colors.grey,
            ),
            const SizedBox(height: 5),
          ],
        ),
      );
    }
  }
}
