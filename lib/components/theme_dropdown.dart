import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/theme.dart';

class ThemeDropdown extends StatelessWidget {
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(28.r),
              border: Border.all(
                  color: Theme.of(context).colorScheme.secondary, width: 8.w)),
          padding: EdgeInsets.symmetric(
            horizontal: 48.w,
            vertical: 16.h,
          ),
          child: DropdownButton<ThemeMode>(
            value: themeController.themeMode.value,
            autofocus: true,
            elevation: 0,
            items: [
              DropdownMenuItem(
                value: ThemeMode.light,
                child: Row(children: [
                  const Icon(Icons.light_mode),
                  SizedBox(
                    width: 28.w,
                  ),
                  const Text('Light'),
                ]),
              ),
              DropdownMenuItem(
                value: ThemeMode.dark,
                child: Row(children: [
                  const Icon(Icons.dark_mode),
                  SizedBox(
                    width: 28.w,
                  ),
                  const Text('Dark'),
                ]),
              ),
              DropdownMenuItem(
                value: ThemeMode.system,
                child: Row(children: [
                  const Icon(Icons.computer),
                  SizedBox(
                    width: 28.w,
                  ),
                  const Text('System'),
                ]),
              ),
            ],
            onChanged: (ThemeMode? newTheme) {
              if (newTheme != null) {
                themeController.setTheme(newTheme);
              }
            },
          ));
    });
  }
}
