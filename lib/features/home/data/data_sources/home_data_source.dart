import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/home/data/models/category_model.dart';

import '../../../../core/error/failures.dart';

abstract class HomeDataSource {

  Future<Either<Failures, CategoriseModel>> getCategorise();

  Future<Either<Failures, CategoriseModel>> getBrands();

}

class RemoteHomeDataSource extends HomeDataSource {
  @override
  Future<Either<Failures, CategoriseModel>> getBrands() {
    // TODO: implement getBrands
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CategoriseModel>> getCategorise() {
    // TODO: implement getCategorise
    throw UnimplementedError();
  }
  

}

class LocalDataSource extends HomeDataSource{
  @override
  Future<Either<Failures, CategoriseModel>> getBrands() {
    // TODO: implement getBrands
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CategoriseModel>> getCategorise() {
    // TODO: implement getCategorise
    throw UnimplementedError();
  }
}