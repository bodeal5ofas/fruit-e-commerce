import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_ecommerce/core/utils/app_colors.dart';
import 'package:fruit_ecommerce/core/utils/app_styles.dart';
import 'package:fruit_ecommerce/feature/home/domain/entity/cart_iteam_entity.dart';
import 'package:fruit_ecommerce/feature/home/presentation/cubits/cart_iteam_cubit/cart_iteam_cubit.dart';

class CartIteamIndicator extends StatelessWidget {
  const CartIteamIndicator({super.key, required this.cartIteamEntity});
final CartIteamEntity cartIteamEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: AppColors.primary,
          
        child: IconButton(onPressed: () {
          cartIteamEntity.addCount();
        context.read<CartIteamCubit>().updateCartIteam(cartIteamEntity);
        }, padding: EdgeInsets.all(0),icon: Icon(Icons.add,color: Colors.white,),),
        ),
        Text(cartIteamEntity.count.toString(),style: AppStyles.bold16,),
          CircleAvatar(
          radius: 15,
          backgroundColor: AppColors.lightGray,
        child: IconButton(onPressed: () {
          
          cartIteamEntity.decreaseCount();
          context.read<CartIteamCubit>().updateCartIteam(cartIteamEntity); 
        },padding: EdgeInsets.all(0), icon: Icon(Icons.remove,color: AppColors.backGrooundLightGray,),),
        ),
      ],
    );
  }
}