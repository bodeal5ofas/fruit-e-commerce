import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_ecommerce/core/utils/app_colors.dart';
import 'package:fruit_ecommerce/core/utils/app_styles.dart';
import 'package:fruit_ecommerce/feature/home/domain/entity/cart_iteam_entity.dart';
import 'package:fruit_ecommerce/feature/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_ecommerce/feature/home/presentation/cubits/cart_iteam_cubit/cart_iteam_cubit.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/cart_view/widgets/cart_iteam_indicator.dart';

class CartIteam extends StatelessWidget {
  const CartIteam({super.key, required this.cartIteamEntity});
  final CartIteamEntity cartIteamEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartIteamCubit, CartIteamState>(
      buildWhen: (previous, current) {
        if(current is CartIteamUpdateState){
          if(current.cartIteamEntity== cartIteamEntity){
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: AppColors.backGrooundLightGray,
              ),
              top: BorderSide(width: 1, color: AppColors.backGrooundLightGray),
            ),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                color: AppColors.lightGray,
                child: Image.network(
                  cartIteamEntity.productEntity.imageUrl!,
                  height: MediaQuery.sizeOf(context).height * 0.15,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cartIteamEntity.productEntity.name,
                          style: AppStyles.bold13,
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<CartCubit>().removeFromCart(
                              cartIteamEntity,
                            );
                          },
                          icon: Icon(Icons.delete_outline),
                        ),
                      ],
                    ),

                    Text(
                      '${cartIteamEntity.calculateTotalWeight()} كم',
                      style: AppStyles.regular13.copyWith(
                        color: AppColors.orange,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CartIteamIndicator(cartIteamEntity: cartIteamEntity),
                        Text(
                          '${cartIteamEntity.calculateTotalPrice()} جنيه ',
                          style: AppStyles.bold13.copyWith(
                            color: AppColors.orange,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );

    //  ListTile(
    //   shape: Border(
    //     bottom: BorderSide(width: 1,color: AppColors.backGrooundLightGray),
    //     top: BorderSide(width: 1,color: AppColors.backGrooundLightGray),
    //   ),
    //   leading: Container(
    //     color: AppColors.lightGray,
    //     child: Image.asset('assets/images/test_fruit.png',),),

    //     title:
    // //    subtitle: Column(
    //  //     children: [
    //         Text('3 كم',style: AppStyles.regular13.copyWith(color: AppColors.orange),),
    //         // Row(
    //         //   children: [
    //         //     CartIteamIndicator(iteamCount: 3),
    //         //     Spacer(),
    //         //     Text('60 جنيه ',style: AppStyles.bold13.copyWith(color: AppColors.orange),)
    //         //   ],
    //         // )
    //       ],
    //     ),
    //     trailing: Column(
    //       children: [

    //          Text('60 جنيه ',style: AppStyles.bold13.copyWith(color: AppColors.orange),)
    //       ],
    //     ),

    // );
  }
}
