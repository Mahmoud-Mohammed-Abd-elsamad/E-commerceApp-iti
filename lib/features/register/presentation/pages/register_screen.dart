import 'package:ecommerce_app/features/register/presentation/manager/register_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/app_colors.dart';
import '../widgets/custome_form_text_field.dart';

class RegisteScreen extends StatelessWidget {
  const RegisteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().formKey,
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
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
                  "Full Name",
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
                  hintText: 'enter your full name',
                  keyboardType: TextInputType.name,
                  controller: context.read<RegisterCubit>().nameController,
                ),
                SizedBox(
                  height: 24.w,
                ),
                Text(
                  "Mobile number",
                  style:
                      GoogleFonts.poppins(color: Colors.white, fontSize: 18.sp),
                ),
                SizedBox(
                  height: 24.w,
                ),
                CustomFormTextField(
                  validator: (String) {
                    if (String == null ||
                        String.isEmpty ||
                        String.length < 11) {
                      return "this field is required and must be 11 digits";
                    }
                    return null;
                  },
                  hintText: 'enter your phone',
                  keyboardType: TextInputType.phone,
                  controller: context.read<RegisterCubit>().phoneController,
                ),
                SizedBox(
                  height: 24.w,
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
                  controller: context.read<RegisterCubit>().emailController,
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
                  controller: context.read<RegisterCubit>().passController,
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
                          .read<RegisterCubit>()
                          .formKey
                          .currentState!
                          .validate()) {
                        context
                            .read<RegisterCubit>().register();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('register success')),
                        );
                      }
                    },
                    child: Center(
                        child: Padding(
                      padding: EdgeInsets.all(16.0.w),
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                            color: AppColors.primaryColor, fontSize: 20.sp),
                      ),
                    )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
