import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_ecommerce/core/helper/on_genrator_route.dart';
import 'package:fruit_ecommerce/core/helper/shared_prefrence.dart';
import 'package:fruit_ecommerce/feature/splash/presentation/view/splash_view.dart';
import 'package:fruit_ecommerce/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await SharedPrefrenceHelper.initSharedPref();
  runApp(const FruitEcommerce());
}

class FruitEcommerce extends StatelessWidget {
  const FruitEcommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: Locale('ar'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute:(settings) => onGenratorRoute(settings),
      initialRoute: SplashView.routeName,
    );
  }
}

