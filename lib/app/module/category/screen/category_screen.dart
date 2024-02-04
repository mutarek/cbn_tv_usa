import 'package:cbn_tv_usa/app/module/category/controller/category_controller.dart';
import 'package:cbn_tv_usa/app/module/home/controller/home_controller.dart';
import 'package:cbn_tv_usa/app/module/home/screen/home_page.dart';
import 'package:cbn_tv_usa/app/module/home/shimmers/category_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeController>(context,listen: false).getAllCategories();
    return Consumer<HomeController>(builder: (context, controller, child) {
      return Scaffold(
        body: controller.isLoading
            ? const Center(
                child: CategoryShimmer(),
              )
            : Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 2 / 1.1),
                  itemCount: controller.categoryList.length,
                  itemBuilder: (_, index) {
                    var data = controller.categoryList[index];
                    return Stack(
                      children: [
                        InkWell(
                          onTap: (){
                            controller.updateCategoriesWisePost(data.id);
                          },
                          child: Card(
                            elevation: 0.8,
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 5, right: 5),
                              child: Center(
                                child: Text(
                                  data.name ?? "",
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: CircleAvatar(
                            radius: 15,
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: Text(
                                "${data.count}",
                                style: const TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
      );
    });
  }
}
