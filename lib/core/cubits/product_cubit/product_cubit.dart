import 'package:bloc/bloc.dart';
import 'package:fruit_ecommerce/core/entity/product_entity.dart';
import 'package:fruit_ecommerce/core/repo/product_repo/product_repo.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo productRepo;
   int productsLength=0;
  ProductCubit({required this.productRepo}) : super(ProductInitial());

  Future<void> getProductsData()async{
    emit(ProductLoading());
  var result= await  productRepo.getProductsData();
  result.fold((error) {
    emit(ProductFailure(errMessage: error.message));
  }, (products) {
    emit(ProductSucess(products: products));
  },);
  }
  Future<void> getBestSellingProductsData()async{
    emit(ProductLoading());
  var result= await  productRepo.getBestSellingProducts();
  result.fold((error) {
    emit(ProductFailure(errMessage: error.message));
  }, (products) {
    productsLength=products.length;
    emit(ProductSucess(products: products));
  },);
  }
}
