import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_ecommerce/core/helper/on_genrator_route.dart';
import 'package:fruit_ecommerce/core/utils/app_colors.dart' show AppColors, primary;
import 'package:fruit_ecommerce/core/utils/app_styles.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/signup_view.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/widget/custom_text_form_field.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/widget/donot_have_account_widget.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/widget/login_method_widget.dart';
import 'package:fruit_ecommerce/feature/onBoarding/presentation/widgets/custom_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
 GlobalKey<FormState> formKey=GlobalKey<FormState>();
 AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
late String email,password;
bool obscureText=true;
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 30,),
              Text('تسجيل دخول',style: AppStyles.bold19,textAlign: TextAlign.center,),
              SizedBox(height: 24,),
              CustomTextFormField(
                hintText: 'البريد الالكتروني',
                validator: (value) {
                  if(value==null || value.trim().isEmpty){
                    return 'البريد الالكتروني مطلوب';
                  }else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value)){  
          return 'البريد الالكتروني غير مسموح به';                
                  }else{
                    return null;
                  }
                },
                onSaved:(value) {
                  email=value!;
                } ,
                ),
              SizedBox(height: 16,),
              CustomTextFormField(
                validator: (value) {
                    if(value==null || value.trim().isEmpty){
                    return 'كلمة المرور  مطلوبة';
                  }else if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                .hasMatch(value)){  
          return 'كلمة المرور غير مسموح به';                
                  }else{
                    return null;
                  }
                  },
                  onSaved: (vaule) {
                    password=vaule!;
                  },
                  obscureText: obscureText,
          
                hintText: 'كلمة المرور',
                suffixIcon: IconButton(onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  }, icon: obscureText ? Icon(Icons.visibility_off) :
                  Icon(Icons.remove_red_eye),
                  ),
                ),
              SizedBox(height: 30,),
              CustomButton(onTap: (){
                if(formKey.currentState!.validate()){
                  formKey.currentState!.save();
                  
                  context.read<LoginCubit>().signInWithEmailAndPassword(email: email, password: password);
                }else{
                  autovalidateMode=AutovalidateMode.always;
                }
              }, title: 'تسجيل دخول',),
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
              LoginMethodWidget(
                iconImage: 'assets/images/google_icon.svg', 
                title: 'سجل دخول باستخدام جوجل',
                onTap: () {
                  context.read<LoginCubit>().signInWithGoogle();
                },
                ),
                
              SizedBox(height: 16,),
              LoginMethodWidget(
                iconImage: 'assets/images/facebook_icon.svg',
                 title: 'سجل دخول باستخدام الفيسبوك',
                 onTap: () {
                   context.read<LoginCubit>().signInWithFacebook();
                 },
                 ),
                        SizedBox(height: 16,),
              LoginMethodWidget(iconImage: 'assets/images/apple_icon.svg', title: 'سجل دخول باستخدام ابل',),
            ],
          ),
        ),
      ),
    );
  }
}

