import 'package:cbn_tv_usa/app/module/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

class PageScreen extends StatelessWidget {
  const PageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeController>(context, listen: false).getAllPages();
    return Consumer<HomeController>(builder: (context, controller, child) {
      var data = controller.pageList[controller.pageIndex];
      return controller.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              body: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  HtmlWidget(data.content?.rendered ?? ""),
                ],
              ),
            );
    });
  }
}
