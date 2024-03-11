import 'package:flutter/material.dart';

String uri = 'https://donorapi-production.up.railway.app';
String cloudName = 'dl9a0ulpp';
String apiKey = '978412585134575';
String apiSecret = '9hM2hgEc4EN42HALab_8qRbRctE';
String uploadPreset = 'ey36djco';

List<String> listItem = ['a+', 'a-', 'b+', 'b-', 'ab+', 'ab-', 'o+', 'o-'];
List<String> listItem2 = [
  "alappuzha",
  "ernakulam",
  "idukki",
  "kannur",
  "kasaragod",
  "kollam",
  "kottayam",
  "kozhikode",
  "malappuram",
  "palakkad",
  "pathanamthitta",
  "thiruvananthapuram",
  "thrissur",
  "wayanad"
];

class GlobalVaraibles {
  static var globalGradient = LinearGradient(colors: [
    Colors.blue.shade900,
    Colors.white,
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
  static var blueColor = Colors.blue.shade900;
  static InputDecoration searchInputDecoration = InputDecoration(
    hintText: 'Search for blood group',
    prefixIcon: Icon(Icons.search),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: GlobalVaraibles.blueColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: GlobalVaraibles.blueColor),
      borderRadius: BorderRadius.circular(8.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: GlobalVaraibles.blueColor),
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  static const whiteColor = Color.fromRGBO(255, 255, 255, 1);
}
