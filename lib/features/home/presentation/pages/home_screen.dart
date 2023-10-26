import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_images.dart';
import 'package:ecommerce_app/features/home/presentation/manager/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: Image.asset(AppImages.routeIconHome),
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              Image.asset(AppImages.cartIcon)
            ],
          ),

            backgroundColor: Colors.white,
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.w),
                    topLeft: Radius.circular(20.w)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      spreadRadius: 0.w,
                      blurRadius: 10.w),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0.w),
                  topRight: Radius.circular(30.0.w),
                ),
                child: BottomNavigationBar(
                  onTap: (index) {
                    context.read<HomeCubit>().selectedTap(index);
                  },
                  currentIndex:
                      context.read<HomeCubit>().bottomNavigationBarSelectedIcon,
                  items: <BottomNavigationBarItem>[
                    buildBottomNavigationBarItem(
                        Icons.home,
                        context
                                .read<HomeCubit>()
                                .bottomNavigationBarSelectedIcon ==
                            0),
                    buildBottomNavigationBarItem(
                        Icons.category_outlined,
                        context
                                .read<HomeCubit>()
                                .bottomNavigationBarSelectedIcon ==
                            1),
                    buildBottomNavigationBarItem(
                        Icons.favorite_outline,
                        context
                                .read<HomeCubit>()
                                .bottomNavigationBarSelectedIcon ==
                            2),
                    buildBottomNavigationBarItem(
                        Icons.person,
                        context
                                .read<HomeCubit>()
                                .bottomNavigationBarSelectedIcon ==
                            3),
                  ],
                ),
              ),
            ),
            body: context.read<HomeCubit>().tapsList[context.read<HomeCubit>().bottomNavigationBarSelectedIcon]

        );
      },
    );
  }

  buildBottomNavigationBarItem(IconData image, bool selected) {
    return BottomNavigationBarItem(
        icon: Container(
            height: 40.w,
            width: 40.w,
            decoration: BoxDecoration(
                color: selected ? Colors.white : AppColors.primaryColor,
                shape: BoxShape.circle),
            child: Icon(
              image,
              color: selected ? AppColors.primaryColor : Colors.white,
            )),
        label: "");
  }
}
