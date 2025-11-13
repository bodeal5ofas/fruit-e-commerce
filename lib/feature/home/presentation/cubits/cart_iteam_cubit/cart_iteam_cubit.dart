import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_ecommerce/feature/home/domain/entity/cart_iteam_entity.dart';

part 'cart_iteam_state.dart';

class CartIteamCubit extends Cubit<CartIteamState> {
  CartIteamCubit() : super(CartIteamInitial());

  void updateCartIteam(CartIteamEntity cartIteamEntity){
    emit(CartIteamUpdateState(cartIteamEntity:  cartIteamEntity));
  }
}
