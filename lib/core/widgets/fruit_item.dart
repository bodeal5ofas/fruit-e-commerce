import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_ecommerce/core/entity/product_entity.dart';
import 'package:fruit_ecommerce/core/utils/app_colors.dart';
import 'package:fruit_ecommerce/core/utils/app_styles.dart';
import 'package:fruit_ecommerce/feature/home/presentation/cubits/cart_cubit/cart_cubit.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.product});
final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Container(
    //  padding: const EdgeInsets.symmetric(horizontal:  8.0,vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.backGrooundLightGray,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(onPressed: (){},
             icon: Icon(Icons.favorite_border)
             ,),
          ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal:  8.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(height: 4,),
                 AspectRatio(
                  aspectRatio: 131/99,
                  
                   child: ClipRRect(
                     borderRadius: BorderRadiusGeometry.circular(1000),
                     child: Image.network(product.imageUrl!,
                  //   fit: BoxFit.contain,
                     ),
                   ),
                 ),
                 SizedBox(height: 20,),
                 Text(product.name,style: AppStyles.semiBold13,),
                 SizedBox(height: 4,),
                 Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(product.price.toString(),style: AppStyles.bold13.copyWith(color: AppColors.orange),),
                    Text(' / ${product.unitAmount}',style: AppStyles.semiBold13.copyWith(color: AppColors.orange),),
                    Spacer(),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.primary,
                      child: IconButton(onPressed: (){
                        context.read<CartCubit>().addToCart(product);
                      }, icon: Icon(Icons.add,color: Colors.white,),),
                    )
                  ],
                 ),
               ],
             ),
           )
        ],
      ),
    );
  }
}