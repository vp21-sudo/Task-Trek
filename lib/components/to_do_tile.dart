import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final void Function(bool?)? onChange;
  Function(BuildContext)? deleteFunction;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChange,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 38.w, right: 38.w, top: 38.h),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              padding: EdgeInsets.all(18.w),
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(28.r),
            )
          ],
        ),
        child: Container(
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChange,
                // activeColor: Theme.of(context).colorScheme.secondary,
                activeColor: Colors.black87,
              ),
              Text(
                taskName,
                style: TextStyle(
                  fontSize: 64.sp,
                  fontWeight: FontWeight.w400,
                  decoration: taskCompleted ? TextDecoration.lineThrough : null,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.all(Radius.circular(28.r))),
          padding: EdgeInsets.all(48.h),
        ),
      ),
    );
  }
}
