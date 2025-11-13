import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_ecommerce/core/utils/app_styles.dart';
import 'package:fruit_ecommerce/feature/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_ecommerce/feature/home/presentation/cubits/cart_iteam_cubit/cart_iteam_cubit.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/cart_view/widgets/cart_header.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/cart_view/widgets/cart_iteam.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/cart_view/widgets/cart_list_view.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/cart_view/widgets/custom_cart_button.dart';
import 'package:fruit_ecommerce/feature/onBoarding/presentation/widgets/custom_button.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('السلة', style: AppStyles.bold19),
                  SizedBox(height: 16),
                  CartHeader(
                    cartLength: context
                        .watch<CartCubit>()
                        .cartEntity
                        .carts
                        .length,
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            CartListView(
              cartIteams: context.watch<CartCubit>().cartEntity.carts,
            ),
          ],
        ),

        CustomCartButton(),
      ],
    );
  }
}

