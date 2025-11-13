import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_ecommerce/core/service/data_service.dart';
import 'package:fruit_ecommerce/feature/auth/data/models/user_model.dart';
import 'package:fruit_ecommerce/feature/auth/domain/entites/user_entity.dart';

class FirestoreService extends DataService{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({required String path, required Map<String, dynamic> data,String ? documentId})async{
   
    CollectionReference users = firestore.collection(path);
   if (documentId != null) {
    users.doc(documentId).set(data).then((value) => log("User Added Suceesfully with ID")).catchError((error) => log("Failed to add user: $error"));
}else{
  await  users
         .add(data)
         .then((value) => log("User Added Suceesfully"))
         .catchError((error) => log("Failed to add user: $error"));
}
}

  @override
  Future< dynamic>getData({required String path,  String? documentId,Map<String,dynamic>? query}) async{
  if(documentId!=null){
    var data =await firestore.collection(path).doc(documentId).get();
  return  data.data() as Map<String, dynamic>;
  }else{
     Query<Map<String,dynamic>> queryResult = firestore.collection(path);
    if(query != null){
      if (query['orderBy'] != null) {
  var orderByField=query['orderBy'];
  
  var querydescending=query['descending'];
  queryResult=queryResult.orderBy(orderByField,descending: querydescending);
}
if(query['limit'] != null){
  var queryLimit=query['limit'];
  queryResult=queryResult.limit(queryLimit);
}
    }
    var products=await queryResult.get();
    
  var result= products.docs.map((e) => e.data()).toList();
  return result;
  
  }
  }
  
  @override
  Future<bool> checkDataIsExist({required String path, required String documentId})async {
   var data= await firestore.collection(path).doc(documentId).get();
 return data.exists;
  }
}