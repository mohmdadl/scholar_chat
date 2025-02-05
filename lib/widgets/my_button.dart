import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String buttonString;
  MyButton({Key? key, required this.buttonString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.92,
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            buttonString,
            style: const TextStyle(
              color: const Color(0xff274460),
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
