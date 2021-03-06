import 'package:chefio/screens/login.dart';
import 'package:chefio/screens/verifycode.dart';
import 'package:chefio/theme/colors.dart';
import 'package:chefio/theme/text_styles.dart';
import 'package:chefio/widgets/auth.dart';
import 'package:chefio/widgets/buttons.dart';
import 'package:chefio/widgets/dialogs.dart';
import 'package:chefio/widgets/input.dart';
import 'package:chefio/widgets/scaffolds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PskRecoverScr extends StatelessWidget {
  const PskRecoverScr({Key? key}) : super(key: key);

  void _handleContinue(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (ctx) => PinVerifyScr(
          successRoute: CupertinoPageRoute(
            builder: (ctx) => const PostPskRecoverScr(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NoAppBarScaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: 1.sh,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(
                  height: 32.h,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: BtnBack(),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Title and subtitle
                          Text(
                            'Password recovery',
                            style: TxtThemes.h1
                                .copyWith(color: AppColors.primaryText),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Enter your new password',
                            style: TxtThemes.p2
                                .copyWith(color: AppColors.secondaryText),
                          ),
                          SizedBox(height: 32.h),

                          // Input Field
                          TxtField(
                            hint: 'Email',
                            inputType: TextInputType.emailAddress,
                            prefix: Icon(
                              Icons.email_outlined,
                              size: 18.sp,
                              color: AppColors.primaryText,
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),

                          // Button
                          BtnPrimary(
                            txt: 'Continue',
                            onTap: () => _handleContinue(context),
                          ),
                        ],
                      ),

                      // For space distribution
                      const SizedBox(),
                      const SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class PostPskRecoverScr extends StatelessWidget {
  const PostPskRecoverScr({Key? key}) : super(key: key);

  _handleReset(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (ctx) => SuccessDialog(
        title: 'Reset Success',
        subtitle:
            'Your password was successfully reset. You can login with your new password now.',
        buttonText: 'Goto Login',
        onTap: () => Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(
            builder: (ctx) => const LoginScr(),
          ),
          (route) => !Navigator.canPop(context),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NoAppBarScaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: 1.sh,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(
                  height: 32.h,
                ),
                const Align(alignment: Alignment.centerLeft, child: BtnBack()),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Title and subtitle
                          Text(
                            'Password recovery',
                            style: TxtThemes.h1
                                .copyWith(color: AppColors.primaryText),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Enter your email to recover your password',
                            style: TxtThemes.p2
                                .copyWith(color: AppColors.secondaryText),
                          ),
                          SizedBox(height: 32.h),

                          // Input field
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

                          // Button
                          BtnPrimary(
                            txt: 'Reset Password',
                            onTap: () => _handleReset(context),
                          ),
                        ],
                      ),

                      // For space distribution
                      const SizedBox(),
                      const SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
