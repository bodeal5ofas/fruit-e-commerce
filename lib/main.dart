import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/core/generate_route/on_genrator_route.dart';
import 'package:fruit_ecommerce/feature/splash/presentation/view/splash_view.dart';

void main() {
  runApp(const FruitEcommerce());
}

class FruitEcommerce extends StatelessWidget {
  const FruitEcommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute:(settings) => onGenratorRoute(settings),
      initialRoute: SplashView.routeName,
    );
  }
}

