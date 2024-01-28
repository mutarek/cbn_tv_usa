import 'package:cbn_tv_usa/app/module/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageScreen extends StatelessWidget {
  const PageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeController>(context,listen: false).getAllPages();
    return  Consumer<HomeController>(
      builder: (context, controller,child) {
        var data = controller.pageList[controller.pageIndex];
        return Scaffold(
          appBar: AppBar(
            title: Text(data.title?.rendered ?? ""),
          ),
        );
      }
    );
  }
}
