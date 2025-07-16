import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_ecommerce/core/helper/constant.dart';
import 'package:fruit_ecommerce/core/helper/shared_prefrence.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/login_view.dart';
import 'package:fruit_ecommerce/feature/onBoarding/presentation/view/on_boarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
static const routeName="splashView";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    executeNavigation();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(alignment: Alignment.topLeft,child: SvgPicture.asset('assets/images/splash_planet.svg')),
            
            Center(child: SvgPicture.asset('assets/images/splash_logo.svg'),),
          
          SvgPicture.asset('assets/images/splach_points.svg'),
          ],
        ),
      ),
    );
  }
/// to navigate to onBoarding view  
  void executeNavigation() 
{
 final bool isViewOnBoarding= SharedPrefrenceHelper.getBool(prefOnBoardingKey);
  Future.delayed(Duration(seconds: 4)).then((value) {
    Navigator.pushReplacementNamed(context,isViewOnBoarding==true?LoginView.routeName: OnBoardingView.routeName);
  },);
}
}