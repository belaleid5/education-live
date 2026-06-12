import 'package:education_live_app/core/language/lang_keys.dart';
import 'package:education_live_app/core/theme/colors/my_colors.dart';
import 'package:education_live_app/shared/extensions/animation_extensions.dart';
import 'package:education_live_app/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TermConditionWidget extends StatelessWidget {
  const TermConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: context.translate(LangKeys.agreeToTermsPrefix),
        style: context.textStyle.copyWith(color: context.colors.textSecondary),
        children: [
          TextSpan(
            text: context.translate(LangKeys.termsOfService),
            style: context.textStyle.copyWith(color: context.colors.secondary),
          ),
          TextSpan(
            text: "\n${context.translate(LangKeys.and)} ",
            style: context.textStyle.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          TextSpan(
            text: " ${context.translate(LangKeys.privacyPolicy)}",
            style: context.textStyle.copyWith(color: context.colors.secondary),
          ),
        ],
      ),
    ).animateBottomToTop(
      delay: 1900.ms,
      duration: 800.ms,
    );
  }
}