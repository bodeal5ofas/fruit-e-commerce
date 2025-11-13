import 'package:dartz/dartz.dart';
import 'package:fruit_ecommerce/core/errors/failure.dart';
import 'package:fruit_ecommerce/feature/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure,UserEntity>> createUserWithEmailAndPassword({required String name,required String email,required String password});

  Future<Either<Failure,UserEntity>> signInWithEmailAndPassword({required String email,required String password});

  Future<Either<Failure,UserEntity>> signInWithGoogle();

  Future<Either<Failure,UserEntity>> signInWithFacebook();
  Future<void> addUser({required UserEntity user});
  Future<void> saveUserData({required UserEntity user});
  Future<UserEntity>getUserData({required String userId,required String path});
}
