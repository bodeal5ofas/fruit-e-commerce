import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/core/helper/on_genrator_route.dart';
import 'package:fruit_ecommerce/core/utils/app_colors.dart' show AppColors, primary;
import 'package:fruit_ecommerce/core/utils/app_styles.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/signup_view.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/widget/custom_text_form_field.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/widget/donot_have_account_widget.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/widget/login_method_widget.dart';
import 'package:fruit_ecommerce/feature/onBoarding/presentation/widgets/custom_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30,),
            Text('تسجيل دخول',style: AppStyles.bold19,textAlign: TextAlign.center,),
            SizedBox(height: 24,),
            CustomTextFormField(hintText: 'البريد الالكتروني',),
            SizedBox(height: 16,),
            CustomTextFormField(hintText: 'كلمة المرور',suffixIcon: Icon(Icons.remove_red_eye),),
            SizedBox(height: 30,),
            CustomButton(onTap: (){}, title: 'تسجيل دخول',),
            SizedBox(height: 30,),
            DonotHaveAccountWidget(fitstTitle: 'ليس لديك حساب ؟', 
            onTap: (){
              Navigator.pushNamed(context,SignupView.routeName );
            },
            endTitle: 'انشاء حساب',
            ),
            SizedBox(height: 33,),
            SizedBox(
              height: 30,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 10,
                children: [
                  Expanded(child: Divider(thickness: 1,color: AppColors.lightGray,)),
                  Text('او',style: AppStyles.semiBold16.copyWith(color: AppColors.lightGray,),),
                  Expanded(child: Divider(thickness: 1,color: AppColors.lightGray,)),
                ],
              ),
            ),
            SizedBox(height: 16,),
            LoginMethodWidget(iconImage: 'assets/images/google_icon.svg', title: 'سجل دخول باستخدام جوجل',),
      
            SizedBox(height: 16,),
            LoginMethodWidget(iconImage: 'assets/images/facebook_icon.svg', title: 'سجل دخول باستخدام الفيسبوك',),
                      SizedBox(height: 16,),
            LoginMethodWidget(iconImage: 'assets/images/apple_icon.svg', title: 'سجل دخول باستخدام ابل',),
          ],
        ),
      ),
    );
  }
}

