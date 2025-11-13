import 'package:dartz/dartz.dart';
import 'package:fruit_ecommerce/core/entity/product_entity.dart';
import 'package:fruit_ecommerce/core/errors/failure.dart';
import 'package:fruit_ecommerce/core/models/product_model.dart';

abstract class ProductRepo {

  Future<Either<Failure,List<ProductEntity>>> getProductsData();
  Future<Either<Failure,List<ProductEntity>>> getBestSellingProducts();
}