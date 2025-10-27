import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/core/utils/app_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
static const routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Home',style:  AppStyles.bold23.copyWith(color: Colors.black)),),
    );
  }
}