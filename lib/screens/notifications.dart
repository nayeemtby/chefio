import 'package:chefio/theme/colors.dart';
import 'package:chefio/theme/text_styles.dart';
import 'package:chefio/widgets/buttons.dart';
import 'package:chefio/widgets/scaffolds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScr extends StatelessWidget {
  const NotificationScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NoAppBarScaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(
                height: 26.h,
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: Text(
                        'New',
                        style: TxtThemes.h2.copyWith(
                          color: AppColors.primaryText.withAlpha(228),
                        ),
                      ),
                    ),
                    const _NotificationFollow(),
                    const _NotificationFollow(
                      followed: true,
                    ),
                    const _NotificationLike(),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: Text(
                        'Today',
                        style: TxtThemes.h2.copyWith(
                          color: AppColors.primaryText.withAlpha(228),
                        ),
                      ),
                    ),
                    const _NotificationFollow(),
                    const _NotificationFollow(
                      followed: true,
                    ),
                    const _NotificationLike(),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: Text(
                        'Earlier',
                        style: TxtThemes.h2.copyWith(
                          color: AppColors.primaryText.withAlpha(228),
                        ),
                      ),
                    ),
                    const _NotificationFollow(),
                    const _NotificationFollow(
                      followed: true,
                    ),
                    const _NotificationLike(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _NotificationLike extends StatelessWidget {
  const _NotificationLike({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          SizedBox.square(
            dimension: 64.r,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                CircleAvatar(
                  foregroundImage: const AssetImage('assets/images/p3.jpg'),
                  radius: 24.r,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: SizedBox.square(
                    dimension: 52.r,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(52.r),
                      child: ColoredBox(
                        color: AppColors.white,
                        child: Center(
                          child: CircleAvatar(
                            foregroundImage:
                                const AssetImage('assets/images/p3.jpg'),
                            radius: 24.r,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'John Steve',
                        style: TxtThemes.h3.copyWith(
                          color: AppColors.primaryText.withAlpha(228),
                        ),
                      ),
                      TextSpan(
                        text: ' and ',
                        style: TxtThemes.p2
                            .copyWith(color: AppColors.secondaryText),
                      ),
                      TextSpan(
                        text: 'Sam Winchester',
                        style: TxtThemes.h3.copyWith(
                          color: AppColors.primaryText.withAlpha(228),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'liked your recipe \u2022 20 min',
                  style: TxtThemes.s.copyWith(color: AppColors.secondaryText),
                )
              ],
            ),
          ),
          SizedBox.square(
            dimension: 64.r,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                'assets/images/r1.jpg',
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _NotificationFollow extends StatelessWidget {
  const _NotificationFollow({
    Key? key,
    this.followed = false,
  }) : super(key: key);

  final bool followed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          CircleAvatar(
            foregroundImage: const AssetImage('assets/images/p1.jpg'),
            radius: 24.r,
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Dean Winchester',
                  style: TxtThemes.h3.copyWith(
                    color: AppColors.primaryText.withAlpha(228),
                  ),
                ),
                Text(
                  'is now following you \u2022 1h',
                  style: TxtThemes.s.copyWith(color: AppColors.secondaryText),
                )
              ],
            ),
          ),
          followed
              ? SizedBox(
                  width: 88.w,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Followed',
                      style: TxtThemes.s.copyWith(color: AppColors.primaryText),
                    ),
                  ),
                )
              : BtnPrimary(
                  txt: 'Follow',
                  onTap: () {},
                  width: 88.w,
                  vpad: 12.h,
                )
        ],
      ),
    );
  }
}
