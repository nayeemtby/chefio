import 'package:chefio/theme/colors.dart';
import 'package:chefio/theme/text_styles.dart';
import 'package:chefio/widgets/buttons.dart';
import 'package:chefio/widgets/input.dart';
import 'package:chefio/widgets/scaffolds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScr extends StatelessWidget {
  const SignupScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NoAppBarScaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SizedBox(
                  height: 1.sh,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Welcome!',
                            style: TxtThemes.h1
                                .copyWith(color: AppColors.primaryText),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Fill in the form to continue sign up',
                            style: TxtThemes.p2
                                .copyWith(color: AppColors.secondaryText),
                          ),
                          SizedBox(height: 32.h),
                          TxtField(
                            hint: 'Email',
                            inputType: TextInputType.emailAddress,
                            prefix: Icon(
                              Icons.email_outlined,
                              size: 18.sp,
                              color: AppColors.primaryText,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          TxtField(
                            hint: 'Password',
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
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Your Password must contain:',
                              style: TxtThemes.p1
                                  .copyWith(color: AppColors.primaryText),
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          const PasswordCondition(
                            text: 'Atleast 6 characters',
                            isTrue: true,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          const PasswordCondition(
                            text: 'A number',
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          BtnPrimary(
                            txt: 'Sign Up',
                            onTap: () {},
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Or sign up with',
                            style: TxtThemes.p2
                                .copyWith(color: AppColors.secondaryText),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          BtnPrimary(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  IconData('G'.codeUnitAt(0),
                                      fontFamily: 'Inter'),
                                  size: 15.sp,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  'Google',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.sp,
                                  ),
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
                                'Already have an account? ',
                                style: TxtThemes.p2.copyWith(
                                  color: AppColors.primaryText,
                                ),
                              ),
                              Text(
                                'Login',
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
            ),
          ),
        ],
      ),
    );
  }
}

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
