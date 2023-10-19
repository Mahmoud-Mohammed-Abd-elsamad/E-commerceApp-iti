import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/register/data/models/register_mode.dart';
import 'package:ecommerce_app/features/register/domain/entities/register_body.dart';
import 'package:http/http.dart' as http;

abstract class RegisterDataSource {
  Future<Either<Failures, RegisterModel>> register(RegisterBody registerBody);
}

class RemoteRegisterDataSource extends RegisterDataSource {
  @override
  Future<Either<Failures, RegisterModel>> register(RegisterBody registerBody) async {
    try {
      final dio = Dio();
      final response = await dio.post(
        'https://route-ecommerce.onrender.com/api/v1/auth/signup',
        data: {
          "name": registerBody.name,
          "email": registerBody.email,
          "password": registerBody.password,
          "rePassword": registerBody.rePassword,
          "phone": registerBody.phone
        },
      );

      print("${registerBody.name}");

      // final response = await http.post(Uri.parse('https://route-ecommerce.onrender.com/api/v1/auth/signup'),
      //   headers: {"Content-Type":"application/json",
      //   "Content-Length":"<calculated when request is sent>",
      //   "Host":"<calculated when request is sent>"},
      //   body: jsonEncode(<String, dynamic>{
      //   "name": "mahmoud3 adel", "email": "mahmoud.tarek9545@gmail.com",
      //     "password": "12345678", "rePassword": "12345678",
      //   "phone": "01590001552"
      //   }),);

      print(response.data);

      print("ssss ${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        RegisterModel registerModel = RegisterModel.fromJson(response.data);
        return Right(registerModel);
      } else {
        return left(RemoteFailure("faild to register"));
      }
    } catch (e) {
      return left(RemoteFailure(e.toString()));
    }
  }
}

class LocalDataSource extends RegisterDataSource {
  @override
  Future<Either<Failures, RegisterModel>> register(RegisterBody registerBody) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
