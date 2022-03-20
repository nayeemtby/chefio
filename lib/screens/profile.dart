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
        InkWell(
          onTap: () => showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.r),
                topRight: Radius.circular(32.r),
              ),
            ),
            context: context,
            builder: (ctx) => _ProfileOptionSheet(),
          ),
          splashFactory: InkRipple.splashFactory,
          borderRadius: BorderRadius.circular(56.r),
          child: SizedBox.square(
            dimension: 56.r,
            child: Center(
              child: Icon(
                Icons.more_vert_rounded,
                size: 24.sp,
                color: AppColors.primaryText,
              ),
            ),
          ),
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
                        'Following',
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
                        horizontal: 24.w,
                        vertical: 24.h,
                      ),
                      itemCount: 12,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent:
                            152.h + 16.h + 17.sp + 8.h + 12.sp + 10.h,
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
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 24.h,
                      ),
                      itemCount: 12,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 32.r +
                            16.h +
                            152.h +
                            16.h +
                            17.sp +
                            8.h +
                            12.sp +
                            10.h,
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

class _ProfileOptionSheet extends StatelessWidget {
  const _ProfileOptionSheet({
    Key? key,
    this.canLogOut = false,
  }) : super(key: key);
  final bool canLogOut;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(32.r),
      child: SizedBox(
        width: 1.sw,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 16.h,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: SizedBox(
                  width: 40.w,
                  height: 5.h,
                  child: ColoredBox(
                    color: AppColors.secondaryText.withAlpha(96),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            _SheetBtn(
              iconData: Icons.share_rounded,
              text: 'Share',
              onTap: () {},
            ),
            _SheetBtn(
              iconData: Icons.settings_rounded,
              text: 'Settings',
              onTap: () {},
            ),
            _SheetBtn(
              iconData: Icons.logout_rounded,
              text: 'Logout',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _SheetBtn extends StatelessWidget {
  const _SheetBtn({
    Key? key,
    required this.iconData,
    required this.text,
    this.onTap,
  }) : super(key: key);

  final IconData iconData;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashFactory: InkRipple.splashFactory,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 18.sp,
              color: AppColors.primaryText,
            ),
            SizedBox(
              width: 12.w,
            ),
            Text(
              text,
              style: TxtThemes.h2.copyWith(
                color: AppColors.primaryText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
