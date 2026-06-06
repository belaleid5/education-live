import 'package:education_live_app/core/theme/colors/my_colors.dart';
import 'package:education_live_app/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.actionText,
    this.icon,
  });
  final String title, actionText;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.textStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (actionText.isNotEmpty)
            Text(
              actionText,
              style: context.textStyle.copyWith(
                fontSize: 14,
                color: context.colors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }
}
