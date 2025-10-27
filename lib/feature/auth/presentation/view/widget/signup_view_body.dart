import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_ecommerce/core/helper/custom_snackBar.dart';
//import 'package:fruit_ecommerce/core/utils/app_colors.dart';
import 'package:fruit_ecommerce/core/utils/app_styles.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/widget/custom_text_form_field.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/widget/donot_have_account_widget.dart';
import 'package:fruit_ecommerce/feature/auth/presentation/view/widget/terms_and_conditions_widget.dart';
import 'package:fruit_ecommerce/feature/onBoarding/presentation/widgets/custom_button.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
 GlobalKey<FormState> formKey = GlobalKey();
 AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
 late String name,email,password;
 bool obscureText=true;
 bool isActiveCheckedBox=false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 30,),
              Text('حساب جديد',style: AppStyles.bold19,textAlign: TextAlign.center,),
              SizedBox(height: 24,),
              CustomTextFormField(hintText: 'الاسم كامل',
              validator: (value) => ( value==null || value.trim().isEmpty) ? 'الاسم مطلوب' : null,
              onSaved: (value) {
                name=value!;
              },
              ),
              SizedBox(height: 16,),
              CustomTextFormField(hintText: 'البريد الالكتروني',
              
              validator: (value) {
                if(value==null || value.trim().isEmpty){
                  return 'البريد الالكتروني مطلوب';
                }else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value)){  
        return 'البريد الالكتروني غير صحيح';                
                }else{
                  return null;
                }
              }
             , onSaved: (value) {
                email=value!;
              },
              ),
              SizedBox(height: 16,),
              CustomTextFormField(
                validator: (value) {
                  if(value==null || value.trim().isEmpty){
                  return 'كلمة المرور  مطلوبة';
                }else if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
      .hasMatch(value)){  
        return 'كلمة المرور غير صحيح';                
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
              SizedBox(height: 16,),
              TermsAndConditionsWidget(
                onChanged: (value) {
                  isActiveCheckedBox=value;
                },
              ),  
              SizedBox(height: 30,),
              CustomButton(onTap: (){
                if(formKey.currentState!.validate()){
                  formKey.currentState!.save();
                  if (isActiveCheckedBox) {
  context.read<SignupCubit>().createUserWithEmailAndPassword(
    name: name,
     email: email, 
  password: password,);
}else{
  CustomSnackBar.showSnackBar('يجب الموافقة على الشروط والاحكام', context);
}
                }else{
                  autovalidateMode=AutovalidateMode.always;
                }
              }, 
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
      ),
    );
  }
}