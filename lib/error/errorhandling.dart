import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:donor/global/snackdar.dart';

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSucess,
}) {
  switch (response.statusCode) {
    case 200:
      onSucess();
      break;
    case 400:
      showSnackbar(context, jsonDecode(response.body)['msg']);
      break;
    case 404:
      showSnackbar(context, '');
    case 500:
      showSnackbar(context, jsonDecode(response.body)['msg']);
      break;

    default:
      showSnackbar(context, response.body);
  }
}
