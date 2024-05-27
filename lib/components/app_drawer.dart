import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: ListView(
        padding: EdgeInsets.only(top: 50.h),
        children: <Widget>[
          SizedBox(
            height: 300.h,
            child: DrawerHeader(
              decoration: BoxDecoration(),
              child: Center(
                  child: Text(
                "Task Trek",
                style: TextStyle(
                  fontSize: 98.sp,
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
              Navigator.pop(context);
              // Add your onTap code here!
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
              Navigator.pop(context);
              // Add your onTap code here!
            },
          ),
        ],
      ),
    );
  }
}
