
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoaddingShimmer extends StatelessWidget {
  const LoaddingShimmer({
    Key? key,  this.height, this.weight, this.borderRadius = 0,this.marginRight = 0,
    // this.isRounded = false
  }) : super(key: key);

  final double? height, weight, borderRadius, marginRight;
  // final bool? isRounded;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: weight,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.white,
        child:  Container(
          margin:  EdgeInsets.only(right: marginRight!),
          padding: const EdgeInsets.all(8),
          height: height,
          width: weight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius!),
            color: Colors.white,
            // shape: isRounded == true? BoxShape.circle: BoxShape.rectangle
          ),
        ),
      ),

    );
  }
}