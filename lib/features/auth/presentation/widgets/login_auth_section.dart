import 'package:education_live_app/core/language/lang_keys.dart';
import 'package:education_live_app/core/theme/colors/my_colors.dart';
import 'package:education_live_app/features/auth/presentation/bloc/email_auth/email_auth_bloc.dart';
import 'package:education_live_app/features/auth/presentation/bloc/email_auth/email_auth_event.dart';
import 'package:education_live_app/features/auth/presentation/bloc/email_auth/email_auth_state.dart';
import 'package:education_live_app/shared/extensions/animation_extensions.dart';
import 'package:education_live_app/shared/extensions/context_extensions.dart';
import 'package:education_live_app/shared/utils/app_validators.dart';
import 'package:education_live_app/shared/utils/spacing.dart';
import 'package:education_live_app/shared/widgets/adabtive_text_form_field.dart';
import 'package:education_live_app/shared/widgets/app_button.dart';
import 'package:education_live_app/shared/widgets/custom_form_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginAuthSection extends StatefulWidget {
  const LoginAuthSection({super.key});

  @override
  State<LoginAuthSection> createState() => _LoginAuthSectionState();
}

class _LoginAuthSectionState extends State<LoginAuthSection> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (!_formKey.currentState!.validate()) return;

    context.read<EmailAuthBloc>().add(
      SignInWithEmailEvent(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmailAuthBloc, EmailAuthState>(
      builder: (context, state) {
        final isLoading = state is EmailAuthLoading;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                AdaptiveInputField(
                  validate:(value)=> AppValidators.validateEmail(value),
                  context: context,
                  controller: _emailController,
                  filedColor: context.colors.fieldBackground,
                  hintText: context.translate(LangKeys.emailAddress),
                  textAlign: TextAlign.end,
                  keyboardType: TextInputType.emailAddress,
                ).animateBottomToTop(delay: 400.ms, duration: 800.ms),


                verticalSpace(16),

                CustomTextFormPassword(
                    validate:(value)=> AppValidators.validatePassword(value),
                  hintText: context.translate(LangKeys.password),
                  controller: _passwordController,
                  isConfirmPassword: true,
                ).animateBottomToTop(delay: 600.ms, duration: 800.ms),

                verticalSpace(24),

                AppButton(
                  backgroundColor: context.colors.primary,
                  label: context.translate(LangKeys.login),
                  isLoading: isLoading,
                  onPressed: isLoading ? null : _onLoginPressed,
                ).animateScaleNFadeHorizontal(delay: 900.ms, duration: 800.ms),
              ],
            ),
          ),
        );
      },
    );
  }
}