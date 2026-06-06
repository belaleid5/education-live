// core/di/di.dart
import 'package:education_live_app/features/app/ui/app_cubit_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> setupDI() async {
  // Supabase
  sl.registerLazySingleton(() => Supabase.instance.client);

  // App Cubit
  sl.registerFactory(() => AppCubit());
}
