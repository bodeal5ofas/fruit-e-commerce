

import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/core/utils/app_styles.dart';

class CustomSnackBar {
  static void showSnackBar(String message, BuildContext context) {
    final snackBar = SnackBar(content: Text(message,style: AppStyles.semiBold16,));
    ScaffoldMessenger.of(context).showSnackBar(snackBar,);
  }
}