import 'dart:io';

void main() {
  createCore();
  createFeatures();

  print('✅ Project Structure Created Successfully');
}

void createCore() {
  final coreFiles = {
    'lib/core/base/base_entity.dart': '''
abstract class BaseEntity {}
''',

    'lib/core/base/base_model.dart': '''
abstract class BaseModel {}
''',

    'lib/core/base/base_usecase.dart': '''
abstract class BaseUseCase<Type, Params> {
  Future<Type> call(Params params);
}
''',

    'lib/core/base/base_repository.dart': '''
abstract class BaseRepository {}
''',

    'lib/core/base/base_bloc.dart': '''
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<State> extends Cubit<State> {
  BaseBloc(super.initialState);
}
''',

    'lib/core/error/failures.dart': '''
abstract class Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}
''',

    'lib/core/error/exceptions.dart': '''
class ServerException implements Exception {}

class CacheException implements Exception {}
''',

    'lib/core/extensions/context_extension.dart': '''
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}
''',

    'lib/core/extensions/string_extension.dart': '''
extension StringExtension on String {
  bool get isEmail => contains('@');
}
''',

    'lib/core/extensions/num_extension.dart': '''
extension NumExtension on num {
  double get h => toDouble();
  double get w => toDouble();
}
''',

    'lib/core/extensions/widget_extension.dart': '''
import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Padding paddingAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }
}
''',

    'lib/core/extensions/datetime_extension.dart': '''
extension DateTimeExtension on DateTime {
  String get formatted =>
      "\$day/\$month/\$year";
}
''',

    'lib/core/common/widgets/app_button.dart': '''
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Button'),
    );
  }
}
''',

    'lib/core/common/widgets/app_text_field.dart': '''
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField();
  }
}
''',

    'lib/core/common/widgets/app_loading.dart': '''
import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
''',

    'lib/core/common/widgets/app_error.dart': '''
import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final String message;

  const AppError({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
''',

    'lib/core/common/widgets/app_empty.dart': '''
import 'package:flutter/material.dart';

class AppEmpty extends StatelessWidget {
  const AppEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No Data'),
    );
  }
}
''',

    'lib/core/common/widgets/app_avatar.dart': '''
import 'package:flutter/material.dart';

class AppAvatar extends StatelessWidget {
  const AppAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar();
  }
}
''',

    'lib/core/common/widgets/app_status_badge.dart': '''
import 'package:flutter/material.dart';

class AppStatusBadge extends StatelessWidget {
  const AppStatusBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return const Chip(label: Text('Status'));
  }
}
''',

    'lib/core/services/supabase_service.dart': '''
class SupabaseService {}
''',

    'lib/core/di/di.dart': '''
Future<void> initDependencies() async {}
''',

    'lib/core/routes/app_routes.dart': '''
class AppRoutes {}
''',

    'lib/core/routes/routes_names.dart': '''
class RoutesNames {
  static const home = '/';
}
''',

    'lib/core/theme/app_theme.dart': '''
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light();
}
''',

    'lib/core/theme/app_colors.dart': '''
import 'package:flutter/material.dart';

class AppColors {
  static const primary = Colors.blue;
}
''',

    'lib/core/theme/app_text_styles.dart': '''
import 'package:flutter/material.dart';

class AppTextStyles {
  static const title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}
''',

    'lib/main.dart': '''
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(),
    ),
  );
}
'''
  };

  coreFiles.forEach(createFile);
}

void createFeatures() {
  final features = [
    'auth',
    'home',
    'course_detail',
    'schedule',
    'messages',
    'wishlist',
    'profile',
  ];

  for (final feature in features) {
    final className = toPascalCase(feature);

    final files = {
      'lib/features/$feature/domain/entities/${feature}_entity.dart': '''
class ${className}Entity {}
''',

      'lib/features/$feature/domain/repositories/${feature}_repository.dart': '''
abstract class ${className}Repository {}
''',

      'lib/features/$feature/domain/usecases/get_${feature}_usecase.dart': '''
class Get${className}UseCase {}
''',

      'lib/features/$feature/data/models/${feature}_model.dart': '''
import '../../domain/entities/${feature}_entity.dart';

class ${className}Model extends ${className}Entity {}
''',

      'lib/features/$feature/data/datasource/${feature}_remote_datasource.dart': '''
abstract class ${className}RemoteDatasource {}
''',

      'lib/features/$feature/data/repositories/${feature}_repository_impl.dart': '''
import '../../domain/repositories/${feature}_repository.dart';

class ${className}RepositoryImpl
    implements ${className}Repository {}
''',

      'lib/features/$feature/presentation/cubit/${feature}_state.dart': '''
abstract class ${className}State {}

class ${className}Initial extends ${className}State {}
''',

      'lib/features/$feature/presentation/cubit/${feature}_cubit.dart': '''
import 'package:flutter_bloc/flutter_bloc.dart';
import '${feature}_state.dart';

class ${className}Cubit
    extends Cubit<${className}State> {

  ${className}Cubit()
      : super(${className}Initial());
}
''',

      'lib/features/$feature/presentation/pages/${feature}_page.dart': '''
import 'package:flutter/material.dart';

class ${className}Page extends StatelessWidget {
  const ${className}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
''',

      'lib/features/$feature/presentation/widgets/.gitkeep': '',
    };

    files.forEach(createFile);
  }
}

void createFile(String path, String content) {
  final file = File(path);

  file.createSync(recursive: true);

  if (content.isNotEmpty) {
    file.writeAsStringSync(content);
  }
}

String toPascalCase(String text) {
  return text
      .split('_')
      .map(
        (e) => e[0].toUpperCase() + e.substring(1),
      )
      .join();
}