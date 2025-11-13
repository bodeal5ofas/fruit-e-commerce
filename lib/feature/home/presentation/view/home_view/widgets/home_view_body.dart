import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_ecommerce/core/cubits/product_cubit/product_cubit.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/home_view/widgets/best_seller_section_appbar.dart';
//import 'package:fruit_ecommerce/feature/home/presentation/view/home_view/widgets/feature_iteam.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/home_view/widgets/feature_list.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/home_view/widgets/grid_fruit_iteam.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/home_view/widgets/grid_fruit_iteam_bloc_builder.dart';
//import 'package:fruit_ecommerce/core/widgets/fruit_item.dart';
//import 'package:fruit_ecommerce/feature/home/presentation/view/home_view/widgets/grid_fruit_iteam.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/home_view/widgets/home_search_bar.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/home_view/widgets/home_view_appbar.dart';
//import 'package:skeletonizer/skeletonizer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HomeViewAppbar(),
              SizedBox(height: 16),
              SearchBarSection(),
              SizedBox(height: 12),
              FeatureList(),
              SizedBox(height: 12),
              BestSellerSectionAppbar(),
            ],
          ),
        ),
        GridFruitIteamBlocBuilder(),
      ],
    );
  }
}

