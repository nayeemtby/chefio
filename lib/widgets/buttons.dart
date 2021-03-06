import 'package:chefio/theme/colors.dart';
import 'package:chefio/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BtnPrimary extends StatelessWidget {
  const BtnPrimary({
    Key? key,
    this.txt = 'Button',
    this.child,
    this.onTap,
    this.width = double.infinity,
    this.vpad,
    this.color = AppColors.primary,
  }) : super(key: key);

  final double? width;
  final String txt;
  final VoidCallback? onTap;
  final Widget? child;
  final double? vpad;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        child: child ??
            Text(
              txt,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15.sp,
                color: AppColors.white,
              ),
            ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: EdgeInsets.symmetric(vertical: vpad ?? 20.h),
          primary: color,
          onPrimary: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
        ),
      ),
    );
  }
}

/// Used as category buttons in explore page.
///
/// Provide the category name as `text` parameter.
///
/// Provide the radio value as `groupValue` parameter.
///
/// Both parameters must be provided.
class CatRadio extends StatelessWidget {
  const CatRadio({
    Key? key,
    required this.text,
    required this.groupValue,
  })  : value = text,
        super(key: key);

  final String text;
  final String groupValue;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
      ),
      decoration: BoxDecoration(
        color: value == groupValue ? AppColors.primary : AppColors.form,
        borderRadius: BorderRadius.circular(32.sp),
      ),
      child: Center(
        child: Text(
          text,
          style: TxtThemes.h3.copyWith(
            color:
                value == groupValue ? AppColors.white : AppColors.secondaryText,
          ),
        ),
      ),
    );
  }
}

class BtnBack extends StatelessWidget {
  const BtnBack({
    Key? key,
  }) : super(key: key);

  void _goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _goBack(context),
      splashFactory: InkRipple.splashFactory,
      borderRadius: BorderRadius.circular(56.r),
      child: SizedBox.square(
        dimension: 56.r,
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 24.sp,
          color: AppColors.primaryText,
        ),
      ),
    );
  }
}

class BtnSecondary extends StatelessWidget {
  const BtnSecondary({
    Key? key,
    this.text = 'Button',
    this.width = double.infinity,
    this.onTap,
    this.child,
    this.vpad,
  }) : super(key: key);

  final String text;
  final Widget? child;
  final double? width;
  final VoidCallback? onTap;
  final double? vpad;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: vpad ?? 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
            side: BorderSide(
              width: 1.sp,
              color: AppColors.form,
            ),
          ),
        ),
        child: child ??
            Text(
              text,
              style: TxtThemes.p2.copyWith(
                color: AppColors.primaryText.withAlpha(228),
              ),
            ),
      ),
    );
  }
}
