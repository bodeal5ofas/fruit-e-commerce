import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/core/utils/app_colors.dart';
import 'package:fruit_ecommerce/core/utils/app_styles.dart';

class BestSellerAppBar extends StatelessWidget {
  const BestSellerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: AppColors.lightGray,width: 1.5),
            borderRadius: BorderRadius.circular(50),
          ),
          child: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios_new,),),
        ),
         Text('الأكثر مبيعًا',style: AppStyles.bold16,),
        CircleAvatar(
          backgroundColor: AppColors.darkGray,
          radius: 20,
          child: IconButton(onPressed: (){},
           icon: Icon(Icons.notifications_none,size: 25,color: AppColors.primary,),),
        )
      ],
    );
  }
}