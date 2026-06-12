import 'package:education_live_app/core/language/lang_keys.dart';
import 'package:education_live_app/core/routes/routes_names.dart';
import 'package:education_live_app/features/auth/presentation/widgets/login_button_with_face_book.dart';
import 'package:education_live_app/features/auth/presentation/widgets/login_with_google.dart';
import 'package:education_live_app/features/auth/presentation/widgets/logo_auth.dart';
import 'package:education_live_app/features/auth/presentation/widgets/or_text_section.dart';
import 'package:education_live_app/features/auth/presentation/widgets/sign_up_auth_section.dart';
import 'package:education_live_app/features/auth/presentation/widgets/terms_condition_widget.dart';
import 'package:education_live_app/features/auth/presentation/widgets/text_and_button_text.dart';
import 'package:education_live_app/shared/extensions/context_extensions.dart';
import 'package:education_live_app/shared/utils/spacing.dart';
import 'package:flutter/material.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: verticalSpace(160)),
        SliverToBoxAdapter(child: LogoAuth()),
        SliverToBoxAdapter(child: verticalSpace(20)),
        SliverToBoxAdapter(child: SignUpAuthSection()),
        SliverToBoxAdapter(child: verticalSpace(20)),
        SliverToBoxAdapter(child: OrTextSection()),
        SliverToBoxAdapter(child: verticalSpace(20)),
        SliverToBoxAdapter(child: LoginButtonWithFaceBook()),
        SliverToBoxAdapter(child: verticalSpace(10)),
        SliverToBoxAdapter(child: LoginWithGoogle()),
        SliverToBoxAdapter(child: verticalSpace(10)),
        SliverToBoxAdapter(child: TermConditionWidget()),
        SliverToBoxAdapter(child: verticalSpace(30)),
        SliverToBoxAdapter(
          child: TextAndButtonText(
            onTap: () {
              context.pushReplacementNamed(AppRoutesNames.login);
            },
            title: context.translate(LangKeys.youHaveAccount),
            textButton: context.translate(LangKeys.login),
          ),
        ),
      ],
    );
  }
}
