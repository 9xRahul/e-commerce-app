import 'package:flutter/material.dart';

void showAppSnackBar(
  BuildContext context, {
  required String message,
  Color backgroundColor = Colors.green, // default to success color
  Duration duration = const Duration(seconds: 2),
  SnackBarBehavior behavior = SnackBarBehavior.floating,
}) {
  ScaffoldMessenger.of(
    context,
  ).hideCurrentSnackBar(); // optional: avoids stacking
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, style: const TextStyle(color: Colors.white)),
      backgroundColor: backgroundColor,
      behavior: behavior,
      duration: duration,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(12), // looks cleaner with floating style
    ),
  );
}
