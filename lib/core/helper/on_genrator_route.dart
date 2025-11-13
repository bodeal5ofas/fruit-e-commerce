import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/login_view.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/signup_view.dart';
import 'package:fruit_ecommerce/feature/best_selling/presentation/views/best_selling_view.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/checkout_view/checkout_view.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/master_view.dart';
import 'package:fruit_ecommerce/feature/onBoarding/presentation/view/on_boarding_view.dart';
import 'package:fruit_ecommerce/feature/splash/presentation/view/splash_view.dart';

Route<dynamic> onGenratorRoute(RouteSettings setting){
  switch (setting.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => SplashView(),);
      case CheckoutView.routeName:
      return MaterialPageRoute(builder: (context) => CheckoutView(),);
    case MasterView.routeName:
      return MaterialPageRoute(builder: (context) => MasterView(),);
      case BestSellingView.routeName:
      return MaterialPageRoute(builder: (context) => BestSellingView(),);
      case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => OnBoardingView(),);
      case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => SignupView(),);
      case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => LoginView(),);
      
    default:
   return MaterialPageRoute(builder: (context) => Scaffold(),);
  }
}