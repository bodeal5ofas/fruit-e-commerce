import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_ecommerce/core/helper/custom_snackBar.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/login_view.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/widget/custom_progress_hud.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/widget/signup_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccessState) {
           CustomSnackBar.showSnackBar('Signup Success', context);
           Navigator.of(context).pushReplacementNamed(LoginView.routeName);
         // Navigator.pop(context);
        }else if(state is SignupFailureState){
         CustomSnackBar.showSnackBar(state.errorMessage, context);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading:state is SignupLoadingState ? true : false ,
         child: SignupViewBody());
       
//         if (state is SignupLoadingState) {
//           return ModalProgressHUD(inAsyncCall: inAsyncCall, child: child);
//   // return Stack(
//   //   children: [
//   //      const SignupViewBody(),
//   //     const Center(
//   //       child: CircularProgressIndicator(),
//   //     ),
//   //   ],
//   // );
// }else{
//   return const SignupViewBody();
// }
      },
    );
  }
}
