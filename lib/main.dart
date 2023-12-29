import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_calendar/widgets/bottom_navigation_bar.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme(
              primary: const Color(0xFF0A0E21),
              onBackground: const Color(0xFF2D344B),
              onError: Colors.yellow,
              onSecondary: const Color(0x00a0add8),
              onSurface: Colors.white,
              background: const Color(0x0000297a),
              secondary: Colors.blue.shade300,
              surface: const Color(0x99EBEBF5),
              error: const Color(0xFFFE7171),
              onPrimary: const Color(0xFF2D344B),
              brightness: Brightness.dark,
              secondaryContainer: const Color(0xFF94A3B8)),
          scaffoldBackgroundColor: const Color(0x0000297a),
          fontFamily: 'Inter'),
      home: const BottomNavigationBarExample(),
    );
  }
}
