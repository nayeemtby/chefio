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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
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
              child: SizedBox(
                height: 152.h,
                child: Image.asset(
                  'assets/images/r1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
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
