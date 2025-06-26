import 'package:cis_training_g1/features/home/presentation/view/screens/pesron_details_screen.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/view/screens/home_screen.dart';

class Routes {
  //auth

  static const String homeScreen = '/HomeScreen';
  static const String personDetailsScreen = '/PersonDetailsScreen';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.personDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => const PesronDetailsScreen(),
        );
    }
    return null;
  }
}
