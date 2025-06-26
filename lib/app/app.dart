import 'package:cis_training_g1/app/injector.dart';
import 'package:cis_training_g1/core/bloc/theme_manager/theme_manager_cubit.dart';
import 'package:cis_training_g1/features/home/presentation/view_model/home/home_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/routes/app_routes.dart';
import '../core/utils/app_colors.dart';

bool KisGuest = false;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.secondColor(context),
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemManagerCubit(),
        ),
        BlocProvider.value(
          value: serviceLocator<HomeCubit>(),
        ),
      ],
      child: BlocBuilder<ThemManagerCubit, ThemManagerState>(
        builder: (context, state) {
          return ScreenUtilInit(
            fontSizeResolver: FontSizeResolvers.diagonal,
            designSize: const Size(390, 844),
            minTextAdapt: true,
            splitScreenMode: true,
            useInheritedMediaQuery: true,
            builder: (context, child) {
              return MaterialApp(
                navigatorKey: navigatorKey,
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('ar'),
                  Locale('en'),
                ],
                locale: const Locale('en'),
                theme: state.themeData,
                debugShowCheckedModeBanner: false,
                // locale: DevicePreview.locale(context),
                builder: DevicePreview.appBuilder,

                onGenerateRoute: (settings) =>
                    AppRoutes.onGenerateRoute(settings),
                initialRoute: Routes.homeScreen,
              );
            },
          );
        },
      ),
    );
  }
}

// builder: (context, child) => MediaQuery(
//           data: const MediaQueryData(textScaler: TextScaler.linear(1)),
//           child: child!,
//         ),
