import 'package:education_live_app/core/language/lang_keys.dart';
import 'package:education_live_app/core/theme/colors/my_colors.dart';
import 'package:education_live_app/shared/constants/app_images.dart';
import 'package:education_live_app/shared/extensions/animation_extensions.dart';
import 'package:education_live_app/shared/extensions/context_extensions.dart';
import 'package:education_live_app/shared/widgets/app_button.dart';
import 'package:education_live_app/shared/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoginWithGoogle extends StatelessWidget {
  const LoginWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: AppButton(
        onPressed: () {},
        suffixIcon: CustomImage(
          imageType: ImagesType.svg,
          color: context.colors.white,
          applySvgColor: true,
          imagePath: AppImages.google,
        ),
        textColor: context.colors.textPrimary,
        backgroundColor: context.colors.stroke,
        label: context.translate(LangKeys.loginWithGoogle),
      ),
    ).animateRightLeft(
        delay: 1700.ms,
  duration: 700.ms,
  isFromStart: false,
    );
  }
}