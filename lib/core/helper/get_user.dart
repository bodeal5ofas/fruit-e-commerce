import 'dart:convert';

import 'package:fruit_ecommerce/core/helper/constant.dart';
import 'package:fruit_ecommerce/core/helper/shared_prefrence.dart';
import 'package:fruit_ecommerce/feature/auth/data/models/user_model.dart';
import 'package:fruit_ecommerce/feature/auth/domain/entites/user_entity.dart';

UserEntity? getUser(){
  String jsonString = SharedPrefrenceHelper.getString(kUserData);
  if(jsonString != null && jsonString.isNotEmpty && jsonString != '') {
    return UserModel.fromJson(json.decode(jsonString));
  }
 
}