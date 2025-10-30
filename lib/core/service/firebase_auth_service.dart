import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruit_ecommerce/core/errors/custom_exception.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<void> deleteUser()async{
    await FirebaseAuth.instance.currentUser!.delete();
  }
  Future<User> userSignInWithEmailAndPassword({required String name,required String email,required String password })async{
    try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
  
  return credential.user!;
} on FirebaseAuthException catch (e) {
      log('Exception: FirebaseAuthService.CreateUserWithEmailAndPassword= ${e.toString()}');
  if (e.code == 'weak-password') {
   throw CustomException('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
   throw CustomException('The account already exists for that email.');
  }else{
     throw CustomException('There is an errror occured, please try again.');
  }
} catch (e) {
  log('Exception: FirebaseAuthService.CreateUserWithEmailAndPassword= ${e.toString()}');
 throw CustomException('There is an errror occured, please try again.');
}
  }


  Future<User> signInWithEmailAndPassword({required String email,required String password})async{
    try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password
  );
    return credential.user!;

} on FirebaseAuthException catch (e) {
  log('Exception: FirebaseAuthService.signInWithEmailAndPassword= ${e.toString()}');
  if (e.code == 'user-not-found') {
    throw CustomException('البريد الالكتروني او الباسورد غير صحيح');
  }else if(e.code == 'invalid-credential') {
    throw CustomException('البريد الالكتروني او الباسورد غير صحيح');
  } else if (e.code == 'wrong-password') {
    throw CustomException('البريد الالكتروني او الباسورد غير صحيح');
  }else{
     throw CustomException('يوجد خطأ ما, يرجى المحاولة مرة أخرى.');
  }
}catch (e){
  log('Exception: FirebaseAuthService.signInWithEmailAndPassword= ${e.toString()}');
 throw CustomException('يوجد خطأ ما, يرجى المحاولة مرة أخرى. ');
}

  }

  Future<User> signInWithGoogle() async {
    final googlesignin= GoogleSignIn.instance;
    await googlesignin.initialize(
      serverClientId: '867318709601-puuvmjhs62puf0plujb2qk52j6r9l9mf.apps.googleusercontent.com',
    );
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await googlesignin.authenticate();
   try {
  if (googleUser == null) {
     throw Exception('تم إلغاء تسجيل الدخول من المستخدم.');
   }
  
  
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;
  
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      
      idToken: googleAuth.idToken);
  
    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
} catch (e) {
    log('Exception: FirebaseAuthService.signInWithGoogle= ${e.toString()}');
    rethrow;
  }

}

Future<User> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

  // Once signed in, return the UserCredential
  return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;
}




//
//  Future<UserCredential> signInWithGoogle() async {
//   try {
//     // إنشاء كائن GoogleSignIn
//     final GoogleSignIn googleSignIn = GoogleSignIn.instance;

//     // بدء عملية تسجيل الدخول
//     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

//     // لو المستخدم لغى العملية
//     if (googleUser == null) {
//       throw Exception('تم إلغاء تسجيل الدخول من المستخدم.');
//     }

//     // الحصول على تفاصيل المصادقة
//     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//     // إنشاء credential لاستخدامه مع Firebase
//     final OAuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     // تسجيل الدخول في Firebase باستخدام بيانات Google
//     final UserCredential userCredential =
//         await FirebaseAuth.instance.signInWithCredential(credential);

//     // طباعة بيانات المستخدم (اختياري)
//     print('تم تسجيل الدخول بنجاح: ${userCredential.user?.displayName}');

//     return userCredential;
//   } catch (e) {
//     print('حدث خطأ أثناء تسجيل الدخول: $e');
//     rethrow;
//   }
}
