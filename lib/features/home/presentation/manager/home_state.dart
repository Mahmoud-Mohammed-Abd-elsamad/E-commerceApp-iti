part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeShowLoading extends HomeState {}
class HomeShowLoadingBrands extends HomeState {}

class HomeGetCategoriesFailure extends HomeState {
 final Failures failures;
  HomeGetCategoriesFailure(this.failures);

}
class HomeGetCategoriesSuccess extends HomeState {
 final CategoriesEntity categoriseModel;
  HomeGetCategoriesSuccess(this.categoriseModel);

}
class HomeGetBrandsFailure extends HomeState {
  final Failures failures;
  HomeGetBrandsFailure(this.failures);

}
class HomeGetBrandsSuccess extends HomeState {
  final CategoriesEntity categoriseModel;
  HomeGetBrandsSuccess(this.categoriseModel);

}
