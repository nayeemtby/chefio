import 'package:chefio/screens/home.dart';
import 'package:chefio/screens/pskrecover.dart';
import 'package:chefio/screens/signup.dart';
import 'package:chefio/theme/colors.dart';
import 'package:chefio/theme/text_styles.dart';
import 'package:chefio/widgets/buttons.dart';
import 'package:chefio/widgets/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScr extends StatelessWidget {
  const LoginScr({Key? key}) : super(key: key);

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
                _EmailLoginSection(),
                _AlternativeSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailLoginSection extends StatelessWidget {
  const _EmailLoginSection({
    Key? key,
  }) : super(key: key);

  void _handleLogin(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(
        builder: (ctx) => const HomeScr(),
      ),
      (route) => !Navigator.canPop(context),
    );
  }

  void _gotoPasswordRecovery(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (ctx) => const PskRecoverScr(),
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
          'Welcome Back!',
          style: TxtThemes.h1.copyWith(color: AppColors.primaryText),
        ),
        SizedBox(height: 8.h),
        Text(
          'Please enter your account here',
          style: TxtThemes.p2.copyWith(color: AppColors.secondaryText),
        ),
        SizedBox(height: 32.h),

        // Input fields
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

        // Password Recovery
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () => _gotoPasswordRecovery(context),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Text(
                'Forgot password?',
                style: TxtThemes.p2.copyWith(color: AppColors.primaryText),
              ),
            ),
          ),
        ),
        SizedBox(height: 36.h),

        // Button
        BtnPrimary(
          txt: 'Login',
          onTap: () => _handleLogin(context),
        ),
      ],
    );
  }
}

class _AlternativeSection extends StatelessWidget {
  const _AlternativeSection({
    Key? key,
  }) : super(key: key);

  void _loginWithGoogle(BuildContext context) {}

  void _gotoSignup(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (ctx) => const SignupScr(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Or continue with',
          style: TxtThemes.p2.copyWith(color: AppColors.secondaryText),
        ),
        SizedBox(
          height: 24.h,
        ),
        BtnPrimary(
          color: AppColors.secondary,
          onTap: () => _loginWithGoogle(context),
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
                style: TxtThemes.h3.copyWith(color: AppColors.white),
              )
            ],
          ),
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
            GestureDetector(
              onTap: () => _gotoSignup(context),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Text(
                  'Sign Up',
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
