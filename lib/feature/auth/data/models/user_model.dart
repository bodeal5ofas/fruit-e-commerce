import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_ecommerce/feature/auth/domain/entites/user_entity.dart';

class UserModel extends UserEntity{
  UserModel({required super.name, required super.email, required super.uId,});
 toMap() => {
    'name': name, 
    'email': email,
     'uId': uId,
     };
     factory UserModel.fromEntity({required UserEntity user}){
       return UserModel(
         name: user.name, 
         email: user.email, 
         uId: user.uId,
         );
     }
  factory UserModel.fromFirebase({required User user}){
    return UserModel(
      name: user.displayName??'', 
      email: user.email??'', 
      uId: user.uid??'',
      );
  }
  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(
      name: json['name'], 
      email: json['email'], 
      uId: json['uId'],
      );
  }
}