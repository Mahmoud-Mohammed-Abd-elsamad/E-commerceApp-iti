import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/home/data/models/category_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/failures.dart';

abstract class HomeDataSource {

  Future<Either<Failures, CategoriesModel>> getCategorise();

  Future<Either<Failures, CategoriesModel>> getBrands();

}

class RemoteHomeDataSource extends HomeDataSource {
  @override
  Future<Either<Failures, CategoriesModel>> getBrands() async{
    try{
      final response = await http
          .get(Uri.parse('http://ecommerce.routemisr.com/api/v1/brands'));

      if (response.statusCode == 200 || response.statusCode == 201) {

        CategoriesModel categoriesModel =  CategoriesModel.fromJson(jsonDecode(response.body));

        return Right(categoriesModel);
      } else {

        return Left(Failures("failed to get categories"));

      }
    } catch(exception){

      return Left(Failures(exception.toString()));

    }
  }

  @override
  Future<Either<Failures, CategoriesModel>> getCategorise() async{
    try{
        final response = await http
            .get(Uri.parse('https://route-ecommerce.onrender.com/api/v1/categories'));

        if (response.statusCode == 200 || response.statusCode == 201) {

          CategoriesModel categoriesModel =  CategoriesModel.fromJson(jsonDecode(response.body));

          return Right(categoriesModel);
        } else {

          return Left(Failures("failed to get categories"));

        }
      } catch(exception){

      return Left(Failures(exception.toString()));

    }
  }


}

class LocalDataSource extends HomeDataSource{
  @override
  Future<Either<Failures, CategoriesModel>> getBrands() {
    // TODO: implement getBrands
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CategoriesModel>> getCategorise() {
    // TODO: implement getCategorise
    throw UnimplementedError();
  }
}