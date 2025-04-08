// lib/functions/auth_functions.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Shared/widgets/show_snack_bar.dart';

Future<bool> signUp({
  required BuildContext context,
  required String emailAddress,
  required String password,
}) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    showCustomSnackBar(context, 'Account created successfully');
    
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      showCustomSnackBar(context, 'The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      showCustomSnackBar(context, 'The account already exists for that email.');
    }
  } catch (e) {
    showCustomSnackBar(context, 'Something went wrong\n$e');
  }

  return false;
}
