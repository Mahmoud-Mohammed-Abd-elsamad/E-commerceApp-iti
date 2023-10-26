import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/home/domain/entities/category_entity.dart';

import '../repositories/home_domain_repo.dart';

class BrandsUseCase{


 HomeDomainRepo homeDomainRepo;
 BrandsUseCase(this.homeDomainRepo);

 Future<Either<Failures,CategoriesEntity>> call(){
  return homeDomainRepo.getBrands();

  }
}