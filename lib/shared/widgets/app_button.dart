import 'package:education_live_app/core/theme/colors/my_colors.dart';
import 'package:education_live_app/shared/utils/spacing.dart';
import 'package:flutter/material.dart';

enum AppButtonType { primary, secondary, outline, text, social }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonType type;
  final bool isLoading;
  final bool isFullWidth;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? width;
  final double height;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;
  final double fontSize;

  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.type = AppButtonType.primary,
    this.isLoading = false,
    this.isFullWidth = true,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
    this.height = 56,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 12,
    this.fontSize = 16,
  });

  const AppButton.social({
    super.key,
    required this.label,
    required this.prefixIcon,
    this.onPressed,
    this.isLoading = false,
  })  : type = AppButtonType.social,
        isFullWidth = true,
        suffixIcon = null,
        width = null,
        height = 56,
        backgroundColor = null,
        textColor = null,
        borderRadius = 12,
        fontSize = 16;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final loadingWidget = SizedBox(
      width: 22,
      height: 22,
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        color: type == AppButtonType.primary
            ? colors.white
            : colors.primary,
      ),
    );

    final labelWidget = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (prefixIcon != null) ...[
          prefixIcon!,
          horizontalSpace(12),
        ],
        Text(
          label,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            color: _getTextColor(colors),
          ),
        ),
        if (suffixIcon != null) ...[
          horizontalSpace(12),
          suffixIcon!,
        ],
      ],
    );

    final child = isLoading ? loadingWidget : labelWidget;

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
    );

    return SizedBox(
      width: isFullWidth ? double.infinity : width,
      height: height,
      child: switch (type) {
        AppButtonType.primary => ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? colors.button,
              disabledBackgroundColor:
                  (backgroundColor ?? colors.button).withOpacity(0.6),
              foregroundColor: textColor ?? colors.white,
              disabledForegroundColor: colors.white.withOpacity(0.8),
              elevation: 0,
              shape: shape,
            ),
            child: child,
          ),
        AppButtonType.secondary => ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  backgroundColor ?? colors.primary.withOpacity(0.1),
              disabledBackgroundColor:
                  (backgroundColor ?? colors.primary).withOpacity(0.05),
              foregroundColor: colors.primary,
              elevation: 0,
              shape: shape,
            ),
            child: child,
          ),
        AppButtonType.outline => OutlinedButton(
            onPressed: isLoading ? null : onPressed,
            style: OutlinedButton.styleFrom(
              foregroundColor: textColor ?? colors.primary,
              side: BorderSide(
                color: backgroundColor ?? colors.primary,
              ),
              shape: shape,
            ),
            child: child,
          ),
        AppButtonType.text => TextButton(
            onPressed: isLoading ? null : onPressed,
            style: TextButton.styleFrom(
              foregroundColor: textColor ?? colors.primary,
            ),
            child: child,
          ),
        AppButtonType.social => OutlinedButton(
            onPressed: isLoading ? null : onPressed,
            style: OutlinedButton.styleFrom(
              backgroundColor: colors.fieldBackground,
              foregroundColor: colors.textPrimary,
              side: BorderSide(color: colors.fieldBorder),
              shape: shape,
            ),
            child: child,
          ),
      },
    );
  }

  Color _getTextColor(MyColors colors) {
    return switch (type) {
      AppButtonType.primary => textColor ?? colors.white,
      AppButtonType.secondary => textColor ?? colors.primary,
      AppButtonType.outline => textColor ?? colors.primary,
      AppButtonType.text => textColor ?? colors.primary,
      AppButtonType.social => textColor ?? colors.textPrimary,
    };
  }
}