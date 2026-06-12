import 'package:education_live_app/core/language/lang_keys.dart';
import 'package:education_live_app/core/theme/colors/my_colors.dart';
import 'package:education_live_app/shared/extensions/animation_extensions.dart';
import 'package:education_live_app/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        context.translate(LangKeys.forgotPassword),
        style: context.textStyle.copyWith(
          color: context.colors.secondary,
          fontSize: 16,
        ),
      ),
    ).animateRightLeft(
     delay: 110.ms,
      duration: 700.ms,
      isFromStart: false,
    );
  }
}