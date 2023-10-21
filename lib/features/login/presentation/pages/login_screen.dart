import 'package:ecommerce_app/config/routes/routes.dart';
import 'package:ecommerce_app/core/utils/cach_helper.dart';
import 'package:ecommerce_app/features/home/presentation/pages/home_screen.dart';
import 'package:ecommerce_app/features/login/presentation/manager/login_cubit.dart';
import 'package:ecommerce_app/features/register/presentation/manager/register_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../register/presentation/widgets/custome_form_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocConsumer<LoginCubit,LoginState>(
        builder: (BuildContext context, state) {
          if(state is LoginShowLoadingState){
            return const Center(child: CircularProgressIndicator(),);
          }else{
            return Form(
              key: context.read<LoginCubit>().formKey,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 85.w,
                    ),
                    Center(
                        child: Image.asset(
                          "assets/images/route_logo.png",
                        )),
                    SizedBox(
                      height: 46.9.w,
                    ),

                    Text(
                      "Email",
                      style:
                      GoogleFonts.poppins(color: Colors.white, fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 24.w,
                    ),
                    CustomFormTextField(
                      validator: (String) {
                        if (String == null || String.isEmpty) {
                          return "this field is required";
                        }
                        return null;
                      },
                      hintText: 'enter your email',
                      keyboardType: TextInputType.emailAddress,
                      controller: context.read<LoginCubit>().emailController,
                    ),
                    SizedBox(
                      height: 24.w,
                    ),
                    Text(
                      "Password",
                      style:
                      GoogleFonts.poppins(color: Colors.white, fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 24.w,
                    ),
                    CustomFormTextField(
                      validator: (String) {
                        if (String == null || String.isEmpty || String.length < 6) {
                          return "this field is required and must be at least 6 characters";
                        }
                        return null;
                      },
                      hintText: 'enter your password',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      controller: context.read<LoginCubit>().passController,
                    ),
                    SizedBox(
                      height: 56.w,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: Colors.white),
                        onPressed: () {
                          if (context
                              .read<LoginCubit>()
                              .formKey
                              .currentState!
                              .validate()) {
                            context
                                .read<LoginCubit>().login();


                          }
                        },
                        child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(16.0.w),
                              child: Text(
                                "Login",
                                style: GoogleFonts.poppins(
                                    color: AppColors.primaryColor, fontSize: 20.sp),
                              ),
                            )))
                  ],
                ),
              ),
            );
          }
        },listener: (context, state) {
        if(state is LoginFailureState){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('login failure')),
          );
          return _showAlertDialog(context);
        }
          if(state is LoginSuccessState){
            CacheHelper.saveData(stringToken: state.model.token!);
            Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('login success')),
            );
          }
      },
        
      ),
    );
  }
  void _showAlertDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog( // <-- SEE HERE
          title: const Text('Error'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(' Login Failed'),
              ],
            ),
          ),
          actions: <Widget>[

            TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}
