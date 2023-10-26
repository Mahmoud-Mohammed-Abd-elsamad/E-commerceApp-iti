import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/home/data/data_sources/home_data_source.dart';
import 'package:ecommerce_app/features/home/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/home/domain/repositories/home_domain_repo.dart';

class HomeDataRepo extends HomeDomainRepo{

  HomeDataSource homeDataSource;
  HomeDataRepo(this.homeDataSource);
  @override
  Future<Either<Failures, CategoriesEntity>> getBrands() {
    return homeDataSource.getBrands();
  }

  @override
  Future<Either<Failures, CategoriesEntity>> getCategories() {

    return homeDataSource.getCategorise();
  }

}