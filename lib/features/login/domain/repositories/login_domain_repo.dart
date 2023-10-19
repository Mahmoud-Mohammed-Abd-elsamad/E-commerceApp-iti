import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/register/domain/entities/register_entity.dart';

import '../../../../core/error/failures.dart';
import '../../../register/data/models/register_mode.dart';
import '../entities/login_body.dart';

abstract class LoginDomainRepo{


  Future<Either<Failures,RegisterEntity>>login(LoginBody loginBody);

}