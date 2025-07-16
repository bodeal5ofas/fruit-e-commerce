import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/core/utils/app_colors.dart';
import 'package:fruit_ecommerce/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.title});
final  void Function()?  onTap;
final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(onPressed: onTap,
       
      style: TextButton.styleFrom(
        backgroundColor: AppColors.primary,
        padding: EdgeInsets.symmetric(vertical: 16),
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24),),
        
      ),
        child:Text(title,style:  AppStyles.bold16.copyWith(color: Colors.white),) ,
      ),
    );
  }
}