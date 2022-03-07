import 'package:chefio/theme/colors.dart';
import 'package:chefio/theme/text_styles.dart';
import 'package:chefio/widgets/items.dart';
import 'package:chefio/widgets/scaffolds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScr extends StatelessWidget {
  const ProfileScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TopBarScaffold(
      topBarChildren: [
        Navigator.canPop(context)
            ? Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 24.sp,
                color: AppColors.primaryText,
              )
            : const SizedBox(),
        Icon(
          Icons.share,
          size: 24.sp,
          color: AppColors.primaryText,
        ),
      ],
      body: SizedBox(
        width: double.infinity,
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              SizedBox(
                height: 22.h,
              ),
              CircleAvatar(
                foregroundImage: const AssetImage(
                  'assets/images/p1.jpg',
                ),
                radius: 50.r,
              ),
              SizedBox(height: 24.h),
              Text(
                'ChefIO',
                style: TxtThemes.h2.copyWith(
                  color: AppColors.primaryText.withAlpha(228),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '32',
                        style: TxtThemes.h2.copyWith(
                          color: AppColors.primaryText.withAlpha(228),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Recipes',
                        style: TxtThemes.s
                            .copyWith(color: AppColors.secondaryText),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '782',
                        style: TxtThemes.h2.copyWith(
                          color: AppColors.primaryText.withAlpha(228),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Followers',
                        style: TxtThemes.s
                            .copyWith(color: AppColors.secondaryText),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '1,877',
                        style: TxtThemes.h2.copyWith(
                          color: AppColors.primaryText.withAlpha(228),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Followers',
                        style: TxtThemes.s
                            .copyWith(color: AppColors.secondaryText),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Divider(
                height: 0,
                thickness: 8.h,
                color: AppColors.form,
              ),
              Card(
                margin: EdgeInsets.zero,
                elevation: 2,
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: AppColors.primary,
                  indicatorWeight: 2.h,
                  labelPadding: EdgeInsets.symmetric(vertical: 16.h),
                  tabs: [
                    Text(
                      'Recipes',
                      style: TxtThemes.h3.copyWith(
                        color: AppColors.primaryText.withAlpha(228),
                      ),
                    ),
                    Text(
                      'Liked',
                      style: TxtThemes.h3.copyWith(
                        color: AppColors.primaryText.withAlpha(228),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 24.h),
                      itemCount: 12,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 152.h + 16.h + 17.sp + 8.h + 12.sp + 6,
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
                        showAuthor: false,
                      ),
                    ),
                    GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      itemCount: 12,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 32.r +
                            16.h +
                            152.h +
                            16.h +
                            17.sp +
                            8.h +
                            12.sp +
                            6,
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
