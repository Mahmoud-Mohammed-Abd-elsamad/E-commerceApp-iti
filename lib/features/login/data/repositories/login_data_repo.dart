import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/login/domain/repositories/login_domain_repo.dart';

import '../../../register/domain/entities/register_entity.dart';
import '../../domain/entities/login_body.dart';
import '../data_sources/login_data_source.dart';

class LoginDataRepo extends LoginDomainRepo {
  // mistakes 2
  // LoginDataSource loginDataSource = RemoteLoginDataSource();
  LoginDataSource loginDataSource;

  LoginDataRepo(this.loginDataSource);

  @override
  Future<Either<Failures, RegisterEntity>> login(LoginBody loginBody) {
    return loginDataSource.login(loginBody);
  }
}
