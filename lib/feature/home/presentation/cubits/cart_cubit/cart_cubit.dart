import 'package:bloc/bloc.dart';
import 'package:fruit_ecommerce/core/entity/product_entity.dart';
import 'package:fruit_ecommerce/feature/home/domain/entity/cart_entity.dart';
import 'package:fruit_ecommerce/feature/home/domain/entity/cart_iteam_entity.dart';
//import 'package:fruit_ecommerce/feature/home/presentation/view/cart_view/widgets/cart_iteam.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity=CartEntity(carts: []);

  void addToCart(ProductEntity  productEntity ){
    cartEntity.addCartIteam(productEntity);
    emit(CartIteamAdd());
  }
  void removeFromCart(CartIteamEntity  cartIteamEntity ){
    cartEntity.removeCartIteam(cartIteamEntity);
    emit(CartIteamRemove());
  }
}
