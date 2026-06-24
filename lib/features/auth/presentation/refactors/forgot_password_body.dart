import 'package:education_live_app/core/language/lang_keys.dart';
import 'package:education_live_app/core/routes/routes_names.dart';
import 'package:education_live_app/core/theme/colors/my_colors.dart';
import 'package:education_live_app/features/auth/presentation/widgets/auth_section_reset_password.dart';
import 'package:education_live_app/features/auth/presentation/widgets/logo_auth.dart';
import 'package:education_live_app/features/auth/presentation/widgets/or_text_section.dart';
import 'package:education_live_app/features/auth/presentation/widgets/title_auth_text.dart';
import 'package:education_live_app/shared/extensions/animation_extensions.dart';
import 'package:education_live_app/shared/extensions/context_extensions.dart';
import 'package:education_live_app/shared/utils/spacing.dart';
import 'package:education_live_app/shared/widgets/app_button.dart';
import 'package:education_live_app/shared/widgets/custom_sub_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: verticalSpace(120)),

          SliverToBoxAdapter(child: LogoAuth()),

          SliverToBoxAdapter(child: verticalSpace(30)),

          SliverToBoxAdapter(
            child: TitleAuthText().animateRightLeft(delay: 400.ms, duration: 600.ms),
          ),

          SliverToBoxAdapter(child: verticalSpace(10)),

          SliverToBoxAdapter(
            child: CustomSubtitleText(
              subtitle: context.translate(LangKeys.resetPasswordInstructions),
            ).animateRightLeft(delay: 500.ms, duration: 600.ms),
          ),

          SliverToBoxAdapter(child: verticalSpace(20)),

          SliverToBoxAdapter(
            child: const AuthResetPasswordSection().animateBottomToTop(
              delay: 600.ms,
              duration: 600.ms,
            ),
          ),

          SliverToBoxAdapter(child: verticalSpace(20)),

          SliverToBoxAdapter(
            child: CustomSubtitleText(
              subtitle: context.translate(LangKeys.resetPasswordEmailInfo),
            ).animateRightLeft(delay: 700.ms, duration: 600.ms),
          ),

          SliverToBoxAdapter(child: verticalSpace(20)),

          SliverToBoxAdapter(
            child: OrTextSection().animateRightLeft(
              delay: 800.ms,
              duration: 600.ms,
            ),
          ),

          SliverToBoxAdapter(child: verticalSpace(20)),

          SliverToBoxAdapter(
            child: AppButton(
              onPressed: () {
                context.pushReplacementNamed(AppRoutesNames.login);
              },
              type: AppButtonType.outline,
              borderColor: context.colors.fieldBorder,
              label: context.translate(LangKeys.backToLogin),
            ).animateBottomToTop(delay: 900.ms, duration: 600.ms),
          ),

          SliverToBoxAdapter(child: verticalSpace(20)),

          SliverToBoxAdapter(
            child: CustomSubtitleText(
              subtitle: context.translate(LangKeys.checkInboxMessage),
            ).animateRightLeft(delay: 1000.ms, duration: 600.ms),
          ),
        ],
      ),
    );
  }
}

