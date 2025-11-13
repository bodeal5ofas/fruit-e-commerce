import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/feature/home/domain/entity/cart_iteam_entity.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/cart_view/widgets/cart_iteam.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key, required this.cartIteams});
final List<CartIteamEntity> cartIteams ;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount:cartIteams.length,
      itemBuilder:(context, index) {
       return Padding(
         padding: const EdgeInsets.only( bottom: 8.0),
         child: CartIteam(
          cartIteamEntity: cartIteams[index],
         ),
       );
      } ,
    );
  }
}