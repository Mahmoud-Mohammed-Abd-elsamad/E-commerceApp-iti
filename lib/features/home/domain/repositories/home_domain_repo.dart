import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/category_entity.dart';

abstract class HomeDomainRepo{

  Future<Either<Failures,CategoriseEntity>>  getCategories();

  Future<Either<Failures,CategoriseEntity>>  getBrands();
}