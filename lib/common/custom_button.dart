import 'package:flutter/material.dart';
import 'package:donor/global/global.dart';

class CustomButtom extends StatelessWidget {
  final String text;
  final double size;
  final VoidCallback onclick;
  CustomButtom(
      {super.key, required this.text, required this.onclick, this.size = 200});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onclick,
      style: ElevatedButton.styleFrom(
          minimumSize: Size(size, 50),
          backgroundColor: GlobalVaraibles.blueColor),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
