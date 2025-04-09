import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Shared/widgets/show_snack_bar.dart';

Future<bool> login({
  required BuildContext context,
  required String emailAddress,
  required String password,
}) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);
    showCustomSnackBar(context, 'welcome');

    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      showCustomSnackBar(context, 'No user found for that email.');

      return true;
    } else if (e.code == 'wrong-password') {
      showCustomSnackBar(context, 'Wrong password provided for that user.');

      return true;
    }
  }
  return false;
}
