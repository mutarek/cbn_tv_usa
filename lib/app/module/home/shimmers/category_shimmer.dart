import 'package:cbn_tv_usa/app/utils/loading_shimmer.dart';
import 'package:flutter/material.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 2 / 1.1),
            itemCount: 20,
            itemBuilder: (_,index){
              return Stack(
                children: [
                  InkWell(
                    onTap: (){

                    },
                    child: Card(
                      elevation: 0.8,
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 5, right: 5),
                        child: const Center(
                          child: LoaddingShimmer(
                           height: 7,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 10,
                    right: 10,
                    child: CircleAvatar(
                      radius: 15,
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: LoaddingShimmer(
                         height: 8,
                        ),
                      ),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
