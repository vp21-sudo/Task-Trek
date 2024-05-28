import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/theme.dart';
import 'package:to_do_app/pages/calendar.dart';
import 'package:to_do_app/pages/home.dart';

void main() {
  runApp(MyApp());
}

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.green[700],
  colorScheme: const ColorScheme.light(
    primary:
        Color.fromARGB(255, 119, 226, 121), // Primary color for light theme
    onPrimary:
        Color.fromARGB(255, 255, 255, 255), // Text color on primary color
    secondary: Color.fromARGB(255, 56, 142,
        60), // Color for floating action button and other secondary UI
    surface: Color.fromARGB(
        255, 220, 249, 223), // Surface color for cards, sheets, and menus
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.green[700],
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.green[700],
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blueGrey[900],
  colorScheme: const ColorScheme.dark(
    primary: Color.fromARGB(255, 38, 50, 56), // Primary color for dark theme
    onPrimary:
        Color.fromARGB(255, 255, 255, 255), // Text color on primary color
    secondary: Color.fromARGB(255, 255, 87,
        34), // Color for floating action button and other secondary UI
    surface: Color.fromARGB(
        255, 71, 71, 71), // Surface color for cards, sheets, and menus
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blueGrey[900],
    iconTheme: IconThemeData(color: Colors.orange[700]),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.orange[900],
  ),
);

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:
          const Size(1080, 2400), // Pixel 6 resolution in logical pixels
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // home: const Home(),
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeController.themeMode.value,
          initialRoute: "/home",
          getPages: [
            GetPage(
              name: "/home",
              page: () => const Home(),
              transition: Transition.fadeIn,
              transitionDuration: Durations.medium3,
            ),
            GetPage(
                name: "/calendar",
                page: () => const Calendar(),
                transition: Transition.fadeIn,
                transitionDuration: Durations.medium3)
          ],
        );
      },
    );
  }
}
