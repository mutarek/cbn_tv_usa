import 'package:cbn_tv_usa/app/module/home/controller/home_controller.dart';
import 'package:cbn_tv_usa/app/module/home/screen/search_details_post.dart';
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
                      ):controller.searchModelList.isNotEmpty?
                  ListView.builder(
                    itemCount: controller.searchModelList.length,
                    itemBuilder: (_,index){
                      var data = controller.searchModelList[index];
                      return InkWell(
                        onTap: (){
                          controller.updateSearchIndex(index);
                          Navigator.push(context, MaterialPageRoute(builder: (builder)=> SearchDetailPost()));
                        },
                        child: Row(
                          children: [
                            Image.asset("asset/images/logo.png",height: 100,
                                width: 100),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(data.title?.rendered ?? ""),
                            )
                          ],
                        ),
                      );
                    },
                  ):Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.do_not_disturb_alt,size: 75),
                      SizedBox(height: 10),
                      Text("Search result not found",style: TextStyle(
                        fontSize: 25
                      ),),
                    ],
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
