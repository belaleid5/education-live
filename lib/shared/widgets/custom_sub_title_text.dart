import 'package:education_live_app/core/theme/colors/my_colors.dart';
import 'package:education_live_app/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CustomSubtitleText extends StatelessWidget {
  const CustomSubtitleText({super.key, required this.subtitle});
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        textAlign: TextAlign.center,
        subtitle,
        style: context.textStyle.copyWith(
          fontSize: 15,
          color: context.colors.textSecondary,
        ),
      ),
    );
  }
}