import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fruit_ecommerce/core/entity/product_entity.dart';
import 'package:fruit_ecommerce/core/errors/failure.dart';
import 'package:fruit_ecommerce/core/models/product_model.dart';
import 'package:fruit_ecommerce/core/repo/product_repo/product_repo.dart';
import 'package:fruit_ecommerce/core/service/data_service.dart';

class ProductRepoImpl extends ProductRepo{
 final DataService dataService;

  ProductRepoImpl({required this.dataService});
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async{
    try {
  var data =await dataService.getData(
    path: 'products',
    query: {
      'orderBy': 'sellingCount',
      'limit': 10,
      'descending': true
    }
    ) as List<Map<String,dynamic>>;
   var reult= data.map((e) => ProductModel.fromJson(e),).toList();
   
  return Right(reult.map((e) => e.toProductEntity()).toList());
}  catch (e) {
  log('ProductReoImpl.getBestSellingProductsData:$e');
  return Left(ServerFailure(message: 'Failed to get Best Selling Product Data'));
}
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsData() async{
    
 try {
  var data =await dataService.getData(path: 'products') as List<Map<String,dynamic>>;
   var reult= data.map((e) => ProductModel.fromJson(e),).toList();
   
  return Right(reult.map((e) => e.toProductEntity()).toList());
}  catch (e) {
  log('ProductReoImpl.getProductsData:$e');
  return Left(ServerFailure(message: 'Failed to get Product Data'));
}
  }
}