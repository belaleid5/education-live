import 'package:education_live_app/core/di/service_locator.dart';
import 'package:education_live_app/core/env/env_varible.dart';
import 'package:education_live_app/core/observer/bloc_observer.dart';
import 'package:education_live_app/core/storage/shared_pref.dart';
import 'package:education_live_app/educations_live_app.dart';
import 'package:education_live_app/features/app/ui/app_cubit_cubit.dart';
import 'package:education_live_app/features/concetvitiy/ui/connectivity_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';  

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvVariable.instance.init(EnvType.dev);


  await Supabase.initialize(
    url: EnvVariable.instance.supabaseUrl,
    anonKey: EnvVariable.instance.supabaseAnonKey,
  );

  await ConnectivityController.instance.init();
  await SharedPref().init();
  await setupDI();
  Bloc.observer = AppBlocObserver();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    BlocProvider(
      create: (_) => sl<AppCubit>()..init(),
      child: const EducationsLiveApp(),
    ),
  );
}
