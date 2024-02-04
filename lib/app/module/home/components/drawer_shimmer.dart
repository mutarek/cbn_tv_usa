import 'package:cbn_tv_usa/app/utils/loading_shimmer.dart';
import 'package:flutter/material.dart';

class DrawerShimmer extends StatelessWidget {
  const DrawerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (_,index){
            return Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(8)),
              child: ListTile(
                title: LoaddingShimmer(
                  height: 10,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 16,
                ),
                onTap: () {
                  Navigator.pop(context);
                  //controller.updatePageIndex(index);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
