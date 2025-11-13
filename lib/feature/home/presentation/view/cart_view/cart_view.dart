import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_ecommerce/feature/home/presentation/cubits/cart_iteam_cubit/cart_iteam_cubit.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/cart_view/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartIteamCubit(),
      child: const CartViewBody(),
    );
  }
}
