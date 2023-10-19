import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/login/data/repositories/login_data_repo.dart';
import 'package:ecommerce_app/features/login/domain/repositories/login_domain_repo.dart';
import 'package:ecommerce_app/features/register/data/models/register_mode.dart';
import 'package:ecommerce_app/features/register/domain/entities/register_entity.dart';

import '../entities/login_body.dart';

class LoginUseCase{

 //1 mistake
  LoginDomainRepo loginDomainRepo;
  LoginUseCase(this.loginDomainRepo);

  Future<Either<Failures,RegisterEntity>>call(LoginBody loginBody){
    return  loginDomainRepo.login(loginBody);

  }
}