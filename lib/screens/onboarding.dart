import 'package:chefio/screens/login.dart';
import 'package:chefio/theme/colors.dart';
import 'package:chefio/theme/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chefio/widgets/buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScr extends StatelessWidget {
  const OnboardingScr({Key? key}) : super(key: key);
  void _handleStart(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (ctx) => const LoginScr(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Image
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 0.6.sh),
                child: Image.asset('assets/images/onboarding.png'),
              ),

              // Texts
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Start Cooking',
                      textAlign: TextAlign.center,
                      style:
                          TxtThemes.h1.copyWith(color: AppColors.primaryText),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      'Join our community to cook better food',
                      textAlign: TextAlign.center,
                      style:
                          TxtThemes.p1.copyWith(color: AppColors.secondaryText),
                    ),
                  ],
                ),
              ),

              // Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: BtnPrimary(
                  txt: 'Get Started',
                  onTap: () => _handleStart(context),
                ),
              ),

              // For space distribution
              const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
