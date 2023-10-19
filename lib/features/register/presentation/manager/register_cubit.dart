import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/register/data/repositories/register_data_repo.dart';
import 'package:ecommerce_app/features/register/domain/entities/register_body.dart';
import 'package:ecommerce_app/features/register/domain/entities/register_entity.dart';
import 'package:ecommerce_app/features/register/domain/repositories/register_domain_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../data/data_sources/register_data_source.dart';
import '../../domain/use_cases/register_use_case.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {


  RegisterDataSource registerDataSource;

  RegisterCubit({required this.registerDataSource}) : super(RegisterStateInitial());

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController =TextEditingController();
  TextEditingController phoneController =TextEditingController();
  TextEditingController emailController =TextEditingController();
  TextEditingController passController =TextEditingController();




  register() async{
    emit(RegisterStateSowLoading());

    RegisterDomainRepo registerDomainRepo = RegisterDataRepo(registerDataSource);
    RegisterUseCse useCse =  RegisterUseCse(registerDomainRepo);

    var result = await useCse.call(RegisterBody(name: nameController.text, email: emailController.text, password: passController.text, rePassword: passController.text,
        phone: phoneController.text));

    result.fold((l) {
      emit(RegisterStateFailure(l));
      print(l.message);
    }, (r) {
      emit(RegisterStateSuccess(r));
    });
  }
}
