import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_ecommerce/core/utils/app_colors.dart';
import 'package:fruit_ecommerce/core/utils/app_styles.dart';

class FeatureIteam extends StatelessWidget {
  const FeatureIteam({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.2,
      width: MediaQuery.sizeOf(context).width ,
     //  width: double.infinity,
      child: Stack(
        
        alignment: Alignment.centerRight,
        children: [
           
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset('assets/images/feature1.png',fit: BoxFit.fill,
            
             ),
          ),
        Container(
          width: MediaQuery.sizeOf(context).width * 0.45,
          decoration: BoxDecoration(
            color: AppColors.lightGreen,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(70),
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10),
              ),
          ),
         ),
        Padding(
          padding: const EdgeInsets.only(top:  12.0,right: 12),
          child: Column(
            children: [
              Text('عروض العيد',style: AppStyles.regular13.copyWith(color: Colors.white),),
              SizedBox(height: 8,),
               Text('خصم 25%',style: AppStyles.bold19.copyWith(color: Colors.white),),
               SizedBox(height: 8,),
               ElevatedButton(onPressed: (){},
               style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
               ),
                child: Text('تسوق الان',style: AppStyles.bold13.copyWith(color: AppColors.primary),),
                ),
            ],
          ),
        ),
       

        ],
      ),
    );
  }
}