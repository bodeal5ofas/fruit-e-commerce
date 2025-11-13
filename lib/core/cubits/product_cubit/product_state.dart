part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductFailure extends ProductState {
  final String errMessage;

  ProductFailure({required this.errMessage});
}

final class ProductSucess extends ProductState {
  final List<ProductEntity>products;

  ProductSucess({required this.products});
}