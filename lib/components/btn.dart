import 'package:flutter/material.dart';

class CusButton extends StatelessWidget {
  final String btnTitle;
  VoidCallback onPressed;
  CusButton({super.key, required this.btnTitle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(btnTitle),
        color: Theme.of(context).colorScheme.primary,
        elevation: 4,
      ),
    );
    // return Padding(
    //   padding: EdgeInsets.only(left: 20),
    //   child: FilledButton(
    //     onPressed: onPressed,
    //     child: Text(btnTitle),
    //   ),
    // );
  }
}
