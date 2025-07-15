import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
            Align(alignment: Alignment.topLeft,child: SvgPicture.asset('assets/images/svg/splash_planet.svg')),
            
            Center(child: SvgPicture.asset('assets/images/svg/splash_logo.svg'),),
          
          SvgPicture.asset('assets/images/svg/splach_points.svg'),
          ],
        ),
      ),
    );
  }
  
  void executeNavigation() 
{
  Future.delayed(Duration(seconds: 4)).then((value) {
    Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
  },);
}
}