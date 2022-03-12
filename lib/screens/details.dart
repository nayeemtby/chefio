import 'package:chefio/theme/colors.dart';
import 'package:chefio/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScr extends StatelessWidget {
  const DetailsScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              SizedBox.square(
                dimension: 1.sw,
                child: Image.asset(
                  'assets/images/r2.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            width: 1.sw,
            child: _Body(),
          ),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
        color: AppColors.white,
        child: SizedBox(
          height: 0.7.sh,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Cacao milk',
                      style: TxtThemes.h2.copyWith(
                        color: AppColors.primaryText.withAlpha(228),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'Food' + ' * >' + '60 mins',
                      style:
                          TxtThemes.s.copyWith(color: AppColors.secondaryText),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: SizedBox.square(
                                dimension: 32.r,
                                child: Image.asset(
                                  'assets/images/p1.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              'Dareda',
                              style: TxtThemes.h3.copyWith(
                                color: AppColors.primaryText.withAlpha(228),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 32.r,
                              width: 32.r,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(32.r),
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.favorite_rounded,
                                size: 18.sp,
                                color: AppColors.white.withAlpha(96),
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text('277 Likes',
                                style: TxtThemes.h3.copyWith(
                                  color: AppColors.primaryText.withAlpha(228),
                                ))
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Divider(
                      height: 0,
                      thickness: 1.h,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          'Description',
                          style: TxtThemes.h2.copyWith(
                            color: AppColors.primaryText.withAlpha(228),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          'Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your',
                          style: TxtThemes.p2.copyWith(
                            color: AppColors.secondaryText,
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Divider(
                          height: 0,
                          thickness: 1.h,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          'Ingredients',
                          style: TxtThemes.h2.copyWith(
                            color: AppColors.primaryText.withAlpha(228),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        const _Ingredient(text: '4 Eggs'),
                        const _Ingredient(text: '1/2 Butter'),
                        const _Ingredient(text: '1/2 Olive Oil'),
                        const _Ingredient(text: '1 Lemon'),
                        SizedBox(
                          height: 16.h,
                        ),
                        Divider(
                          height: 0,
                          thickness: 1.h,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          'Steps',
                          style: TxtThemes.h2.copyWith(
                            color: AppColors.primaryText.withAlpha(228),
                          ),
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        const _StepItem(index: 0),
                        const _StepItem(index: 1),
                        const _StepItem(index: 2),
                        const _StepItem(index: 3),
                        const _StepItem(index: 3),
                        const _StepItem(index: 3),
                      ],
                    ),
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

class _Ingredient extends StatelessWidget {
  const _Ingredient({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 24.sp,
            width: 24.sp,
            child: Icon(
              Icons.check,
              size: 16.sp,
              color: AppColors.primary,
            ),
            decoration: BoxDecoration(
              color: AppColors.primary.withAlpha(32),
              borderRadius: BorderRadius.circular(24.r),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            text,
            style: TxtThemes.p2.copyWith(
              color: AppColors.primaryText,
            ),
          ),
        ],
      ),
    );
  }
}

class _StepItem extends StatelessWidget {
  const _StepItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            color: AppColors.primaryText.withAlpha(228),
            borderRadius: BorderRadius.circular(24.r),
            child: SizedBox.square(
              dimension: 24.r,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  (index + 1).toString(),
                  style: TxtThemes.s.copyWith(color: AppColors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: Text(
              'Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your',
              style: TxtThemes.p2.copyWith(color: AppColors.primaryText),
            ),
          )
        ],
      ),
    );
  }
}
