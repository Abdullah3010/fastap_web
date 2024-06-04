import 'package:fastap/core/constants/constants.dart';
import 'package:fastap/core/extension/context_extension.dart';
import 'package:fastap/core/services/routes/app_modular_opserver.dart';
import 'package:fastap/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCore extends StatefulWidget {
  const AppCore({super.key});

  @override
  State<AppCore> createState() => _AppCoreState();
}

class _AppCoreState extends State<AppCore> {
  @override
  void initState() {
    super.initState();

    Modular.setNavigatorKey(Constants.common.navigatorKey);
    Modular.to.setObservers([
      AppModularObserver(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(context.width, context.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'FasTap',
          theme: AppTheme.lightTheme(),
          debugShowCheckedModeBanner: false,
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate,
          builder: (BuildContext context, Widget? child) {
            return child ?? const SizedBox();
          },
        );
      },
    );
  }
}
