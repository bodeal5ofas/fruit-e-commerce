import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_ecommerce/core/cubits/product_cubit/product_cubit.dart';
import 'package:fruit_ecommerce/core/helper/depedce_injection.dart';
import 'package:fruit_ecommerce/core/repo/product_repo/product_repo.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/products_view/widgets/product_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(productRepo: getIt<ProductRepo>())..getProductsData(),
      child: const ProductViewBody(),
    );;
  }
}