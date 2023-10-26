import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../manager/home_cubit.dart';
import '../../widgets/brands_list_view.dart';
import '../../widgets/categories_grid_viw.dart';

class HomeTap extends StatelessWidget {
   const HomeTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 190.0,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.5,
            scrollDirection: Axis.horizontal,
          ),
          items: context.read<HomeCubit>().bannersList.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: 400.w,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Image.asset(i));
              },
            );
          }).toList(),
        ),
        SizedBox(
          height: 32.w,
        ),
        Row(
          children: [
            SizedBox(
              width: 16.w,
            ),
            Text(
              "Categories",
              style: GoogleFonts.poppins(
                  fontSize: 18.sp, color: AppColors.primaryColor),
            ),
            const Spacer(
              flex: 1,
            ),
            Text(
              "view all",
              style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              width: 16.w,
            )
          ],
        ),
        SizedBox(
          height: 16.w,
        ),
        const CategoriesGridView(),
        SizedBox(
          height: 16.w,
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Text(
            "Brands",
            style: GoogleFonts.poppins(
                fontSize: 18.sp, color: AppColors.primaryColor),
          ),
        ),
        SizedBox(
          height: 8.w,
        ),
        const BrandsListView()
      ],
    );
  }
}
