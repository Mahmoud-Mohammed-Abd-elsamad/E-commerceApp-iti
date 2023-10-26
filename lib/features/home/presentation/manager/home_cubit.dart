import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/home/data/models/category_model.dart';
import 'package:ecommerce_app/features/home/data/repositories/home_data_repo.dart';
import 'package:ecommerce_app/features/home/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/home/domain/repositories/home_domain_repo.dart';
import 'package:ecommerce_app/features/home/domain/use_cases/brands_use_case.dart';
import 'package:ecommerce_app/features/home/domain/use_cases/categories_use_case.dart';
import 'package:meta/meta.dart';

import '../../data/data_sources/home_data_source.dart';
import '../pages/taps/favoret_tap.dart';
import '../pages/taps/home_tap.dart';
import '../pages/taps/products_tap.dart';
import '../pages/taps/profile_tap.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeDataSource) : super(HomeInitial());

  HomeDataSource homeDataSource;

  int bottomNavigationBarSelectedIcon = 0;
  var tapsList = [HomeTap(),const ProductsTap(),const FavoriteTap(),const ProfileTap()];
  List<String> bannersList = [
    "assets/images/banner1.png",
    "assets/images/banner2.png",
    "assets/images/banner3.png"
  ];
  List<Data> categoriesList = [];
  List<Data> brandsList = [];

  selectedTap(int index){
    bottomNavigationBarSelectedIcon = index;
    emit(HomeInitial());
  }

  getCategories() async {
    emit(HomeShowLoading());
    HomeDomainRepo homeDomainRepo = HomeDataRepo(homeDataSource);
    CategoriesUseCase useCase = CategoriesUseCase(homeDomainRepo);

    var result = await useCase.call();

    result.fold((l) {
      emit(HomeGetCategoriesFailure(l));
    }, (r) {
      categoriesList = r.data ?? [];
      emit(HomeGetCategoriesSuccess(r));
    });
  }

  getBrands() async {
    emit(HomeShowLoadingBrands());
    HomeDomainRepo homeDomainRepo = HomeDataRepo(homeDataSource);
    BrandsUseCase useCase = BrandsUseCase(homeDomainRepo);

    var result = await useCase.call();

    result.fold((l) {
      emit(HomeGetBrandsFailure(l));
    }, (r) {
      brandsList = r.data!;
      emit(HomeGetBrandsSuccess(r));
    });
  }
}
