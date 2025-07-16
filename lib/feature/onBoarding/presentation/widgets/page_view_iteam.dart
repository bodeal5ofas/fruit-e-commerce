import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_ecommerce/core/helper/constant.dart';
import 'package:fruit_ecommerce/core/helper/shared_prefrence.dart';
import 'package:fruit_ecommerce/core/utils/app_image.dart';
import 'package:fruit_ecommerce/core/utils/app_styles.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/login_view.dart';

class PageViewIteam extends StatelessWidget {
  const PageViewIteam({super.key, required this.image, required this.backgroundImage, required this.subTitle, required this.title, required this.isVisibilty});
final String image, backgroundImage,subTitle;
final Widget title;
final bool isVisibilty;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
           width: double.infinity
           ,
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: Stack(
           // alignment: Alignment.bottomCenter,
            children: [
            Positioned.fill(child: SvgPicture.asset(backgroundImage,fit: BoxFit.fill,)),
            Positioned(bottom: 0,right: 0,left: 0,child: SvgPicture.asset(image)),
            Visibility(
              visible:isVisibilty ,
              child: GestureDetector(
                onTap: () async{
                  await SharedPrefrenceHelper.setBool(prefOnBoardingKey, true);
                  Navigator.of(context).pushReplacementNamed(LoginView.routeName);
                },
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text('تخطي',style: AppStyles.regular13,),
                ),
              ),
            ),
          ],
               
          ),
        ),
           SizedBox(height: 60,),
        title,
        SizedBox(height: 24,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(subTitle,textAlign: TextAlign.center,style: AppStyles.semiBold13,),
        ),
       
      ],
    );
  }
}