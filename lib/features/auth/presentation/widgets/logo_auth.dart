import 'package:education_live_app/shared/constants/app_images.dart';
import 'package:education_live_app/shared/extensions/animation_extensions.dart';
import 'package:education_live_app/shared/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomImage(
      boxFit: BoxFit.contain,
      imageType: ImagesType.png,
      imagePath: AppImages.logoMark,
      height: 100,
      width: 100,
    ).animateScaleNFadeHorizontal(
       delay: 200.ms,
      duration: 900.ms,
    );
  }
}