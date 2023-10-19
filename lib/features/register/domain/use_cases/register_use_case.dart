 import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/register/domain/entities/register_body.dart';

import '../../../../core/error/failures.dart';
import '../entities/register_entity.dart';
import '../repositories/register_domain_repo.dart';

class RegisterUseCse{

  RegisterDomainRepo registerDomainRepo;
  RegisterUseCse(this.registerDomainRepo);



 Future<Either<Failures,RegisterEntity>> call(RegisterBody registerBody){
   return registerDomainRepo.register(registerBody);
  }

}