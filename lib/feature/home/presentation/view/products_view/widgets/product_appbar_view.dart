import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/core/utils/app_styles.dart';
import 'package:fruit_ecommerce/core/widgets/custom_notication_icon.dart';

class ProductViewAppbar extends StatelessWidget {
  const ProductViewAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Spacer(),
      Text('المنتجات ',style: AppStyles.bold19,),
      Spacer(),
      CustomNoticationIcon(),
    ],);
  }
}