import 'package:bloc/bloc.dart';
import 'package:fruit_ecommerce/feature/auth/domain/entites/user_entity.dart';
import 'package:fruit_ecommerce/feature/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit(this.authRepo) : super(LoginInitial());

    Future<void> signInWithEmailAndPassword({required String email,required String password})async{
    emit(LoginLoadingState());
    var result= await authRepo.signInWithEmailAndPassword(email: email, password: password);
    result.fold((failure) {
      emit(LoginFailureState(errorMessage: failure.message));
    },
        (user) {
          emit(LoginSuccessState(userEntity: user));
        },);
  }

    Future<void> signInWithGoogle()async{
    emit(LoginLoadingState());
    var result= await authRepo.signInWithGoogle();
    result.fold((failure) {
      emit(LoginFailureState(errorMessage: failure.message));
    },
        (user) {
          emit(LoginSuccessState(userEntity: user));
        },);
  }

  Future<void> signInWithFacebook()async{
    emit(LoginLoadingState());
    var result= await authRepo.signInWithFacebook();
    result.fold((failure) {
      emit(LoginFailureState(errorMessage: failure.message));
    },
        (user) {
          emit(LoginSuccessState(userEntity: user));
        },);
  }
}
