import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/widget/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SignupViewBody()),
    );
  }
}