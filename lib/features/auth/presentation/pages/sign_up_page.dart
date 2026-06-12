import 'package:education_live_app/core/di/service_locator.dart';
import 'package:education_live_app/core/routes/routes_names.dart';
import 'package:education_live_app/features/auth/presentation/bloc/email_auth/email_auth_bloc.dart';
import 'package:education_live_app/features/auth/presentation/bloc/email_auth/email_auth_state.dart';
import 'package:education_live_app/features/auth/presentation/bloc/social_auth/social_auth_bloc.dart';
import 'package:education_live_app/features/auth/presentation/refactors/sign_up_body.dart';
import 'package:education_live_app/shared/extensions/context_extensions.dart';
import 'package:education_live_app/shared/extensions/custom_toast_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<EmailAuthBloc>()),
        BlocProvider(create: (_) => sl<SocialAuthBloc>()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<EmailAuthBloc, EmailAuthState>(
            listener: (context, state) {
              if (state is EmailAuthSuccess) {
                context.pushReplacementNamed(AppRoutesNames.home);
              }
              if (state is EmailAuthError) {
                CustomToastExtensions.showError(context, state.message);
              }
            },
          ),
      
      
        ],
        child: const Scaffold(body: SignUpBody()),
      ),
    );
  }
}
