import 'package:chefio/theme/colors.dart';
import 'package:chefio/theme/text_styles.dart';
import 'package:chefio/widgets/buttons.dart';
import 'package:chefio/widgets/scaffolds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class PinVerifyScr extends StatefulWidget {
  const PinVerifyScr({
    Key? key,
    required this.successRoute,
  }) : super(key: key);

  final Route successRoute;
  @override
  State<PinVerifyScr> createState() => _PinVerifyScrState();
}

class _PinVerifyScrState extends State<PinVerifyScr> {
  final FocusNode pinFocusNode = FocusNode();
  final TextEditingController pinController = TextEditingController();

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
  void dispose() {
    pinFocusNode.dispose();
    pinController.dispose();
    super.dispose();
  }

  void _handleContinue(BuildContext context) => Navigator.pushReplacement(
        context,
        widget.successRoute,
      );

  void _handleResend() {}

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
                      // Title and subtitle
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

                        // Input Field
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

                        // Status
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

                        // Buttons
                        BtnPrimary(
                          txt: 'Continue',
                          onTap: () => _handleContinue(context),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        BtnPrimary(
                          txt: 'Send again',
                          onTap: () => _handleResend(),
                        ),
                      ],
                    ),

                    // For Space distribution
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
