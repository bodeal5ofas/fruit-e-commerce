import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/core/utils/app_styles.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
       Text('الشحن',style: AppStyles.bold19,),
       SizedBox(height: 20,),
       
      ],
    );
  }
}