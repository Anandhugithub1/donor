import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:donor/global/global.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final int maxlines;
  final String hintText;
  final IconData? iconData;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.inputFormatters,
    this.maxlines = 1,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: iconData != null ? Icon(iconData) : null,
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: GlobalVaraibles.blueColor)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: GlobalVaraibles.blueColor),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: GlobalVaraibles.blueColor,
            ),
            borderRadius: BorderRadius.circular(8.0),
          )),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return hintText;
        }
        return null;
      },
      maxLines: maxlines,
      inputFormatters: inputFormatters ?? [],
    );
  }
}
