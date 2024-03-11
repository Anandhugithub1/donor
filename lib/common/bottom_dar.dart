import 'package:donor/donor/add.dart';
import 'package:donor/home/home.dart';
import 'package:donor/search/search.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:donor/global/global.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GNav(
        backgroundColor: GlobalVaraibles.blueColor,
        color: Colors.white,
        activeColor: GlobalVaraibles.whiteColor,
        tabBackgroundColor: GlobalVaraibles.blueColor,
        gap: 8.0,
        padding: const EdgeInsets.all(16.0),
        tabs: [
          GButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(AddDonorPage.routeName),
            icon: Icons.bloodtype,
            text: 'donate blood',
          ),
          GButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(SearchScreen.routeName),
            icon: Icons.search,
            text: 'search',
          ),
          GButton(
            icon: Icons.home,
            onPressed: () => Navigator.of(context).pushNamed(Home.routeName),
            text: 'home',
          )
        ]);
  }
}
