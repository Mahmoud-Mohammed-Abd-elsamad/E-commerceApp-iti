import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/login/data/repositories/login_data_repo.dart';
import 'package:ecommerce_app/features/login/domain/entities/login_body.dart';
import 'package:ecommerce_app/features/login/domain/use_cases/login_use_case.dart';
import 'package:ecommerce_app/features/register/data/models/register_mode.dart';
import 'package:ecommerce_app/features/register/domain/entities/register_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../data/data_sources/login_data_source.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {

  LoginDataSource loginDataSource;

  LoginCubit({required this.loginDataSource}) : super(LoginInitialState());

  final formKey = GlobalKey<FormState>();

  TextEditingController emailController =TextEditingController();
  TextEditingController passController =TextEditingController();


     login()async{
      LoginDataRepo loginDomainRepo = LoginDataRepo(loginDataSource);
      LoginUseCase loginUseCase = LoginUseCase(loginDomainRepo);

      var result = await loginUseCase.call(LoginBody(email: emailController.text, password: passController.text));

      return result.fold((l){
        emit(LoginFailureState(l));
      }, (r) {
        emit(LoginSuccessState(r));
      }) ;
    }






}
