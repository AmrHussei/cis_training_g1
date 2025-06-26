import 'package:cis_training_g1/features/home/presentation/view/screens/pesron_details_screen.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/view/screens/home_screen.dart';
import '../../features/home/presentation/view/screens/show_person_image.dart';

class Routes {
  //auth

  static const String homeScreen = '/HomeScreen';
  static const String personDetailsScreen = '/PersonDetailsScreen';
  static const String showPersonImage = '/ShowPersonImage';
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
      case Routes.showPersonImage:
        return MaterialPageRoute(
          builder: (_) => const ShowPersonImage(),
        );
    }
    return null;
  }
}
