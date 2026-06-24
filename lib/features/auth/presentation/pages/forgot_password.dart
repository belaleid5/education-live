import 'package:education_live_app/core/di/service_locator.dart';
import 'package:education_live_app/core/theme/colors/my_colors.dart';
import 'package:education_live_app/features/auth/presentation/bloc/email_auth/email_auth_bloc.dart';
import 'package:education_live_app/features/auth/presentation/refactors/forgot_password_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<EmailAuthBloc>(),
      child: Scaffold(
        backgroundColor: context.colors.background,
        body: const ForgotPasswordBody(),
      ),
    );
  }
}



