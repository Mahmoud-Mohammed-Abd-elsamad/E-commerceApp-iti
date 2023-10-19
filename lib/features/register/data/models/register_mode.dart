import 'package:ecommerce_app/features/register/domain/entities/register_entity.dart';

class RegisterModel extends RegisterEntity{
  String? message;

  RegisterModel({this.message, super.user, super.token});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

}

class User extends UserEntity {

  String? role;

  User({super.name, super.email, this.role});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

}
