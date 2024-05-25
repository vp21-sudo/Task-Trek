import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/components/btn.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController textInpController;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.textInpController,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      content: Container(
        height: 150,
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: textInpController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14))),
                hintText: "Task Name",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CusButton(btnTitle: "Cancel", onPressed: onCancel),
                CusButton(btnTitle: "Save", onPressed: onSave)
              ],
            )
          ],
        ),
      ),
    );
  }
}
