// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CircleBtn extends StatelessWidget {
  String imagePath;
  String labelText;
  CircleBtn({
    super.key,
    required this.imagePath,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color(
                  0xFF2871BB,
                ),
                Color(
                  0xFF00FFE2,
                ),
              ],
            ),
          ),
          child: Image(
            image: AssetImage(
              imagePath,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          labelText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
