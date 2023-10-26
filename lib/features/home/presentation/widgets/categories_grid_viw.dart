import 'package:ecommerce_app/features/home/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/home/presentation/manager/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesGridView extends StatefulWidget {
   const CategoriesGridView({Key? key}) : super(key: key);

  @override
  State<CategoriesGridView> createState() => _CategoriesGridViewState();
}

class _CategoriesGridViewState extends State<CategoriesGridView> {

  @override
  void initState() {

    context.read<HomeCubit>().getCategories();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      builder: (BuildContext context, state) {
        if(state is HomeShowLoading){
          return const Center(child:  CircularProgressIndicator(),);
        }else if(state is HomeGetCategoriesFailure){

          return  Center(child:Text(state.failures.message));
        }else {

          return Container(
            height: 300.w,
            width: double.infinity,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // number of items in each row
                mainAxisSpacing: 0.0.w, // spacing between rows
                crossAxisSpacing: 0.0.w,
                // spacing between columns
              ),
              shrinkWrap: true,
              itemCount: context.read<HomeCubit>().categoriesList.length,
              // total number of items
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                        width: 100.w,
                        height: 100.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(context.read<HomeCubit>().categoriesList[index].image!)))),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0.w),
                      child: Center(
                          child: Text(
                            context.read<HomeCubit>().categoriesList[index].name!,
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
      listener: (BuildContext context, Object? state) {  },

    );
  }
}
