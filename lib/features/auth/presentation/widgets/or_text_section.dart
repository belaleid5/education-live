import 'package:education_live_app/core/language/lang_keys.dart';
import 'package:education_live_app/core/theme/colors/my_colors.dart';
import 'package:education_live_app/shared/extensions/animation_extensions.dart';
import 'package:education_live_app/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OrTextSection extends StatelessWidget {
  const OrTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(thickness: 1.5, color: context.colors.divider),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              context.translate(LangKeys.or),
              style: context.textStyle.copyWith(
                color: context.colors.divider,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            child: Divider(thickness: 1.5, color: context.colors.divider),
          ),
        ],
      ),
    ).animateScaleNFadeHorizontal(delay: 1300.ms, duration: 900.ms);
  }
}
