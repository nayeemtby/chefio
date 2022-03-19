import 'dart:math';
import 'dart:ui';

import 'package:chefio/theme/colors.dart';
import 'package:chefio/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProviderHolder<T> {
  ProviderHolder();
  bool filled = false;
  late T provider;
}

class DetailsScr extends StatelessWidget {
  DetailsScr({Key? key}) : super(key: key);

  final ProviderHolder<MediaQueryData> mqData = ProviderHolder();
  @override
  Widget build(BuildContext context) {
    if (!mqData.filled) {
      mqData.provider = MediaQuery.of(context);
    }
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              SizedBox.square(
                dimension: 1.sw,
                child: InteractiveViewer(
                  child: Image.asset(
                    'assets/images/r2.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            width: 1.sw,
            child: SizedBox(
              height: 1.sh - mqData.provider.viewPadding.top,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  scrollbars: false,
                ),
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    const SliverPersistentHeader(delegate: _BackBtnHeader()),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _DetailsHeader(),
                    ),
                    const SliverToBoxAdapter(
                      child: _DetailsBody(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailsBody extends StatelessWidget {
  const _DetailsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
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
    );
  }
}

class _DetailsAuthor extends StatelessWidget {
  const _DetailsAuthor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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

class _DetailsHeader extends SliverPersistentHeaderDelegate {
  _DetailsHeader();

  final double height = 16.h +
      5.h +
      24.h +
      8.h +
      16.h +
      16.h +
      1.h +
      32.r +
      17.sp +
      12.sp +
      10.h; // 10 safety
  // (16 + 5 + 24 + 8 + 32 + 1).h + 32.r + 29.sp;
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return TweenAnimationBuilder<double>(
      curve: Curves.ease,
      duration: const Duration(milliseconds: 200),
      tween: Tween<double>(begin: 0, end: shrinkOffset > 0 ? 0 : 1),
      builder: (context, value, child) {
        return Material(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.r * value),
            topRight: Radius.circular(32.r * value),
          ),
          color: AppColors.white,
          child: child,
        );
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            height: constraints.maxHeight,
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Cacao milk',
                          style: TxtThemes.h2.copyWith(
                            color: AppColors.primaryText.withAlpha(228),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Food' ' * >' '60 mins',
                          style: TxtThemes.s
                              .copyWith(color: AppColors.secondaryText),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      const _DetailsAuthor(),
                      SizedBox(
                        height: 16.h,
                      ),
                      Divider(
                        height: 0,
                        thickness: 1.h,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  double get maxExtent => height + 1;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class _BackBtnHeader extends SliverPersistentHeaderDelegate {
  const _BackBtnHeader();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double maxWidth = 1.sw;
    final double maxHeight = maxExtent - shrinkOffset;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
      child: SizedBox(
        height: maxHeight,
        width: maxWidth,
        child: Padding(
          padding: EdgeInsets.only(top: 26.h, left: 24.w),
          child: Align(
            alignment: Alignment.topLeft,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final double _factor = constraints.maxHeight / 56.r;
                return ClipRRect(
                  borderRadius: BorderRadius.circular(56.r),
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                      child: ColoredBox(
                        color: AppColors.white.withAlpha(0x33),
                        child: SizedBox.square(
                          dimension: 56.r * min(_factor, 1),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 16.r * min(_factor, 1),
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      )),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 0.3.sh;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
