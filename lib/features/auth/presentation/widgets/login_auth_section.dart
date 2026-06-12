import 'package:education_live_app/core/language/lang_keys.dart';
import 'package:education_live_app/core/theme/colors/my_colors.dart';
import 'package:education_live_app/shared/extensions/animation_extensions.dart';
import 'package:education_live_app/shared/extensions/context_extensions.dart';
import 'package:education_live_app/shared/utils/spacing.dart';
import 'package:education_live_app/shared/widgets/adabtive_text_form_field.dart';
import 'package:education_live_app/shared/widgets/app_button.dart';
import 'package:education_live_app/shared/widgets/custom_form_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoginAuthSection extends StatelessWidget {
  const LoginAuthSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          AdaptiveInputField(
            context: context,
            filedColor: context.colors.fieldBackground,
            hintText: context.translate(LangKeys.emailAddress),
            textAlign: TextAlign.end,
          ).animateBottomToTop(delay:  400.ms, duration: 800.ms),

          verticalSpace(16),

          CustomTextFormPassword(
            hintText: context.translate(LangKeys.password),
            controller: TextEditingController(),
            isConfirmPassword: true,
          ).animateBottomToTop(delay: 600.ms, duration: 800.ms),

          verticalSpace(24),

          AppButton(
            backgroundColor: context.colors.primary,
            label: context.translate(LangKeys.login),
            onPressed: () {},
          ).animateScaleNFadeHorizontal(delay: 900.ms, duration: 800.ms),
        ],
      ),
    );
  }
}