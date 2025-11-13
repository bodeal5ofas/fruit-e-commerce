import 'package:flutter/material.dart';

class BottomNavigationIteamEntity {
  final String title;
  final IconData activeIcon,inActiveIcon;

  BottomNavigationIteamEntity({required this.title, required this.activeIcon, required this.inActiveIcon});

  static List<BottomNavigationIteamEntity> get bottomNavigationIteamEntityList => [
    BottomNavigationIteamEntity
    (title: "الرئيسية",
     activeIcon: Icons.home, 
     inActiveIcon: Icons.home_outlined),
    BottomNavigationIteamEntity(
      title: "المنجات", 
      activeIcon: Icons.category,
       inActiveIcon: Icons.category_outlined),
    BottomNavigationIteamEntity(
      title: "سله التسوق",
       activeIcon: Icons.shopping_cart,
        inActiveIcon: Icons.shopping_cart_outlined),
    BottomNavigationIteamEntity(
      title: "حسابي",
       activeIcon: Icons.person_2,
        inActiveIcon: Icons.person_2_outlined),
  ];
}
