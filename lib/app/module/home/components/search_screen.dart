import 'package:cbn_tv_usa/app/module/home/controller/home_controller.dart';
import 'package:cbn_tv_usa/app/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, controller,child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Search Anythings"),
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          controller.searchFromList(value);
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: "",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)))),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: primaryColor)
                      ),
                      child: Row(
                        children: [
                          Text("Search"),
                          SizedBox(width: 5),
                          Icon(CupertinoIcons.search_circle,color: primaryColor,)
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: controller.isLoading?
                      Center(
                        child: CircularProgressIndicator(),
                      ):ListView.builder(
                    itemCount: 10,
                    itemBuilder: (_,index){
                      return ListTile();
                    },
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
