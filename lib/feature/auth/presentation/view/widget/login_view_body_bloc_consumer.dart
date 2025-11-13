import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_ecommerce/core/helper/custom_snackBar.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/widget/custom_progress_hud.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/widget/login_body.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/master_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is LoginSuccessState){
          CustomSnackBar.showSnackBar('Login Success', context);
          Navigator.of(context).pushReplacementNamed(MasterView.routeName);
        }else if(state is LoginFailureState){
          CustomSnackBar.showSnackBar(state.errorMessage, context);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(isLoading:  state is LoginLoadingState? true : false,
          child: LoginViewBody()
        );
        
      },
    );
  }
}
