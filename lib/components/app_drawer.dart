import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do_app/components/theme_dropdown.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800.w,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(28.r)),
      // backgroundColor: Theme.of(context).colorScheme.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 300.h,
            child: DrawerHeader(
              child: Center(
                  child: Text(
                "Task Trek",
                style: TextStyle(
                  fontSize: 92.sp,
                  fontWeight: FontWeight.w500,
                ),
              )),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              size: 92.sp,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 62.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              if (Get.currentRoute != '/home') {
                Get.offNamedUntil("/home", (route) => false);
              } else {
                Get.back();
              }
            },
          ),
          ListTile(
            leading: Icon(
              Icons.calendar_month,
              size: 92.sp,
            ),
            title: Text(
              'Calendar',
              style: TextStyle(
                fontSize: 62.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              if (Get.currentRoute != '/calendar') {
                Get.offAndToNamed('/calendar');
              } else {
                Get.back();
              }
            },
          ),
          SizedBox(
            height: 140.h,
          ),
          ThemeDropdown(),
        ],
      ),
    );
  }
}
