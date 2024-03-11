import 'package:flutter/material.dart';
import 'package:donor/global/global.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(top: 140),
      child: CircularProgressIndicator(
        color: GlobalVaraibles.blueColor,
      ),
    ));
  }
}
