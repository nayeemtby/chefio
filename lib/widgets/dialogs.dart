import 'package:chefio/theme/colors.dart';
import 'package:chefio/theme/text_styles.dart';
import 'package:chefio/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String buttonText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      child: Padding(
        padding: EdgeInsets.all(48.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle_outline_outlined,
              size: 140.sp,
              color: AppColors.primary,
            ),
            SizedBox(
              height: 32.h,
            ),

            // Title and subtitle
            Text(
              title,
              style: TxtThemes.h1.copyWith(
                color: AppColors.primaryText.withAlpha(228),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TxtThemes.p2.copyWith(color: AppColors.primaryText),
            ),
            SizedBox(height: 24.h),

            // Button
            BtnPrimary(
              txt: buttonText,
              onTap: onTap,
            )
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
      ),
    );
  }
}
