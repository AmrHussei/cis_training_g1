import 'package:flutter/material.dart';

import '../../features/home/presentation/view/screens/home_screen.dart';

class Routes {
  //auth

  static const String homeScreen = '/HomeScreen';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
    }
    return null;
  }
}
