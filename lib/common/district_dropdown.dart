import 'package:donor/global/global.dart';
import 'package:flutter/material.dart';

class DistrictDropdown extends StatelessWidget {
  final String? selectedDistrict;
  final void Function(String?)? onChanged;
  final List<String> districtList;

  const DistrictDropdown({
    Key? key,
    required this.selectedDistrict,
    required this.onChanged,
    required this.districtList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedDistrict,
      hint: Text('Select District'),
      iconSize: 20,
      style: TextStyle(fontSize: 14),
      onChanged: onChanged,
      items: districtList.map((String district) {
        return DropdownMenuItem<String>(
          value: district,
          child: Text(
            district,
            style: TextStyle(color: GlobalVaraibles.blueColor),
          ),
        );
      }).toList(),
    );
  }
}
