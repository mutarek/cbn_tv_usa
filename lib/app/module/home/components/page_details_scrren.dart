import 'package:cbn_tv_usa/app/module/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

class PageDetailsScreen extends StatefulWidget {
  const PageDetailsScreen({super.key});

  @override
  State<PageDetailsScreen> createState() => _PageDetailsScreenState();
}

class _PageDetailsScreenState extends State<PageDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, controller,child) {
        var data = controller.pageList[controller.pageIndex];
        return Scaffold(
          appBar: AppBar(
            title:  Text(data.title?.rendered ?? ""),
          ),
          body: ListView(
            padding: EdgeInsets.all(16),
            children: [
              HtmlWidget(data.content?.rendered ?? ""),
            ],
          ),
        );
      }
    );
  }
}
