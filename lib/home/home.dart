import 'package:flutter/material.dart';
import 'package:donor/common/bottom_dar.dart';
import 'package:donor/common/district_dropdown.dart';
import 'package:donor/common/skeleton.dart';
import 'package:donor/global/global.dart';
import 'package:donor/models/donor.dart';
import 'package:donor/search/search.dart';
import 'package:donor/services/donor.dart';
import 'package:donor/sidebar/sidebar.dart';

class Home extends StatefulWidget {
  static const routeName = 'home';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Donor> allDonors = [];
  List<Donor> displayedDonors = [];
  final DonorService donorService = DonorService();
  bool isLoading = true;
  String? selectedDistrict;

  @override
  void initState() {
    super.initState();
    fetchAllDonors();
  }

  fetchAllDonors() async {
    setState(() {
      isLoading = true;
    });

    await donorService.fetchAllDonors(context).then((donorList) {
      setState(() {
        allDonors = donorList;
        displayedDonors = allDonors; // Initially show all donors
        isLoading = false;
      });
    }).catchError((e) {
      setState(() {
        isLoading = false;
      });
    });
  }

  // Filter donors by the selected district
  void filterDonorsByDistrict() {
    if (selectedDistrict != null) {
      setState(() {
        displayedDonors = allDonors
            .where((donor) => donor.district == selectedDistrict)
            .toList();
      });
    } else {
      // If no district is selected, show all donors
      setState(() {
        displayedDonors = allDonors;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    void navigateToSearchScreen() {
      Navigator.pushNamed(
        context,
        SearchScreen.routeName,
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVaraibles.blueColor,
      ),
      drawer: const SideBar(),
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: GlobalVaraibles.globalGradient),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          onTap: () {
                            navigateToSearchScreen();
                          },
                          decoration: GlobalVaraibles.searchInputDecoration),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Donors',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      SizedBox(
                        width: 142,
                      ),
                      Container(
                        padding: EdgeInsets.all(9),
                        child: DistrictDropdown(
                          selectedDistrict: selectedDistrict,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedDistrict = newValue;
                              filterDonorsByDistrict(); // Filter donors when district changes
                            });
                          },
                          districtList: listItem2,
                        ),
                      ),
                    ],
                  ),
                ),
                isLoading
                    ? Skeleton()
                    : Expanded(
                        child: _buildContent(),
                      ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }

  Widget _buildContent() {
    return GridView.builder(
      itemCount: displayedDonors.length,
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
                displayedDonors[index].name,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                displayedDonors[index].bloodGroup,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                displayedDonors[index].district,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                displayedDonors[index].phoneNumber,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                displayedDonors[index].address,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        );
      },
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }
}
