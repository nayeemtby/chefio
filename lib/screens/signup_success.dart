import 'package:chefio/screens/home.dart';
import 'package:chefio/theme/colors.dart';
import 'package:chefio/theme/text_styles.dart';
import 'package:chefio/widgets/buttons.dart';
import 'package:chefio/widgets/scaffolds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupSuccessScr extends StatelessWidget {
  const SignupSuccessScr({Key? key}) : super(key: key);

  void _handleContinue(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(builder: (ctx) => const HomeScr()),
      (route) => !Navigator.canPop(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NoAppBarScaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: 1.sh,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Checkmark
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
                'Signup Complete',
                style: TxtThemes.h1.copyWith(
                  color: AppColors.primaryText.withAlpha(228),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'You can continue using the app',
                textAlign: TextAlign.center,
                style: TxtThemes.p2.copyWith(color: AppColors.primaryText),
              ),
              SizedBox(height: 24.h),

              // Button
              BtnPrimary(
                txt: 'Continue',
                onTap: () => _handleContinue(context),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
