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
              const RecipeItem(
                authorImageUri: '',
                authorName: 'Calcum Lewis',
                imageUri: '',
                itemName: 'Pancake',
                categoryName: 'Food',
                requiredTime: '60 mins',
              )
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
          icon: Icon(
            Icons.home,
            size: 24.sp,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Upload',
          icon: Icon(
            Icons.my_library_add_rounded,
            size: 24.sp,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Notification',
          icon: Icon(
            Icons.notifications,
            size: 24.sp,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(
            Icons.person,
            size: 24.sp,
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
