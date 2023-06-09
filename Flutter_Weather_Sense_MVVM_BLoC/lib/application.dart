import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_weather_sense_mvvm_bloc/config/config_barrel.dart';

class Application extends HookWidget {
  static AppStyles _styles = AppStyles();

  static AppStyles get styles => _styles;

  const Application({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider:
          AppGoRouter.routerInstance.routeInformationProvider,
      routeInformationParser: AppGoRouter.routerInstance.routeInformationParser,
      debugShowCheckedModeBanner: false,
      routerDelegate: AppGoRouter.routerInstance.routerDelegate,
      builder: (context, child) {
        // Initializing the AppStyles inside the Application
        // before the application start.
        _initializeAppStyles(context: context);

        // Return an empty Container when child Widget was empty.
        return child ?? Container();
      },
      theme: ThemeData.from(colorScheme: AppColors.lightColorScheme),
      darkTheme: ThemeData.from(colorScheme: AppColors.darkColorScheme),
    );
  }

  /// Initialize AppStyles to listen to the device size,
  /// and update AppStyles when it changes
  /// with retrieving the BuildContext instance from inside Application
  /// before the app was started.
  void _initializeAppStyles({
    required BuildContext context,
  }) {
    _styles = AppStyles(screenSize: context.sizePx);
  }
}
