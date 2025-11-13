import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_ecommerce/core/helper/get_user.dart';
import 'package:fruit_ecommerce/core/utils/app_colors.dart';
import 'package:fruit_ecommerce/core/utils/app_styles.dart';
import 'package:fruit_ecommerce/core/widgets/custom_notication_icon.dart';

class HomeViewAppbar extends StatelessWidget {
  const HomeViewAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(backgroundImage: AssetImage('assets/images/person_logo.png',),
          backgroundColor: AppColors.lightGreen,
          radius: 30,
          ),
      SizedBox(width: 12,),
        Column(
          children: [
            Text('صباح الخير !..',
            style: AppStyles.regular13.copyWith(fontSize: 16,color: AppColors.lightGray),),
            Text(getUser()?.name??"",style: AppStyles.bold16,),
          ],

        ),
        Spacer(),
        CustomNoticationIcon(),
     
      ],
    );
  }
}

