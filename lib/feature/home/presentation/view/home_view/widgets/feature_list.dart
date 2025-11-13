import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/feature/home/presentation/view/home_view/widgets/feature_iteam.dart';

class FeatureList extends StatelessWidget {
  const FeatureList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
 height: MediaQuery.sizeOf(context).height * 0.2,
  // width: double.infinity  ,
       child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal:  8.0),
            child: FeatureIteam(),
          );
        },
      ),
    );
  }
}