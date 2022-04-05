import 'dart:math' show min;
import 'dart:ui';
import 'package:chefio/theme/colors.dart';
import 'package:chefio/theme/text_styles.dart';
import 'package:chefio/widgets/misc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScr extends StatelessWidget {
  const DetailsScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mqData = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Recipe cover image
          SizedBox(
            height: 1.sh,
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox.square(
                dimension: 1.sw,
                child: InteractiveViewer(
                  child: Image.asset(
                    'assets/images/r2.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            width: 1.sw,
            child: SizedBox(
              height: 1.sh - mqData.viewPadding.top,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  scrollbars: false,
                ),
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    // Back Button
                    const SliverPersistentHeader(delegate: _BackBtnHeader()),

                    // Recipe and author info
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _DetailsHeader(),
                    ),

                    // Details Body
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

            // Description
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

            // Ingredients
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

            // Steps
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
            const _StepItem(index: 4),
            const _StepItem(index: 5),
          ],
        ),
      ),
    );
  }
}

class _FavouriteIcon extends StatelessWidget {
  const _FavouriteIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          StepIndex(index: (index + 1).toString()),
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
      // Tween options
      curve: Curves.ease,
      duration: const Duration(milliseconds: 200),
      tween: Tween<double>(begin: 0, end: shrinkOffset > 0 ? 0 : 1),

      // Builder
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

      // Prebuilt child
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
                const Center(
                  child: SheetHandle(),
                ),
                SizedBox(
                  height: 24.h,
                ),
                const _RecipeInfo(),
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

class _RecipeInfo extends StatelessWidget {
  const _RecipeInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Recipe name, Category and time
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
              style: TxtThemes.s.copyWith(color: AppColors.secondaryText),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),

          // Author and likes
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Author
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const _AuthorImage(),
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

              // Likes
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const _FavouriteIcon(),
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
    );
  }
}

class _AuthorImage extends StatelessWidget {
  const _AuthorImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: SizedBox.square(
        dimension: 32.r,
        child: Image.asset(
          'assets/images/p1.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _BackBtnHeader extends SliverPersistentHeaderDelegate {
  const _BackBtnHeader();

  void _goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double maxWidth = 1.sw;
    final double maxHeight = maxExtent - shrinkOffset;
    return SizedBox(
      height: maxHeight,
      width: maxWidth,
      child: Padding(
        padding: EdgeInsets.only(top: 26.h, left: 24.w),
        child: Align(
          alignment: Alignment.topLeft,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double _factor = constraints.maxHeight / 56.r;

              // Button
              return ClipRRect(
                borderRadius: BorderRadius.circular(56.r),
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                    child: Material(
                      color: AppColors.white.withAlpha(0x33),
                      child: InkWell(
                        onTap: () => _goBack(context),
                        splashFactory: InkRipple.splashFactory,
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
                      ),
                    )),
              );
            },
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
