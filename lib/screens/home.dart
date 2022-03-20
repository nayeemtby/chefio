import 'package:chefio/theme/colors.dart';
import 'package:chefio/theme/text_styles.dart';
import 'package:chefio/widgets/buttons.dart';
import 'package:chefio/widgets/input.dart';
import 'package:chefio/widgets/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScr extends StatelessWidget {
  const HomeScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const _NavBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(
                height: 28.h,
              ),
              const SearchBar(),
              SizedBox(
                height: 24.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Category',
                  style: TxtThemes.h2.copyWith(
                    color: AppColors.primaryText.withAlpha(194),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  const CatRadio(text: 'All', groupValue: 'All'),
                  SizedBox(
                    width: 16.w,
                  ),
                  const CatRadio(text: 'Food', groupValue: 'All'),
                  SizedBox(
                    width: 16.w,
                  ),
                  const CatRadio(text: 'Drink', groupValue: 'All'),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Divider(
                height: 0,
                thickness: 2.h,
                color: AppColors.form,
              ),
              SizedBox(
                height: 24.h,
              ),
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 12,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 264.h,
                    crossAxisCount: 2,
                    crossAxisSpacing: 24.w,
                    mainAxisSpacing: 32.h,
                  ),
                  itemBuilder: (ctx, index) => const RecipeItem(
                    authorImageUri: 'authorImageUri',
                    authorName: 'Toki',
                    imageUri: 'imageUri',
                    itemName: 'Dumplings',
                    categoryName: 'Bento',
                    requiredTime: '60 mins',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavBar extends StatelessWidget {
  const _NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Padding(
            padding: EdgeInsets.only(bottom: 4.h),
            child: Icon(
              const IconData(0xf015, fontFamily: 'fas'),
              size: 24.sp,
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: 'New Recipe',
          icon: Padding(
            padding: EdgeInsets.only(bottom: 4.h),
            child: Icon(
              const IconData(0xf52d, fontFamily: 'fas'),
              size: 24.sp,
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Notification',
          icon: Padding(
            padding: EdgeInsets.only(bottom: 4.h),
            child: Icon(
              const IconData(0xf0f3, fontFamily: 'fas'),
              size: 24.sp,
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Padding(
            padding: EdgeInsets.only(bottom: 4.h),
            child: Icon(
              const IconData(0xf007, fontFamily: 'fas'),
              size: 24.sp,
            ),
          ),
        ),
      ],
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.secondaryText,
      selectedLabelStyle: TxtThemes.s,
      unselectedLabelStyle: TxtThemes.s,
    );
  }
}
