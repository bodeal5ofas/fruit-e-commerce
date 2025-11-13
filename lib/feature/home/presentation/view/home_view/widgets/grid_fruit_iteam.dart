import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/core/entity/product_entity.dart';
import 'package:fruit_ecommerce/core/widgets/fruit_item.dart';

class GridFruitIteam extends StatelessWidget {
  const GridFruitIteam({super.key, required this.products});
final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return    SliverGrid.builder(
          
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 10,
            childAspectRatio: 163/214
            ), 
        itemBuilder: (context, index) => FruitItem(product: products[index],),);
  }
}