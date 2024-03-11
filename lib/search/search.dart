import 'package:donor/global/snackdar.dart';
import 'package:flutter/material.dart';
import 'package:donor/global/global.dart';
import 'package:donor/models/donor.dart';
import 'package:donor/services/search.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search';
  SearchScreen({
    super.key,
  });

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Donor> _searchResults = [];
  Future<void> _search(String query) async {
    SearchService searchService = SearchService();
    try {
      List<Donor> results = await searchService.searchBloodGroup(
        context: context,
        query: query,
      );
      setState(() {
        _searchResults = results;
      });
    } catch (e) {
      showSnackbar(context, 'unexpected error');
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: GlobalVaraibles.globalGradient),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30, 50, 10, 0),
              child: TextField(
                controller: _searchController,
                decoration: GlobalVaraibles.searchInputDecoration,
                onSubmitted: (query) {
                  _search(query);
                },
                onChanged: (query) {
                  _search(query);
                },
              ),
            ),
            Expanded(
              child: _buildSearchResults(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    if (_searchResults.isEmpty) {
      return Center(
        child: Text('blood group not found'),
      );
    } else {
      return GridView.builder(
        itemCount: _searchResults.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(top: 10),
            margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
            decoration: BoxDecoration(
                color: GlobalVaraibles.blueColor,
                borderRadius: BorderRadius.circular(8.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  size: 30,
                  color: GlobalVaraibles.whiteColor,
                ),
                Text(
                  _searchResults[index].name,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  _searchResults[index].bloodGroup,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  _searchResults[index].district,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  _searchResults[index].phoneNumber,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  _searchResults[index].address,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
