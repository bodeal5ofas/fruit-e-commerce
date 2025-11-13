import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/core/utils/app_styles.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key, required this.cartLength});
final int cartLength;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10,),
       color: Color(0xffEBF9F1),
     
      child: Center(child: Text('لديك $cartLength منتجات في سله التسوق',style: AppStyles.regular13,)),
    );
  }
}