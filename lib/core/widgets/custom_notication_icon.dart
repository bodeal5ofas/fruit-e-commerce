import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/core/utils/app_colors.dart';

class CustomNoticationIcon extends StatelessWidget {
  const CustomNoticationIcon({super.key});

  @override
   Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.darkGray,
      radius: 20,
      child: IconButton(onPressed: (){},
       icon: Icon(Icons.notifications_none,size: 25,color: AppColors.primary,),),
    );
  }
}