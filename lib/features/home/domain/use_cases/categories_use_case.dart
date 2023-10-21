import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/home/domain/entities/category_entity.dart';

import '../repositories/home_domain_repo.dart';

class CategoriesUseCase{


 HomeDomainRepo homeDomainRepo;
 CategoriesUseCase(this.homeDomainRepo);

 Future<Either<Failures,CategoriseEntity>> call(){
  return homeDomainRepo.getCategories();

  }
}