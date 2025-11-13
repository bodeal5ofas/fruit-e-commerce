import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_ecommerce/feature/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_ecommerce/feature/home/presentation/cubits/cart_iteam_cubit/cart_iteam_cubit.dart';
import 'package:fruit_ecommerce/feature/onBoarding/presentation/widgets/custom_button.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartIteamCubit, CartIteamState>(
      builder: (context, state) {
        return Positioned(
          right: 0,
          left: 0,
          bottom: MediaQuery.sizeOf(context).height * 0.07,
          child: CustomButton(
            title:
                'الدفع  ${context.watch<CartCubit>().cartEntity.getTotalPrice()} جنيه',
            onTap: () {},
          ),
        );
      },
    );
  }
}
