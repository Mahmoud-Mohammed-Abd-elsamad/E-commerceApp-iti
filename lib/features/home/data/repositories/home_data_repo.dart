import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/home/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/home/domain/repositories/home_domain_repo.dart';

class HomeDataRepo extends HomeDomainRepo{
  @override
  Future<Either<Failures, CategoriseEntity>> getBrands() {
    // TODO: implement getBrands
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CategoriseEntity>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

}