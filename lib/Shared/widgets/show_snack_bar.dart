import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String message, {Color? backgroundColor}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor ?? Colors.cyan[300], // Default color is red
      behavior: SnackBarBehavior.floating, // Makes it float above UI
      duration: const Duration(seconds: 2), // Auto-dismiss after 2 seconds
    ),
  );
}
