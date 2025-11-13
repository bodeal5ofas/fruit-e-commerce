//import 'package:equatable/equatable.dart';
import 'dart:developer';

import 'package:fruit_ecommerce/core/entity/product_entity.dart';
import 'package:fruit_ecommerce/feature/home/domain/entity/cart_iteam_entity.dart';

class CartEntity {
 final List<CartIteamEntity> carts;

const  CartEntity({required this.carts});

  addCartIteam(ProductEntity productEntity){
    bool isFound= isExist(productEntity);
    var cartIteamEntity=getCartIteam(productEntity);
    if(isFound){
      cartIteamEntity.addCount();
    }else{
        carts.add(CartIteamEntity(productEntity: productEntity,count: 1));
    }
    
  }

  removeCartIteam(CartIteamEntity cartIteamEntity){
    log(carts.toString());
    carts.remove(cartIteamEntity);
    // for (var cart in carts) {
    //   if(cart.productEntity==cartIteamEntity.productEntity){
    //     carts.remove(cartIteamEntity);
    //   }
    // }
   
  }

 bool isExist(ProductEntity productEntity){
  for (var cartIteamEntity in carts) {
    if(cartIteamEntity.productEntity==productEntity){
      return true;
    }
  }
  return false;
 }

  getTotalPrice(){
    double totalPrice=0;
    for (var cartIteamEntity in carts) {
      totalPrice+=cartIteamEntity.calculateTotalPrice();
    }
    return totalPrice;
  }
 CartIteamEntity getCartIteam(ProductEntity productEntity){
  for (var cartIteamEntity in carts) {
    if(cartIteamEntity.productEntity==productEntity){
      return cartIteamEntity;
    }
  }
  return CartIteamEntity(productEntity: productEntity,count: 1);
 }
 
}