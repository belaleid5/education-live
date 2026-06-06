import 'package:education_live_app/shared/constants/app_images.dart';
import 'package:education_live_app/shared/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomImage(
          imageType: ImagesType.asset,
          imagePath: AppImages.emptyState,
        ),
      ),
    );
  }
}
