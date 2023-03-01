import 'package:flutter/material.dart';
import 'veiws/home_page_view.dart';
import 'veiws/movie_details_view.dart';

abstract class MainNavigationRouteNames {
  static const main = '';
  static const movieDetails = '/main/movie_details';
}

class MainNavigation {
  final initialRoute = MainNavigationRouteNames.main;
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.main: (context) => const HomePageView(),
    MainNavigationRouteNames.movieDetails: (context) {
      final arguments =
          ModalRoute.of(context)!.settings.arguments as AgumentsNavigation?;
      return MovieDetailsVeiw(id: arguments!.id, context: arguments.context);
    }
  };
}

class AgumentsNavigation {
  int id;
  BuildContext context;

  AgumentsNavigation(this.id, this.context);
}
