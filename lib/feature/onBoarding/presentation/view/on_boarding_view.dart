import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/core/helper/constant.dart';
import 'package:fruit_ecommerce/core/helper/shared_prefrence.dart';
import 'package:fruit_ecommerce/core/utils/app_colors.dart';
import 'package:fruit_ecommerce/core/utils/app_image.dart';
import 'package:fruit_ecommerce/core/utils/app_styles.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/login_view.dart';
import 'package:fruit_ecommerce/feature/onBoarding/presentation/widgets/custom_button.dart';
import 'package:fruit_ecommerce/feature/onBoarding/presentation/widgets/page_view_iteam.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});
static const routeName='onBoardingView';

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late PageController pageController;
  int currentPage=0;
  @override
  void initState() {
    pageController=PageController();
    // TODO: implement initState
    pageController.addListener(() {
      currentPage=pageController.page!.round();
      setState(() {
        
      });
    },);
    super.initState();
  }
  @override
  void dispose() {
    pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          Expanded(
            child: PageView(
      //         onPageChanged:(value) {
      //           setState(() {
      //   currentPage=pageController.page!.round();
      // });
      //         } ,
              controller: pageController,
              children: [
                PageViewIteam(isVisibilty: currentPage==0,image: Assets.assetsImagesOnboarding1Image,
                 backgroundImage: Assets.assetsImagesOnboarding1Background, 
                 subTitle: 'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
                 title: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  Text( 'مرحبًا بك في ',style: AppStyles.bold23,),
                  Text( 'Fruit',style: AppStyles.bold23.copyWith(color: AppColors.orange),),
                  Text( 'HUB',style: AppStyles.bold23.copyWith(color: AppColors.primary),),
                 ],),
                 ),
            
                 PageViewIteam(isVisibilty: currentPage==0,image: Assets.assetsImagesOnboarding2Image,
                 backgroundImage: Assets.assetsImagesOnboarding2Background, 
                 subTitle: ' نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
                 title: Text('ابحث وتسوق',style: AppStyles.bold23,)
                 ),
              ],
            ),
          ),
          DotsIndicator(dotsCount: 2,
          decorator: DotsDecorator(
            color:currentPage==1?AppColors.primary: AppColors.lightGreen,
            activeColor: AppColors.primary,
            
            ),),
       SizedBox(height: 29,),
     Visibility(
      visible: currentPage!=0,
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
       child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 24.0),
           child: CustomButton(title: 'ابدا الان',onTap: () async{
           await SharedPrefrenceHelper.setBool(prefOnBoardingKey, true);
             Navigator.of(context).pushReplacementNamed(LoginView.routeName);
           },),
         ),
     ),
       SizedBox(height: 40,)
        ],
      ),),
    );
  }
}