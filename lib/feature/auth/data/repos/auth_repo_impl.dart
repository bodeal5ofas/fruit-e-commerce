import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_ecommerce/core/errors/custom_exception.dart';
import 'package:fruit_ecommerce/core/errors/failure.dart';
import 'package:fruit_ecommerce/core/service/firebase_auth_service.dart';
import 'package:fruit_ecommerce/feature/auth/data/models/user_model.dart';
import 'package:fruit_ecommerce/feature/auth/domain/entites/user_entity.dart';
import 'package:fruit_ecommerce/feature/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo{
  FirebaseAuthService firebaseAuth;
  AuthRepoImpl({required this.firebaseAuth});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({required String name,required String email, required String password})async {
    try{
      User user =await firebaseAuth.userSignInWithEmailAndPassword(email: email, password: password);
      return Right(UserModel.fromFirebase(user: user));
    }
    on CustomException catch(e){
      return Left(ServerFailure(message:e.message));
    }
    catch(e){
      log('Exception: AutoRepoImpl.CreateUserWithEmailAndPassword= ${e.toString()}');
      return Left(ServerFailure(message:e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({required String email, required String password}) async{
    try{
      User user =await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return Right(UserModel.fromFirebase(user: user));
    }
    on CustomException catch(e){
      return Left(ServerFailure(message:e.message));
    }
    catch(e){
      log('Exception: AutoRepoImpl.signInWithEmailAndPassword= ${e.toString()}');
      return Left(ServerFailure(message:e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async{
  try {
  User user= await firebaseAuth.signInWithGoogle();
  return Right(UserModel.fromFirebase(user: user));
} on Exception catch (e) {
  log('Exception: AutoRepoImpl.signInWithGoogle= ${e.toString()}');
  return Left(ServerFailure(message:'لقد حدث خطأ ما, يرجى المحاولة مرة أخرى.'));
}
  }

  Future<Either<Failure, UserEntity>> signInWithFacebook()async{
    try {
      User user= await firebaseAuth.signInWithFacebook();
      return Right(UserModel.fromFirebase(user: user));
    } on Exception catch (e) {
      log('Exception: AutoRepoImpl.signInWithFacebook= ${e.toString()}');
      return Left(ServerFailure(message:'لقد حدث خطأ ما, يرجى المحاولة مرة أخرى.'));
    }
  }
}