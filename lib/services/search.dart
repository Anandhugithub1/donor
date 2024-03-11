import 'dart:convert';

import 'package:donor/global/snackdar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:donor/error/errorhandling.dart';
import 'package:donor/global/global.dart';
import 'package:donor/models/donor.dart';
import 'package:donor/providers/user_provider.dart';
import 'package:provider/provider.dart';

class SearchService {
  Future<List<Donor>> searchBloodGroup({
    required BuildContext context,
    required String query,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Donor> donorList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/donor/search/$query'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSucess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            donorList.add(
              Donor.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackbar(context, 'unexpected error');
    }
    return donorList;
  }
}
