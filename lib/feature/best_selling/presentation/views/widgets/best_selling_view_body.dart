import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/core/utils/app_styles.dart';
import 'package:fruit_ecommerce/feature/best_selling/presentation/views/widgets/best_seller_app_bar.dart';
import 'package:fruit_ecommerce/feature/best_selling/presentation/views/widgets/best_selling_grid_view.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/home_view/widgets/grid_fruit_iteam.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
   //   crossAxisAlignment: CrossAxisAlignment.start,
        slivers: [
          SliverToBoxAdapter(child: BestSellerAppBar()),
          SliverToBoxAdapter(child: SizedBox(height: 24,)),
           SliverToBoxAdapter(child: Text('الأكثر مبيعًا',style: AppStyles.bold16,)),
            SliverToBoxAdapter(child: SizedBox(height: 8,)),
            GridFruitIteam(products: [],),
        ],
      );
  }
}