import 'package:donor/auth/login.dart';
import 'package:donor/donor/add.dart';
import 'package:donor/global/snackdar.dart';
import 'package:donor/home/home.dart';
import 'package:donor/providers/user_provider.dart';
import 'package:donor/search/search.dart';
import 'package:flutter/material.dart';
import 'package:donor/global/global.dart';
import 'package:provider/provider.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> _signOut(BuildContext context) async {
      try {
        final userProvider = Provider.of<UserProvider>(context, listen: false);

        userProvider.clearUser();
        Navigator.popAndPushNamed(context, LoginScreen.routeName);
      } catch (e) {
        showSnackbar(context, 'unable to logout');
      }
    }

    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.white,
              GlobalVaraibles.blueColor,
            ])),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                '',
                style: TextStyle(
                  color: GlobalVaraibles.blueColor,
                ),
              ),
              accountEmail: Text(
                '',
                style: TextStyle(color: GlobalVaraibles.blueColor),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/sides.png'),
                      fit: BoxFit.cover)),
            ),
            ListTile(
              title: Text('home'),
              leading: Icon(
                Icons.home,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(Home.routeName);
              },
            ),
            ListTile(
              title: Text('search'),
              onTap: () =>
                  Navigator.of(context).pushNamed(SearchScreen.routeName),
              leading: Icon(Icons.search),
            ),
            ListTile(
              title: Text('become a doner'),
              onTap: () => {
                Navigator.of(context).pushNamed(AddDonorPage.routeName),
              },
              leading: Icon(Icons.bloodtype_rounded),
            ),
            ListTile(
              title: Text('signout'),
              leading: Icon(Icons.logout),
              onTap: () => _signOut(context),
            )
          ],
        ),
      ),
    );
  }
}
