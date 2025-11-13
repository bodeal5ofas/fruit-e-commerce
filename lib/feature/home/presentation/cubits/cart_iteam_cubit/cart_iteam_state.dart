part of 'cart_iteam_cubit.dart';

sealed class CartIteamState  {
  const CartIteamState();

 
}

final class CartIteamInitial extends CartIteamState {}
final class CartIteamUpdateState extends CartIteamState {
  final CartIteamEntity cartIteamEntity;
  const CartIteamUpdateState({required this.cartIteamEntity});
}
