import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_ecommerce/core/cubits/product_cubit/product_cubit.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/home_view/widgets/grid_fruit_iteam_bloc_builder.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/home_view/widgets/home_search_bar.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/products_view/widgets/product_appbar_view.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/products_view/widgets/result_section.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              
              ProductViewAppbar(),
              SizedBox(height: 16),
             SearchBarSection(),
               SizedBox(height: 16),
              ResultSection(resultlength: context.read<ProductCubit>().productsLength,),
              SizedBox(height: 16),
            ],
          ),
        ),
      GridFruitIteamBlocBuilder(),
      ],
    );
  }
}