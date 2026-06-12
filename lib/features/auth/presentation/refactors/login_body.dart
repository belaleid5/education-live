import 'package:education_live_app/core/language/lang_keys.dart';
import 'package:education_live_app/features/auth/presentation/widgets/forgot_passwod_button.dart';
import 'package:education_live_app/features/auth/presentation/widgets/login_auth_section.dart';
import 'package:education_live_app/features/auth/presentation/widgets/login_button_with_face_book.dart';
import 'package:education_live_app/features/auth/presentation/widgets/login_with_google.dart';
import 'package:education_live_app/features/auth/presentation/widgets/logo_auth.dart';
import 'package:education_live_app/features/auth/presentation/widgets/or_text_section.dart';
import 'package:education_live_app/features/auth/presentation/widgets/text_and_button_text.dart';
import 'package:education_live_app/shared/extensions/context_extensions.dart';
import 'package:education_live_app/shared/utils/spacing.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: verticalSpace(160)),
        SliverToBoxAdapter(child: LogoAuth()),
        SliverToBoxAdapter(child: verticalSpace(20)),
        SliverToBoxAdapter(child: LoginAuthSection()),
        SliverToBoxAdapter(child: verticalSpace(20)),
        SliverToBoxAdapter(child: ForgotPasswordButton()),
        SliverToBoxAdapter(child: verticalSpace(20)),
        SliverToBoxAdapter(child: OrTextSection()),
        SliverToBoxAdapter(child: verticalSpace(20)),
        SliverToBoxAdapter(child: LoginButtonWithFaceBook()),
        SliverToBoxAdapter(child: verticalSpace(10)),
        SliverToBoxAdapter(child: LoginWithGoogle()),
        SliverToBoxAdapter(child: verticalSpace(50)),
        SliverToBoxAdapter(child: TextAndButtonText(
             title: context.translate(LangKeys.dontHaveAccount),
            textButton:  context.translate(LangKeys.signUp))),
      ],
    );
  }
}
