import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_ecommerce/core/errors/custom_exception.dart';
import 'package:fruit_ecommerce/core/errors/failure.dart';
import 'package:fruit_ecommerce/core/helper/constant.dart';
import 'package:fruit_ecommerce/core/helper/shared_prefrence.dart';
import 'package:fruit_ecommerce/core/service/data_service.dart';
import 'package:fruit_ecommerce/core/service/firebase_auth_service.dart';
//import 'package:fruit_ecommerce/core/service/firestore_service.dart';
import 'package:fruit_ecommerce/feature/auth/data/models/user_model.dart';
import 'package:fruit_ecommerce/feature/auth/domain/entites/user_entity.dart';
import 'package:fruit_ecommerce/feature/auth/domain/repos/auth_repo.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class AuthRepoImpl implements AuthRepo{
  FirebaseAuthService firebaseAuth;
  DataService dataService;
  AuthRepoImpl({required this.firebaseAuth,required this.dataService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({required String name,required String email, required String password})async {
   User? user;
    try{
       user =await firebaseAuth.userSignInWithEmailAndPassword(name: name,email: email, password: password);
     var userEntity= UserEntity(name: name, email: email, uId:user.uid);
     await addUser(user: userEntity,);
      return Right(userEntity);
    }
    on CustomException catch(e){
      await deleteUser(user);
      return Left(ServerFailure(message:e.message));
    }
    catch(e){
     await deleteUser(user);
      log('Exception: AutoRepoImpl.CreateUserWithEmailAndPassword= ${e.toString()}');
      return Left(ServerFailure(message:e.toString()));
    }
  }

 Future <void> deleteUser(User? user) async{
    if(user!=null){
    await  firebaseAuth.deleteUser();
    }
  }
  
  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({required String email, required String password}) async{
    try{
      User user =await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      var userEntity=await getUserData(userId: user.uid, path: 'user');
   await   saveUserData(user: userEntity);
      return Right(userEntity);
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
  User? user;
  try {
   user= await firebaseAuth.signInWithGoogle();
  var userEntity=UserModel.fromFirebase(user: user);
  var condition=await dataService.checkDataIsExist(
    path: 'user', 
    documentId: userEntity.uId);
  if (condition) {
    await getUserData(userId: userEntity.uId, path: 'user');
  }
  else{
  await addUser(user: userEntity);
}
   await   saveUserData(user: userEntity);
  return Right(userEntity);
} on Exception catch (e) {
  await deleteUser(user);
  log('Exception: AutoRepoImpl.signInWithGoogle= ${e.toString()}');
  return Left(ServerFailure(message:'لقد حدث خطأ ما, يرجى المحاولة مرة أخرى.'));
}
  }

@override
  Future<Either<Failure, UserEntity>> signInWithFacebook()async{
    User? user;
    try {
       user= await firebaseAuth.signInWithFacebook();
      var userEntity=UserModel.fromFirebase(user: user);
      var condition=await dataService.checkDataIsExist(
    path: 'user', 
    documentId: userEntity.uId);
  if (condition) {
    await getUserData(userId: userEntity.uId, path: 'user');
  }
  else{
  await addUser(user: userEntity);
}
       await   saveUserData(user: userEntity);
      return Right(UserModel.fromFirebase(user: user));
    } on Exception catch (e) {
      await deleteUser(user);
      log('Exception: AutoRepoImpl.signInWithFacebook= ${e.toString()}');
      return Left(ServerFailure(message:'لقد حدث خطأ ما, يرجى المحاولة مرة أخرى.'));
    }
  }
  
  @override
  Future<void> addUser({required UserEntity user}) async{
    // throw CustomException('try agin, in another time.');
   var userEntity= UserModel.fromEntity(user: user).toMap();
 await  dataService.addData(path: 'user', data:userEntity,documentId: user.uId);
  }
  
  @override
  Future<UserEntity> getUserData({required String userId, required String path}) async{
  var json= await dataService.getData(path: path, documentId: userId);
  return UserModel.fromJson(json);
  }
  
  @override
  Future<void> saveUserData({required UserEntity user}) async{
  String json = jsonEncode(UserModel.fromEntity(user: user).toMap());
  log(json);
 await SharedPrefrenceHelper.setString(kUserData, json);
  }
}