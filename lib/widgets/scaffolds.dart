import 'package:chefio/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoAppBarScaffold extends StatelessWidget {
  const NoAppBarScaffold({
    Key? key,
    required this.body,
  }) : super(key: key);
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: SizedBox(
        width: double.infinity,
        child: body,
      ),
    );
  }
}

class TopBarScaffold extends StatelessWidget {
  const TopBarScaffold({
    Key? key,
    required this.topBarChildren,
    required this.body,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  }) : super(key: key);

  final Widget body;
  final List<Widget> topBarChildren;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 28.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: mainAxisAlignment,
                  children: topBarChildren,
                ),
              ),
              Expanded(child: body),
            ],
          ),
        ),
      ),
    );
  }
}
