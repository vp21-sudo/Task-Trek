import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/pages/home.dart';

void main() {
  runApp(MyApp());
}

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.yellow[700],
  colorScheme: ColorScheme.light(
    primary: Color.fromARGB(255, 253, 233, 50), // Primary color for light theme
    onPrimary:
        Color.fromARGB(255, 237, 237, 237), // Text color on primary color
    secondary: Color.fromARGB(255, 254, 164,
        10), // Color for floating action button and other secondary UI
    surface: Color.fromARGB(
        255, 254, 249, 183), // Surface color for cards, sheets, and menus
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.yellow[700],
    iconTheme: IconThemeData(color: Colors.white),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.yellow[700],
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blueGrey[900],
  colorScheme: ColorScheme.dark(
    primary:
        const Color.fromARGB(255, 38, 50, 56), // Primary color for dark theme
    onPrimary:
        Color.fromARGB(255, 252, 251, 191), // Text color on primary color
    secondary: const Color.fromARGB(255, 255, 143,
        0), // Color for floating action button and other secondary UI
    surface: const Color.fromARGB(
        255, 48, 48, 48), // Surface color for cards, sheets, and menus
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blueGrey[900],
    iconTheme: IconThemeData(color: Colors.amber[700]),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.yellow[900],
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:
          const Size(1080, 2400), // Pixel 6 resolution in logical pixels
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const Home(),
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.system,
        );
      },
    );
  }
}
