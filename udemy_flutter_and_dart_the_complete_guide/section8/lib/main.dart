

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:section8/screens/categories.dart';
import 'package:section8/screens/tabs.dart';

final theme = ThemeData(
  // useMaterial3: true,//Not required
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: TabsScreen(),
      // home: CategoriesScreen(),
      // home: MealsScreen(title: 'Some category...', meals: DUMMY_MEALS),
      // home: MealsScreen(title: 'Some category...', meals: []),
    );
  }
}
