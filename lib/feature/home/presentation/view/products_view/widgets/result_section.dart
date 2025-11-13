import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_ecommerce/core/utils/app_styles.dart';

class ResultSection extends StatelessWidget {
  const ResultSection({super.key, required this.resultlength});
final int resultlength;
  @override
  Widget build(BuildContext context) {
    return Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$resultlength نتائج',style: AppStyles.bold16,),
        IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/images/filter_icon.svg'))
      ],
    );
  }
}