import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_ecommerce/core/helper/depedce_injection.dart';
import 'package:fruit_ecommerce/feature/auth/domain/repos/auth_repo.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/cubits/signup/signup_cubit.dart';
//import 'package:fruit_ecommerce/feature/auth/presentation/view/widget/signup_view_body.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/widget/signup_view_body_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(body: SafeArea(child: SignupViewBodyBlocConsumer())),
    );
  }
}
