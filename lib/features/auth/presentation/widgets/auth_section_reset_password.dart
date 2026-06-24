import 'package:education_live_app/core/language/lang_keys.dart';
import 'package:education_live_app/core/routes/routes_names.dart';
import 'package:education_live_app/features/auth/presentation/bloc/email_auth/email_auth_bloc.dart';
import 'package:education_live_app/features/auth/presentation/bloc/email_auth/email_auth_event.dart';
import 'package:education_live_app/features/auth/presentation/bloc/email_auth/email_auth_state.dart';
import 'package:education_live_app/shared/extensions/context_extensions.dart';
import 'package:education_live_app/shared/extensions/custom_toast_extensions.dart';
import 'package:education_live_app/shared/utils/app_validators.dart';
import 'package:education_live_app/shared/utils/spacing.dart';
import 'package:education_live_app/shared/widgets/adabtive_text_form_field.dart';
import 'package:education_live_app/shared/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthResetPasswordSection extends StatefulWidget {
  const AuthResetPasswordSection({super.key});

  @override
  State<AuthResetPasswordSection> createState() =>
      _AuthResetPasswordSectionState();
}

class _AuthResetPasswordSectionState extends State<AuthResetPasswordSection> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void _sendOtp() {
    if (formKey.currentState!.validate()) {
      context.read<EmailAuthBloc>().add(
        SendPasswordResetOtpEvent(email: emailController.text.trim()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailAuthBloc, EmailAuthState>(
      listener: (context, state) {
        if (state is PasswordResetOtpSent) {
              print(state.message);
          CustomToastExtensions.show(context, state.message);
          context.pushNamed(
            AppRoutesNames.verifyOtp,
            arguments: emailController.text.trim(),
          );
        } else if (state is EmailAuthError) {
              print(state.message);
          CustomToastExtensions.showError(context, state.message);
        }
      },
      builder: (context, state) {
        final isLoading = state is EmailAuthLoading;
        return Form(
          key: formKey,
          child: Column(
            children: [
              AdaptiveInputField(
                controller: emailController,
                hintText: context.translate(LangKeys.emailAddress),
                keyboardType: TextInputType.emailAddress,
                validate: (value)=>
                AppValidators.validateEmail(value)  ,context: context,
              ),
              verticalSpace(20),
              AppButton(
                onPressed: isLoading ? null : _sendOtp,
                isLoading: isLoading,
                label: context.translate(LangKeys.resetPassword),
              ),
            ],
          ),
        );
      },
    );
  }
}
