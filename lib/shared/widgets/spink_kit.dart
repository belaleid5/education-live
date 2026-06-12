
import 'package:education_live_app/core/theme/colors/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

enum LoadingType {
  foldingCube,
  fadingFour,
  circle,
  threeBounce,
}

class SpinKitWidget extends StatelessWidget {
  final Color? color;
  final double size;
  final LoadingType type;

  const SpinKitWidget({
    super.key,
    this.color,
    this.size = 30,
    this.type = LoadingType.foldingCube,
  });

  @override
  Widget build(BuildContext context) {
    final loadingColor = color ?? context.colors.primary;

    Widget loadingWidget;

    switch (type) {
      case LoadingType.foldingCube:
        loadingWidget = SpinKitFoldingCube(size: size, color: loadingColor);
        break;
      case LoadingType.fadingFour:
        loadingWidget = SpinKitFadingFour(size: size, color: loadingColor);
        break;
      case LoadingType.circle:
        loadingWidget = SpinKitCircle(size: size, color: loadingColor);
        break;
      case LoadingType.threeBounce:
        loadingWidget = SpinKitThreeBounce(size: size, color: loadingColor);
        break;
    }

    return Center(child: loadingWidget);
  }
}