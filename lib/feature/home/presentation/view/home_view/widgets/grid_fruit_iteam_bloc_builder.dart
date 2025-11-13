import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_ecommerce/core/cubits/product_cubit/product_cubit.dart';
import 'package:fruit_ecommerce/core/helper/create_fruit_dummy_function.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/home_view/widgets/grid_fruit_iteam.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GridFruitIteamBlocBuilder extends StatelessWidget {
  const GridFruitIteamBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
         
    
       if(state is ProductSucess){
         return GridFruitIteam(products:state.products,);
     
       }else if(state is ProductLoading){
        return Skeletonizer.sliver(child: 
        GridFruitIteam(products: getDummyFruits()));
    
       }else if(state is ProductFailure){
    // return  Center(child:  Text('failure'));
        return SliverToBoxAdapter(child: Center(child: Text(state.errMessage),));
       }else{
        return Container();
       }
      },
    );
  }
}
