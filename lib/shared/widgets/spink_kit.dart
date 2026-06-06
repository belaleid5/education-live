// shared/widgets/loading_widget.dart

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinKitWidget extends StatelessWidget {
  final Color? color;
  final double size;

  const SpinKitWidget({
    super.key,
    this.color,
    this.size = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingFour(
        size: size,
        color: color ?? Theme.of(context).colorScheme.primary,
      ),
    );
  }
}