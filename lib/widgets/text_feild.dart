import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  String hintString;
  IconData? myIcon;
  CustomTextFeild({Key? key, required this.hintString,required this.myIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        
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
      ),
    );
  }
}
