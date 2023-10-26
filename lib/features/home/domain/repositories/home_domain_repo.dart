import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/category_entity.dart';

abstract class HomeDomainRepo{

  Future<Either<Failures,CategoriesEntity>>  getCategories();

  Future<Either<Failures,CategoriesEntity>>  getBrands();
}