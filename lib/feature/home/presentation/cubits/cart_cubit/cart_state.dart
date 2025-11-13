part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartIteamAdd extends CartState {}

final class CartIteamRemove extends CartState {}