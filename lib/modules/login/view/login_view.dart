import 'package:flutter/material.dart';
import 'package:razasheikhtest/appWidgets/app_button.dart';
import 'package:razasheikhtest/appWidgets/dialog_handler.dart';
import 'package:razasheikhtest/appWidgets/text_field_widget.dart';
import 'package:razasheikhtest/app_constants/app_colors.dart';
import 'package:razasheikhtest/modules/login/view_model/login_view_model.dart';
import 'package:razasheikhtest/utils/app_images.dart';
import 'package:razasheikhtest/utils/app_strings.dart';
import 'package:razasheikhtest/utils/padding_ext.dart';

class LoginView extends StatelessWidget {
   LoginView({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   final _formKey = GlobalKey<FormState>();
   LoginViewModel loginViewModel = LoginViewModel();

   @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
        decoration:  const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.secondMainColor,
              AppColors.primaryColor,                ],
          ),

        ),
       child: SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height:height*0.45 ,
                    decoration:  const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.secondMainColor,
                          AppColors.primaryColor,                ],
                      ),

                    ),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (height*0.05).sizeBoxHeight,
                        Center(child: Image.asset(AppImages.applicationLogo,height: height*0.30,width: width*0.5,),),
                        const Padding(
                          padding: EdgeInsets.only(left: 30,bottom: 20),
                          child: Text(AppStrings.loginText,style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w500),),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: height*0.55,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            30.sizeBoxHeight,
                            TextFieldWidget(
                              controller: emailController,
                              isEmail: false,
                              textInputType: TextInputType.emailAddress,
                              readonly: false,
                              AppStrings.emailTitle,
                              '',
                              AppStrings.emailError,
                              isPassword: false,


                            ),
                            30.sizeBoxHeight,
                            TextFieldWidget(
                              controller: passwordController,
                              isPass: true,
                              textInputType: TextInputType.emailAddress,
                              readonly: false,
                              AppStrings.passwordTitle,
                              '',
                              AppStrings.passwordError,
                            ),
                            40.sizeBoxHeight,
                            Center(
                              child: ApplicationButton(
                                  title:AppStrings.loginNext,
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      DialogHandler.showLoaderDialog(context);
                                      loginViewModel.loginUser(emailController.text, passwordController.text, context);
                                    }
                                  },
                                  fillColor: false),
                            ),
                            30.sizeBoxHeight,
                            const Text(AppStrings.loginHelp,style: TextStyle(color: AppColors.darkColor),)

                          ],
                        ),
                      ),
                    ),

                  )

                ],
              ),
            ),
          ),
        )
    );
  }
}
