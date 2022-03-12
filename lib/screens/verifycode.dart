import 'package:chefio/screens/pskrecover.dart';
import 'package:chefio/theme/colors.dart';
import 'package:chefio/theme/text_styles.dart';
import 'package:chefio/widgets/buttons.dart';
import 'package:chefio/widgets/scaffolds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class PinVerifyScr extends StatefulWidget {
  const PinVerifyScr({Key? key}) : super(key: key);
  @override
  State<PinVerifyScr> createState() => _PinVerifyScrState();
}

class _PinVerifyScrState extends State<PinVerifyScr> {
  final FocusNode pinFocusNode = FocusNode();
  final TextEditingController pinController = TextEditingController();

  @override
  void dispose() {
    pinFocusNode.dispose();
    pinController.dispose();
    super.dispose();
  }

  final PinTheme defaultPinTheme = PinTheme(
    height: 72.r,
    width: 72.r,
    textStyle: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 34.sp,
      color: AppColors.primaryText.withAlpha(228),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.r),
      border: Border.all(width: 1.sp, color: AppColors.form),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return NoAppBarScaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: 1.sh,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(
                height: 32.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 24.sp,
                    color: AppColors.primaryText,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Enter verification code',
                          style: TxtThemes.h1
                              .copyWith(color: AppColors.primaryText),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'We\'ve sent you a verification code to your email',
                          style: TxtThemes.p2
                              .copyWith(color: AppColors.secondaryText),
                        ),
                        SizedBox(height: 32.h),
                        Pinput(
                          controller: pinController,
                          focusNode: pinFocusNode,
                          defaultPinTheme: defaultPinTheme,
                          focusedPinTheme: defaultPinTheme.copyDecorationWith(
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(
                                  width: 1.sp, color: AppColors.primary)),
                        ),
                        SizedBox(
                          height: 48.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Code expires in: ',
                              style: TxtThemes.p2
                                  .copyWith(color: AppColors.primaryText),
                            ),
                            Text(
                              '03:12',
                              style: TxtThemes.p2
                                  .copyWith(color: AppColors.secondary),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        BtnPrimary(
                          txt: 'Continue',
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (ctx) => const PostPskRecoverScr(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(),
                    const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
