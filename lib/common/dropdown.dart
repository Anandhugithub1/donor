import 'package:flutter/material.dart';
import 'package:donor/global/global.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> listitem;
  final String hintText;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    super.key,
    required this.listitem,
    required this.hintText,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      borderRadius: BorderRadius.circular(10),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: GlobalVaraibles.blueColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: GlobalVaraibles.blueColor),
        ),
      ),
      hint: Text(
        hintText,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      value: selectedValue,
      items: listitem.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(color: GlobalVaraibles.blueColor),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
