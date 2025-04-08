import 'package:flutter/material.dart';

import '../../Core/themes.dart';


// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  String buttonString;
  GestureTapCallback? onTap;
  MyButton({Key? key, required this.buttonString,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: onTap,
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
              style: blueStyle,
            ),
          ),
        ),
      ),
    );
  }
}
