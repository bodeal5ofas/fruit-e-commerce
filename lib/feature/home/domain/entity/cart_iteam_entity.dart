import 'package:equatable/equatable.dart';
import 'package:fruit_ecommerce/core/entity/product_entity.dart';

class CartIteamEntity extends Equatable {
  final ProductEntity productEntity;
  int count;

  CartIteamEntity({required this.productEntity,this.count=0});

  addCount(){
    count++;
  }
  decreaseCount(){
    count--;
  }
  calculateTotalPrice(){
    return productEntity.price * count;
  }
  calculateTotalWeight(){
    return productEntity.unitAmount * count;
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [productEntity];
}