import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/features/login/domain/entities/login_body.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/contants.dart';
import '../../../register/data/models/register_mode.dart';

abstract class LoginDataSource {
  Future<Either<Failures, RegisterModel>> login(LoginBody loginBody);
}

class RemoteLoginDataSource extends LoginDataSource {
  @override
  Future<Either<Failures, RegisterModel>> login(LoginBody loginBody) async {
    try {
      final dio = Dio();

      var response = await dio.post(
          "${Constants.BaseUrl}${EndPoint.login}",
          data: {"email": loginBody.email, "password": loginBody.password});

      if (response.statusCode == 200 || response.statusCode == 201) {
        RegisterModel registerModel = RegisterModel.fromJson(response.data);

        return Right(registerModel);
      } else {
        return Left(RemoteFailure("failed to Login"));
      }
    } catch (e) {
      return Left(RemoteFailure(e.toString()));
    }
  }
}

class LocalLoginDataSource extends LoginDataSource {
  @override
  Future<Either<Failures, RegisterModel>> login(LoginBody loginBody) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
