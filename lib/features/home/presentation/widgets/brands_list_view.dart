import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/features/home/presentation/manager/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BrandsListView extends StatefulWidget {
  const BrandsListView({Key? key}) : super(key: key);

  @override
  State<BrandsListView> createState() => _BrandsListViewState();
}

class _BrandsListViewState extends State<BrandsListView> {
  @override
  void initState() {
    context.read<HomeCubit>().getBrands();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      builder: (BuildContext context, state) {
        if (state is HomeShowLoadingBrands) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomeGetBrandsFailure) {
          return Center(
            child: Text(state.failures.message),
          );
        } else {
          return Expanded(
            child: ListView.builder(
              itemCount: context.read<HomeCubit>().brandsList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23.0),
                      child: Container(
                          width: 100.w,
                          height: 100.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 2, color: AppColors.primaryColor),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(context
                                      .read<HomeCubit>()
                                      .brandsList[index]
                                      .image!)))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4.0.w),
                      child: Center(
                          child: Text(
                        context.read<HomeCubit>().brandsList![index].name!,
                        style: GoogleFonts.poppins(
                            fontSize: 14.sp, fontWeight: FontWeight.w400),
                      )),
                    )
                  ],
                );
              },
            ),
          );
        }
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
