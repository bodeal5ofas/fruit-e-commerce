import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/core/utils/app_colors.dart';
import 'package:fruit_ecommerce/core/utils/app_styles.dart';

class SearchBarSection extends StatelessWidget {
  const SearchBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
      BoxShadow(
        color: Color(0x0A000000), // لون الشادو
        spreadRadius: 2, // انتشار الشادو
        blurRadius: 8, // درجة النعومة
        offset: Offset(0, 3), // الاتجاه (يمين/شمال, فوق/تحت)
      ),
    ],

      ),
      child: TextFormField(
        
        decoration: InputDecoration(
          
          prefixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: AppColors.primary,),),
          suffixIcon: IconButton(onPressed: (){}, icon: Icon( Icons.menu,color: AppColors.lightGray,),),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none
          ),
          hintStyle: AppStyles.regular13.copyWith(color: AppColors.lightGray),
          hint: Text("ابحث عن......."),
          ),
        
      ),
    );
  }
}