import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_ecommerce/feature/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/cart_view/widgets/cart_view_body.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/home_view/home_view.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/products_view/products_view.dart';
//import 'package:fruit_ecommerce/core/utils/app_styles.dart';
//import 'package:fruit_ecommerce/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/widgets/custom_bottom_navigationbar.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/home_view/widgets/home_view_body.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/widgets/master_view_bloc_listener.dart';

class MasterView extends StatefulWidget {
  const MasterView({super.key});
  static const routeName = 'home';

  @override
  State<MasterView> createState() => _MasterViewState();
}

class _MasterViewState extends State<MasterView> {
  int currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: CustomBottomNavigationBar(
            onTap: (value) {
              currentIndex = value;
              setState(() {});
            },
          ),
          backgroundColor: Colors.white,
          body: MasterViewBlocListener(currentIndex: currentIndex,),
        ),
      ),
    );
  }
}
