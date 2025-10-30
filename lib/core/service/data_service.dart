import 'package:fruit_ecommerce/feature/auth/domain/entites/user_entity.dart';

abstract class DataService {
  Future<void> addData({required String path,required Map<String,dynamic> data, String ? documentId});
  Future<Map<String,dynamic>> getData({required String path,required String documentId});
  Future<bool> checkDataIsExist({required String path,required String documentId});
}