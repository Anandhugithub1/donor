import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:donor/error/errorhandling.dart';
import 'package:donor/global/global.dart';
import 'package:donor/global/snackdar.dart';
import 'package:donor/models/donor.dart';
import 'package:donor/providers/user_provider.dart';
import 'package:provider/provider.dart';

class DonorFilter {
  Future<List<Donor>> fetchDistrictDonors({
    required BuildContext context,
    required String district,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Donor> donorList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/donor?category=$district'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSucess: () {
          final List<dynamic> responseData = jsonDecode(res.body);
          donorList = responseData.map((data) => Donor.fromJson(data)).toList();
        },
      );
    } catch (e) {
      showSnackbar(context, e.toString());
    }
    return donorList;
  }
}
