import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingSpinkit extends StatelessWidget {
  final Color color;
  const LoadingSpinkit({
    super.key, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SpinKitFadingCircle(
        size: 24,
        color: color,
      ),
    );
  }
}