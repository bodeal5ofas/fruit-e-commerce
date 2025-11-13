import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_ecommerce/core/helper/custom_snackBar.dart';
import 'package:fruit_ecommerce/feature/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/cart_view/cart_view.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/home_view/home_view.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/products_view/products_view.dart';

class MasterViewBlocListener extends StatelessWidget {
  const MasterViewBlocListener({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
      if(state is CartIteamAdd){
        CustomSnackBar.showSnackBar('العنصر تم اضافته', context);
      }else if(state is CartIteamRemove){
        CustomSnackBar.showSnackBar('العنصر تم حذفه', context);
      }
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16, top: 16),
        child: IndexedStack(
          index: currentIndex,
          children: [HomeView(), ProductsView(), CartView()],
        ),
      ),
    );
  }
}
