import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/register/domain/entities/register_entity.dart';

import '../entities/register_body.dart';

abstract class RegisterDomainRepo{

  Future<Either<Failures,RegisterEntity>> register(RegisterBody registerBody);
}