import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/widgets/home_view_appbar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeViewAppbar(),
      ],
    );
  }
}