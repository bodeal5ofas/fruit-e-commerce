import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/core/utils/app_colors.dart';
import 'package:fruit_ecommerce/core/utils/app_styles.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/widget/custom_checkbox.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key, required this.onChanged});
final ValueChanged<bool> onChanged;
  @override
  State<TermsAndConditionsWidget> createState() => _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  bool isActiveCheckedBox=false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckbox(
          isChecked: isActiveCheckedBox,
        onChanged: (value) {
          isActiveCheckedBox=value!;
          widget.onChanged(isActiveCheckedBox);
          setState(() {});
        },
        ),
      //  Checkbox(value: false, onChanged: (value){}, ),
        SizedBox(width: 16,),
        Expanded(
         // width: MediaQuery.sizeOf(context).width -(32+16+24+50),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال انشاء حساب , فانك توافق علي ',
                  style: AppStyles.semiBold13.copyWith(color: Color(0xff616A6B),),
                ),
                TextSpan(
                  text: 'الشروط والاحكام الخاصه بنا',
                  style: AppStyles.semiBold13.copyWith(
                    color: AppColors.lightGreen,
                  ),
                ),
              ],
            ),
          ),
        ),
    //           Text('من خلال انشاء حساب , فانك توافق علي ',
    //           maxLines: 2,
    //           style: AppStyles.semiBold13.copyWith(color: AppColors.primary,
    //           ),
    //           ),
    //           Text('الشروط والاحكام الخاصه بنا',
    // maxLines: 2,
    //           style: AppStyles.semiBold13.copyWith(
    //             color: Color(0xff616A6B),
    //           ),),
        ],
    );
  }
}