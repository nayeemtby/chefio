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
  }) : super(key: key);

  final double? width;
  final String txt;
  final VoidCallback? onTap;
  final Widget? child;
  final double? vpad;
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
          primary: child == null ? AppColors.primary : AppColors.secondary,
          onPrimary: AppColors.white,
          padding: EdgeInsets.symmetric(vertical: vpad ?? 20.h),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.r)),
        ),
      ),
    );
  }
}

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
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: value == groupValue ? AppColors.primary : AppColors.form,
        borderRadius: BorderRadius.circular(32.sp),
      ),
      child: Text(
        text,
        style: TxtThemes.h3.copyWith(
          color:
              value == groupValue ? AppColors.white : AppColors.secondaryText,
        ),
      ),
    );
  }
}
