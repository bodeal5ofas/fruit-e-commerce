import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_ecommerce/core/helper/depedce_injection.dart';
import 'package:fruit_ecommerce/feature/auth/domain/repos/auth_repo.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/cubits/login_cubit/login_cubit.dart';
//import 'package:fruit_ecommerce/feature/auth/presentation/view/widget/login_body.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/widget/login_view_body_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'loginView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<AuthRepo>()),
      child: Scaffold(
        body: SafeArea(
          child: LoginViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}

