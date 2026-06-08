import 'package:education_live_app/core/language/lang_keys.dart';
import 'package:education_live_app/core/theme/colors/my_colors.dart';
import 'package:education_live_app/shared/constants/app_images.dart';
import 'package:education_live_app/shared/extensions/animation_extensions.dart';
import 'package:education_live_app/shared/extensions/context_extensions.dart';
import 'package:education_live_app/shared/utils/spacing.dart';
import 'package:education_live_app/shared/widgets/app_button.dart';
import 'package:education_live_app/shared/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImage(
            imageType: ImagesType.asset,
            imagePath: AppImages.logoMark,
            width: 80,
            height: 80,
          ).animateBottomToTop(),

          verticalSpace(20),

          CustomImage(
            imageType: ImagesType.svg,
            imagePath: AppImages.logoApp,
            width: 160,
            height: 120,
          ).animateScaleNFadeHorizontal(),

          verticalSpace(12),

          Text(
            context.translate(LangKeys.welcomeTitle),
            style: context.titleLarge.copyWith(
              fontSize: 24,
              color: context.colors.black,
              fontWeight: FontWeight.bold,
            ),
          ).animateRightLeft(),

          verticalSpace(12),

          Text(
            context.translate(LangKeys.welcomeSubtitle),
            textAlign: TextAlign.center,
            style: context.bodyMedium.copyWith(
              fontSize: 16,
              color: context.colors.textSecondary,
              fontWeight: FontWeight.normal,
            ),
          ).animateRightLeft(isFromStart: false),

          verticalSpace(50),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: AppButton(
              backgroundColor: context.colors.primary,
              label: context.translate(LangKeys.getStarted),
              onPressed: () {},
            ),
          ).animateBottomToTop(),
        ],
      ),
    );
  }
}