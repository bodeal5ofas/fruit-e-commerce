import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/widget/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
static const routeName='loginView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LoginViewBody(
        
      ),),
    );
  }
}