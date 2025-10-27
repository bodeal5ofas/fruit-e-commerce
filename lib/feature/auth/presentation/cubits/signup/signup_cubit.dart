import 'package:bloc/bloc.dart';
//import 'package:dartz/dartz.dart';
//import 'package:fruit_ecommerce/core/errors/failure.dart';
import 'package:fruit_ecommerce/feature/auth/domain/entites/user_entity.dart';
import 'package:fruit_ecommerce/feature/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  AuthRepo authRepo;
  SignupCubit({required this.authRepo}) : super(SignupInitialState());
 Future<void> createUserWithEmailAndPassword({required String name,required String email,required String password})async{
   emit(SignupLoadingState());
   var result= await authRepo.createUserWithEmailAndPassword(name: name, email: email, password: password);
  result.fold((failure) {
   emit(SignupFailureState(errorMessage: failure.message));
  },
   (user) {
     emit(SignupSuccessState(userEntity: user));
   },);
  }

}
