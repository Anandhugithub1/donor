import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:donor/error/errorhandling.dart';
import 'package:donor/global/global.dart';
import 'package:donor/global/snackdar.dart';
import 'package:donor/models/donor.dart';
import 'package:donor/providers/user_provider.dart';
import 'package:provider/provider.dart';

class DonorService {
  void addDonor({
    required BuildContext context,
    required String name,
    required String district,
    required String address,
    required String phoneNumber,
    required String age,
    required String bloodGroup,
  }) async {
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);

      Donor donorData = Donor(
          id: '',
          name: name,
          district: district,
          address: address,
          phoneNumber: phoneNumber,
          age: age,
          bloodGroup: bloodGroup);

      http.Response response = await http.post(
        Uri.parse('$uri/donor/add'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token
        },
        body: donorData.toJson(),
      );

      httpErrorHandle(
          response: response,
          context: context,
          onSucess: () {
            showSnackbar(context, 'donor added sucessfully');
          });
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Donor>> fetchAllDonors(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Donor> donorList = [];
    try {
      http.Response response = await http.get(
        Uri.parse('$uri/donor/all'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token
        },
      );

      httpErrorHandle(
          response: response,
          context: context,
          onSucess: () {
            for (int i = 0; i < jsonDecode(response.body).length; i++) {
              donorList.add(
                Donor.fromJson(
                  jsonEncode(
                    jsonDecode(response.body)[i],
                  ),
                ),
              );
            }

            print(donorList);
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
    return donorList;
  }
}
