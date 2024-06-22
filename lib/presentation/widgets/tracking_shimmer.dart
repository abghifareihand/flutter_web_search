import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TrackingShimmer extends StatelessWidget {
  const TrackingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          Container(
            width: 500,
            height: 40.0,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          Container(
            width: 500,
            height: 40.0,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          Container(
            width: 500,
            height: 40.0,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          Container(
            width: 500,
            height: 40.0,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          Container(
            width: 500,
            height: 40.0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
