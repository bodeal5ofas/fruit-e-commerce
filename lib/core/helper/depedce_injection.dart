import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_ecommerce/core/cubits/product_cubit/product_cubit.dart';
import 'package:fruit_ecommerce/core/repo/product_repo/product_repo.dart';
import 'package:fruit_ecommerce/core/repo/product_repo/product_repo_impl.dart';
import 'package:fruit_ecommerce/core/service/data_service.dart';
import 'package:fruit_ecommerce/core/service/firebase_auth_service.dart';
import 'package:fruit_ecommerce/core/service/firestore_service.dart';
import 'package:fruit_ecommerce/feature/auth/data/repos/auth_repo_impl.dart';
import 'package:fruit_ecommerce/feature/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<FirestoreService>(() => FirestoreService(),);
  getIt.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService(),);
  getIt.registerLazySingleton<AuthRepo>(() =>AuthRepoImpl(
    firebaseAuth: getIt<FirebaseAuthService>(),
  dataService: getIt<FirestoreService>(),) );

  getIt.registerLazySingleton<ProductRepo>(() => ProductRepoImpl(dataService: getIt<FirestoreService>()),);
  getIt.registerLazySingleton<ProductCubit>(() => ProductCubit(productRepo: getIt<ProductRepo>(),));
}