import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_ecommerce/core/utils/app_colors.dart';
import 'package:fruit_ecommerce/core/utils/app_image.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({super.key, required this.isChecked, required this.onChanged});
final bool isChecked;
final ValueChanged<bool?> onChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isChecked);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: isChecked ? AppColors.primary : Colors.transparent,
          border: Border.all(color: AppColors.primary
          ,width: 1.5,),
          borderRadius: BorderRadius.circular(8),),
      child: isChecked ? Padding(
        padding: const EdgeInsets.all(4.0),
        child: SvgPicture.asset(Assets.assetsImagesCheckBoxIcon),
      ) : null,
      ),
      
    );
  }
}