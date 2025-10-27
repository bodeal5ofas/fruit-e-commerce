import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/core/utils/app_colors.dart';
import 'package:fruit_ecommerce/core/utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintText, this.suffixIcon, this.validator, this.onSaved, this.obscureText});
  final String hintText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),),
        fillColor: AppColors.darkGray ,
        filled: true,
        
        hintText: hintText,
        hintStyle: AppStyles.bold13,
        suffixIcon: suffixIcon,
        
        ),
        obscureText: obscureText ?? false,
        validator: validator,
        onSaved: onSaved,
    );
  }
}