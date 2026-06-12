import 'package:education_live_app/core/theme/colors/my_colors.dart';
import 'package:education_live_app/shared/extensions/animation_extensions.dart';
import 'package:education_live_app/shared/extensions/context_extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TextAndButtonText extends StatelessWidget {
  const TextAndButtonText({
    super.key,
    required this.title,
    required this.textButton, required this.onTap,
  });
  final String title;
  final String textButton;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: title,
        style: context.textStyle.copyWith(
          color: context.colors.textPrimary,
          fontSize: 16,
        ),
        children: [
          TextSpan(
            text: textButton,
            style: context.textStyle.copyWith(
              color: context.colors.secondary,
              fontSize: 16,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    ).animateBottomToTop(delay: 1900.ms, duration: 800.ms);
  }
}
