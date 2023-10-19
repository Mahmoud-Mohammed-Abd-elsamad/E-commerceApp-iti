import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/register/data/data_sources/register_data_source.dart';
import 'package:ecommerce_app/features/register/domain/entities/register_body.dart';
import 'package:ecommerce_app/features/register/domain/entities/register_entity.dart';
import 'package:ecommerce_app/features/register/domain/repositories/register_domain_repo.dart';

class RegisterDataRepo extends RegisterDomainRepo{

  RegisterDataSource registerDataSource;

  RegisterDataRepo(this.registerDataSource);

  @override
  Future<Either<Failures, RegisterEntity>> register(RegisterBody registerBody) {

    return registerDataSource.register(registerBody);

  }


}