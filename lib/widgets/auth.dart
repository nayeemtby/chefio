import 'package:chefio/theme/colors.dart';
import 'package:chefio/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// For displaying password condition and it's status.
///
/// The `text` parameter is used to brief the condition. It must be provided.
///
/// The `isTrue` parameter is used to define the status of the condition. Defaults to false.
class PasswordCondition extends StatelessWidget {
  const PasswordCondition({
    Key? key,
    required this.text,
    this.isTrue = false,
  }) : super(key: key);

  final String text;
  final bool isTrue;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon
          Container(
            height: 24.sp,
            width: 24.sp,
            child: Icon(
              Icons.check,
              size: 16.sp,
              color: isTrue ? AppColors.primary : AppColors.secondaryText,
            ),
            decoration: BoxDecoration(
              color: isTrue
                  ? AppColors.primary.withAlpha(32)
                  : AppColors.secondaryText.withAlpha(32),
              borderRadius: BorderRadius.circular(24.r),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),

          // Text
          Text(
            text,
            style: TxtThemes.p2.copyWith(
              color: isTrue ? AppColors.primaryText : AppColors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}
