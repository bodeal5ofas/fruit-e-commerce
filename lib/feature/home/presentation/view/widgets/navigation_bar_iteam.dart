import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/core/utils/app_colors.dart';
import 'package:fruit_ecommerce/core/utils/app_styles.dart';
import 'package:fruit_ecommerce/feature/home/domain/entity/bottom_navigation_Iteam_entity.dart';

class NavigationBarIteam extends StatelessWidget {
  const NavigationBarIteam({super.key, required this.bottomNavigationIteamEntity, required this.isSelected});
final BottomNavigationIteamEntity bottomNavigationIteamEntity;
final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return isSelected? ActiveNavigationBarIteam(iconData: bottomNavigationIteamEntity.activeIcon, title: bottomNavigationIteamEntity.title)
    :Icon(bottomNavigationIteamEntity.inActiveIcon);
  }
}
class ActiveNavigationBarIteam extends StatelessWidget {
  const ActiveNavigationBarIteam({super.key, required this.iconData, required this.title});
final IconData iconData;
final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkGray,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.lightGreen,
            radius: 20,
            child: Icon(iconData,color: Colors.white,),
          ),
          SizedBox(width: 8,),
            Text(title,style: AppStyles.semiBold13.copyWith(fontSize: 11,color: AppColors.lightGreen),)
        ],
      ),
    );
  }
}