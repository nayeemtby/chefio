import 'package:chefio/theme/colors.dart';
import 'package:chefio/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SheetHandle extends StatelessWidget {
  const SheetHandle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100.r),
      child: SizedBox(
        width: 40.w,
        height: 5.h,
        child: ColoredBox(
          color: AppColors.secondaryText.withAlpha(96),
        ),
      ),
    );
  }
}

class StepIndex extends StatelessWidget {
  const StepIndex({
    Key? key,
    required this.index,
  }) : super(key: key);

  final String index;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primaryText.withAlpha(228),
      borderRadius: BorderRadius.circular(24.r),
      child: SizedBox.square(
        dimension: 24.r,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            index,
            style: TxtThemes.s.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
