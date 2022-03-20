import 'dart:ui';

import 'package:chefio/theme/colors.dart';
import 'package:chefio/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({
    Key? key,
    required this.authorImageUri,
    required this.authorName,
    required this.imageUri,
    required this.itemName,
    required this.categoryName,
    required this.requiredTime,
    this.showAuthor = true,
  }) : super(key: key);

  final String authorImageUri;
  final String authorName;
  final String imageUri;
  final String itemName;
  final String categoryName;
  final String requiredTime;
  final bool showAuthor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        width: 152.w,
        height: 264.h - (showAuthor ? 0 : (32.r + 16.h)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            showAuthor
                ? Row(
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
                        authorName,
                        style:
                            TxtThemes.s.copyWith(color: AppColors.primaryText),
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                      ),
                    ],
                  )
                : const SizedBox(),
            showAuthor
                ? SizedBox(
                    height: 16.h,
                  )
                : const SizedBox(),
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Stack(
                children: [
                  SizedBox(
                    height: 152.h,
                    child: Image.asset(
                      'assets/images/r2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 16.sp,
                    right: 16.sp,
                    child: showAuthor
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                              child: ColoredBox(
                                color: AppColors.white.withOpacity(0.2),
                                child: SizedBox.square(
                                  dimension: 32.sp,
                                  child: Center(
                                    child: Icon(
                                      Icons.favorite_border_rounded,
                                      size: 24.sp,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  )
                ],
              ),
            ),
            const Expanded(
              child: SizedBox(
                  // height: 16.h,
                  ),
            ),
            Text(
              itemName,
              style: TxtThemes.h2
                  .copyWith(color: AppColors.primaryText.withAlpha(228)),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              categoryName + ' * >' + requiredTime,
              style: TxtThemes.s.copyWith(color: AppColors.secondaryText),
            )
          ],
        ),
      ),
    );
  }
}
