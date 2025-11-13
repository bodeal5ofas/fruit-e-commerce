import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/feature/best_selling/presentation/views/widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
static const String routeName = 'best-selling';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:  16.0,vertical: 16),
          child: BestSellingViewBody(),
        )
      ),
    );
  }
}