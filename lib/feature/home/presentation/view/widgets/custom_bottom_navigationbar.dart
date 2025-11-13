import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/core/utils/app_colors.dart';
import 'package:fruit_ecommerce/feature/home/domain/entity/bottom_navigation_Iteam_entity.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/widgets/navigation_bar_iteam.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onTap});
 final ValueChanged<int> onTap;

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
 int currentIndex=0;
 var navigationIteams=BottomNavigationIteamEntity.bottomNavigationIteamEntityList;
   @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal:  8.0),
      child: BottomNavigationBar(landscapeLayout:BottomNavigationBarLandscapeLayout.linear ,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        
      
        elevation: 0,
      //  backgroundColor: Colors.transparent,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.moreDarkGray,
        currentIndex:currentIndex ,
        
        onTap: (value) {
          currentIndex=value;
          setState(() {
            
          });
          widget.onTap(currentIndex);
        },
        items:[
          BottomNavigationBarItem(
            icon: NavigationBarIteam(bottomNavigationIteamEntity:navigationIteams[0] ,
            
             isSelected: currentIndex==0),
            label: navigationIteams[0].title,
          ),
          BottomNavigationBarItem(
            icon: NavigationBarIteam(bottomNavigationIteamEntity:navigationIteams[1] ,
            
             isSelected: currentIndex==1),
            label: navigationIteams[1].title,
          ),
                  BottomNavigationBarItem(
            icon: NavigationBarIteam(bottomNavigationIteamEntity:navigationIteams[2] ,
            
             isSelected: currentIndex==2),
            label: navigationIteams[2].title,
          ),
          BottomNavigationBarItem(
            icon: NavigationBarIteam(bottomNavigationIteamEntity:navigationIteams[3] ,
            
             isSelected: currentIndex==3),
            label: navigationIteams[3].title,
          ),
        ],),
    );
  }
}