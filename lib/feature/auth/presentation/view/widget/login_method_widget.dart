import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_ecommerce/core/utils/app_colors.dart' show AppColors;
import 'package:fruit_ecommerce/core/utils/app_styles.dart' show AppStyles;

class LoginMethodWidget extends StatelessWidget {
  const LoginMethodWidget({super.key, required this.iconImage, required this.title, this.onTap});
final String iconImage,title;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        
        padding: EdgeInsets.symmetric(vertical: 17),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGray,width: 1.5),
          borderRadius: BorderRadius.circular(16),
          
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(iconImage,),//height: 20,width: 20,fit: BoxFit.fill,),
              Text(title,style: AppStyles.semiBold16,)
            ],
        ),
      ),
    );
  }
}