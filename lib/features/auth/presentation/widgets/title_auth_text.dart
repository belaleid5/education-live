import 'package:education_live_app/core/language/lang_keys.dart';
import 'package:education_live_app/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class TitleAuthText extends StatelessWidget {
  const TitleAuthText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      context.translate(LangKeys.forgotPassword),
      textAlign: TextAlign.center,
      style: context.textStyle.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
