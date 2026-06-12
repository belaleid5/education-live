import 'package:education_live_app/core/language/lang_keys.dart';
import 'package:education_live_app/core/theme/colors/my_colors.dart';
import 'package:education_live_app/features/auth/presentation/bloc/social_auth/social_auth_bloc.dart';
import 'package:education_live_app/features/auth/presentation/bloc/social_auth/social_auth_event.dart';
import 'package:education_live_app/features/auth/presentation/bloc/social_auth/social_auth_state.dart';
import 'package:education_live_app/shared/constants/app_images.dart';
import 'package:education_live_app/shared/extensions/animation_extensions.dart';
import 'package:education_live_app/shared/extensions/context_extensions.dart';
import 'package:education_live_app/shared/widgets/app_button.dart';
import 'package:education_live_app/shared/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButtonWithFaceBook extends StatelessWidget {
  const LoginButtonWithFaceBook({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocialAuthBloc, SocialAuthState>(
      builder: (context, state) {
        final isLoading = state is SocialAuthLoading;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: AppButton(
            onPressed: isLoading
                ? null
                : () {
                    context.read<SocialAuthBloc>().add(
                      const SignInWithFacebookEvent(),
                    );
                  },
            suffixIcon: CustomImage(
              imageType: ImagesType.svg,
              color: context.colors.white,
              applySvgColor: true,
              imagePath: AppImages.facebook,
            ),
            backgroundColor: context.colors.royalBlueColor,
            label: context.translate(LangKeys.loginWithFaceBook),
            isLoading: isLoading,
          ),
        ).animateRightLeft(delay: 1500.ms, duration: 700.ms, isFromStart: true);
      },
    );
  }
}