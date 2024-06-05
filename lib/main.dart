import 'package:bloc/bloc.dart';
import 'package:fastap/app_bloc_observer.dart';
import 'package:fastap/core/services/routes/app_module.dart';
import 'package:fastap/firebase_options.dart';
import 'package:fastap/modules/core/presentation/screens/app_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = AppBlocObserver();
  await ScreenUtil.ensureScreenSize();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppCore(),
    ),
  );
}
