import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/feature/onBoarding/presentation/view/on_boarding_view.dart';
import 'package:fruit_ecommerce/feature/splash/presentation/view/splash_view.dart';

Route<dynamic> onGenratorRoute(RouteSettings setting){
  switch (setting.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => SplashView(),);
      case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => OnBoardingView(),);
      
    default:
   return MaterialPageRoute(builder: (context) => Scaffold(),);
  }
}