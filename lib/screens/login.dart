import 'package:chefio/theme/colors.dart';
import 'package:chefio/theme/text_styles.dart';
import 'package:chefio/widgets/buttons.dart';
import 'package:chefio/widgets/input.dart';
import 'package:chefio/widgets/scaffolds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScr extends StatelessWidget {
  const LoginScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NoAppBarScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Welcome Back!',
                    style: TxtThemes.h1.copyWith(color: AppColors.primaryText),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Please enter your account here',
                    style:
                        TxtThemes.p2.copyWith(color: AppColors.secondaryText),
                  ),
                  SizedBox(height: 32.h),
                  TxtField(
                    inputType: TextInputType.emailAddress,
                    prefix: Icon(
                      Icons.email_outlined,
                      size: 18.sp,
                      color: AppColors.primaryText,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  TxtField(
                    inputType: TextInputType.visiblePassword,
                    obscure: true,
                    prefix: Icon(
                      Icons.lock_outline_rounded,
                      size: 18.sp,
                      color: AppColors.primaryText,
                    ),
                    suffix: Icon(
                      Icons.visibility_outlined,
                      size: 18.sp,
                      color: AppColors.secondaryText,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot password?',
                      style:
                          TxtThemes.p2.copyWith(color: AppColors.primaryText),
                    ),
                  ),
                  SizedBox(height: 36.h),
                  BtnPrimary(
                    txt: 'Login',
                    onTap: () {},
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Or continue with',
                    style:
                        TxtThemes.p2.copyWith(color: AppColors.secondaryText),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  BtnPrimary(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          IconData('G'.codeUnitAt(0), fontFamily: 'Inter'),
                          size: 15.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Google',
                          style: TxtThemes.h3.copyWith(color: AppColors.white),
                        )
                      ],
                    ),
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        style: TxtThemes.p2.copyWith(
                          color: AppColors.primaryText,
                        ),
                      ),
                      Text(
                        'Sign Up',
                        style: TxtThemes.h3.copyWith(
                          color: AppColors.primary,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
