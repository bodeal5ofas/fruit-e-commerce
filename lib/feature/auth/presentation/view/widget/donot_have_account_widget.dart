import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/core/utils/app_colors.dart';
import 'package:fruit_ecommerce/core/utils/app_styles.dart';

class DonotHaveAccountWidget extends StatelessWidget {
  const DonotHaveAccountWidget({
    super.key, required this.fitstTitle, required this.endTitle, this.onTap,
    
  });
final String fitstTitle,endTitle;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(fitstTitle,style: AppStyles.semiBold16.copyWith(color: AppColors.lightGray,),),
        TextButton(onPressed: onTap, child: Text(endTitle,style: AppStyles.semiBold16.copyWith(color: AppColors.primary,),),),
      ],
    );
  }
}