import 'package:flutter/material.dart';

import '../../services/custom_validator.dart';

class CustomTextFeild extends StatelessWidget {
  final String hintString;
  final IconData myIcon;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final bool isPassword;
  final String validateType;

  CustomTextFeild({
    Key? key,
    required this.validateType,
    required this.hintString,
    required this.myIcon,
    this.textInputType,
    this.onChanged,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(myIcon),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white70),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          hintText: hintString,
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
        validator: CustomValidator(validateType),
        onChanged: onChanged,
        keyboardType: textInputType,
        obscureText: isPassword,
      ),
    );
  }
}
