import 'package:chefio/screens/signup_success.dart';
import 'package:chefio/screens/verifycode.dart';
import 'package:chefio/theme/colors.dart';
import 'package:chefio/theme/text_styles.dart';
import 'package:chefio/widgets/auth.dart';
import 'package:chefio/widgets/buttons.dart';
import 'package:chefio/widgets/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScr extends StatelessWidget {
  const SignupScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SizedBox(
            height: 1.sh,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                SizedBox(), // For space distribution
                _EmailRegisterSection(),
                _AlternativeSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailRegisterSection extends StatelessWidget {
  const _EmailRegisterSection({Key? key}) : super(key: key);

  void _handleSignup(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (ctx) => PinVerifyScr(
          successRoute: CupertinoPageRoute(
            builder: (ctx) => const SignupSuccessScr(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Title and subtitle
        Text(
          'Welcome!',
          style: TxtThemes.h1.copyWith(color: AppColors.primaryText),
        ),
        SizedBox(height: 8.h),
        Text(
          'Fill in the form to continue sign up',
          style: TxtThemes.p2.copyWith(color: AppColors.secondaryText),
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

        // Input Fields
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

        // Status
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Your Password must contain:',
            style: TxtThemes.p1.copyWith(color: AppColors.primaryText),
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

        // Button
        BtnPrimary(
          txt: 'Sign Up',
          onTap: () => _handleSignup(context),
        ),
      ],
    );
  }
}

class _AlternativeSection extends StatelessWidget {
  const _AlternativeSection({
    Key? key,
  }) : super(key: key);

  void _gotoLogin(BuildContext context) {
    Navigator.pop(context);
  }

  void _signupWithGoogle(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Or sign up with',
          style: TxtThemes.p2.copyWith(color: AppColors.secondaryText),
        ),
        SizedBox(
          height: 24.h,
        ),
        BtnPrimary(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                const IconData(0xf1a0, fontFamily: 'fab'),
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
          onTap: () => _signupWithGoogle(context),
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
            GestureDetector(
              onTap: () => _gotoLogin(context),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Text(
                  'Login',
                  style: TxtThemes.h3.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
