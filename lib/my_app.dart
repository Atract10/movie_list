import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_list/navigation.dart';
import 'package:provider/provider.dart';
import 'veiws/home_page_view.dart';
import 'view_models/home_page_view_model.dart';
import 'view_models/movie_details_view_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final mainNavigation = MainNavigation();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomePageViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MovieDetailsPageViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Movies',
        theme: ThemeData(
          fontFamily: GoogleFonts.dosis().fontFamily,
          textTheme: TextTheme(
            labelLarge: TextStyle(
              color: Colors.white,
              fontFamily: GoogleFonts.dosis().fontFamily,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
            displayMedium: TextStyle(
              color: Colors.black,
              fontFamily: GoogleFonts.dosis().fontFamily,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        home: const HomePageView(),
        routes: mainNavigation.routes,
        initialRoute: mainNavigation.initialRoute,
      ),
    );
  }
}
