import 'package:education_live_app/core/language/lang_keys.dart';
import 'package:education_live_app/core/theme/colors/my_colors.dart';
import 'package:education_live_app/shared/constants/app_images.dart';
import 'package:education_live_app/shared/extensions/context_extensions.dart';
import 'package:education_live_app/shared/utils/spacing.dart';
import 'package:education_live_app/shared/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class NoNetwork extends StatelessWidget {
  const NoNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImage(
              imageType: ImagesType.svg,
              imagePath: AppImages.noNetwork,
            ),
            verticalSpace(20),
            Text(
              context.translate(LangKeys.noNetwork),
              style: context.titleMedium.copyWith(
                color: context.colors.textPrimary,
              ),
            ),
            verticalSpace(10),
            Text(
              context.translate(LangKeys.noNetworkMessage),
              style: context.bodyMedium.copyWith(
                color: context.colors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
