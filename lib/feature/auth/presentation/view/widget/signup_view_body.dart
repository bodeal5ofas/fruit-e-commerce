import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/core/utils/app_colors.dart';
import 'package:fruit_ecommerce/core/utils/app_styles.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/widget/custom_text_form_field.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/widget/donot_have_account_widget.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/widget/terms_and_conditions_widget.dart';
import 'package:fruit_ecommerce/feature/onBoarding/presentation/widgets/custom_button.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30,),
            Text('حساب جديد',style: AppStyles.bold19,textAlign: TextAlign.center,),
            SizedBox(height: 24,),
            CustomTextFormField(hintText: 'الاسم كامل',),
            SizedBox(height: 16,),
            CustomTextFormField(hintText: 'البريد الالكتروني',),
            SizedBox(height: 16,),
            CustomTextFormField(hintText: 'كلمة المرور',suffixIcon: Icon(Icons.remove_red_eye),),
            SizedBox(height: 16,),
            TermsAndConditionsWidget(),  
            SizedBox(height: 30,),
            CustomButton(onTap: (){}, 
            title: 'إنشاء حساب جديد',
            ),
            SizedBox(height: 30,),
            DonotHaveAccountWidget(fitstTitle: 'تمتلك حساب بالفعل؟',
             endTitle: 'تسجيل دخول',
              onTap: (){
                Navigator.pop(context);
              },
              ),
          ],
        ),
      ),
    );
  }
}