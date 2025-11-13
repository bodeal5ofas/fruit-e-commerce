import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/core/utils/app_colors.dart';
import 'package:fruit_ecommerce/core/utils/app_styles.dart';
import 'package:fruit_ecommerce/feature/best_selling/presentation/views/best_selling_view.dart';

class BestSellerSectionAppbar extends StatelessWidget {
  const BestSellerSectionAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
          Text('الأكثر مبيعًا',style: AppStyles.bold16,),
          TextButton(onPressed: (){
            Navigator.pushNamed(context, BestSellingView.routeName);
          },
           child: Text('المزيد',style: AppStyles.regular13.copyWith(color: AppColors.lightGray),),),
      ],
    );
  }
}