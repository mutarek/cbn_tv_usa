import 'package:flutter/material.dart';

import '../../../utils/loading_shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (_, index) {
                return const SizedBox(height: 10);
              },
              itemCount: 10,
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: const LoaddingShimmer(
                          height: 150,
                          weight: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: const LoaddingShimmer(
                          height: 10,
                          weight: double.infinity,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 12, right: 12, top: 5),
                          child: LoaddingShimmer(
                            height: 10,
                            weight: 100,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
