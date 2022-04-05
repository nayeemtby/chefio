import 'package:chefio/screens/onboarding.dart';
import 'package:chefio/theme/colors.dart';
import 'package:chefio/theme/text_styles.dart';
import 'package:chefio/widgets/buttons.dart';
import 'package:chefio/widgets/items.dart';
import 'package:chefio/widgets/misc.dart';
import 'package:chefio/widgets/scaffolds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScr extends StatelessWidget {
  const ProfileScr({Key? key}) : super(key: key);

  void _showOptions(BuildContext context) {
    final bool canPop = Navigator.canPop(context);
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
      ),
      context: context,
      builder: (ctx) => _ProfileOptionSheet(
        canLogOut: !canPop,
      ),
    );
  }

  void _goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final bool canPop = Navigator.canPop(context);
    return TopBarScaffold(
      // Back button and options button
      topBarChildren: [
        canPop
            ? _BtnIcon(
                iconData: Icons.arrow_back_ios_new_rounded,
                onTap: () => _goBack(context),
              )
            : const SizedBox(),
        _BtnIcon(
          iconData: Icons.more_vert_rounded,
          onTap: () => _showOptions(context),
        ),
      ],
      body: SizedBox(
        width: double.infinity,
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              SizedBox(
                height: 22.h,
              ),

              // User image, name and metrics
              const _UserInfo(),
              SizedBox(
                height: 24.h,
              ),
              Divider(
                height: 0,
                thickness: 8.h,
                color: AppColors.form,
              ),

              // TabBar to switch between User recipes and Liked recipes
              const _TabBar(),

              // GridViews for User and Liked recipes
              Expanded(
                child: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    // User recipes
                    _RecipeGridView(
                      mainAxisExtent: 264.h - 16.h - 32.r,
                      itemBuilder: (ctx, index) => const RecipeItem(
                        authorImageUri: 'authorImageUri',
                        authorName: 'Toki',
                        imageUri: 'imageUri',
                        itemName: 'Dumplings',
                        categoryName: 'Bento',
                        requiredTime: '60 mins',
                        showAuthor: false,
                      ),
                    ),

                    // Liked recipes
                    _RecipeGridView(
                      mainAxisExtent: 264.h,
                      itemBuilder: (ctx, index) => const RecipeItem(
                        authorImageUri: 'authorImageUri',
                        authorName: 'Toki',
                        imageUri: 'imageUri',
                        itemName: 'Dumplings',
                        categoryName: 'Bento',
                        requiredTime: '60 mins',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RecipeGridView extends StatelessWidget {
  const _RecipeGridView({
    Key? key,
    required this.mainAxisExtent,
    required this.itemBuilder,
  }) : super(key: key);

  final double mainAxisExtent;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 24.h,
      ),
      itemCount: 12,

      // Delegate and builder
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: mainAxisExtent,
        crossAxisCount: 2,
        crossAxisSpacing: 24.w,
        mainAxisSpacing: 32.h,
      ),
      itemBuilder: itemBuilder,
    );
  }
}

class _TabBar extends StatelessWidget {
  const _TabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 2,
      child: TabBar(
        // Theming
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: AppColors.primary,
        indicatorWeight: 2.h,
        labelPadding: EdgeInsets.symmetric(vertical: 16.h),

        // Tab Items
        tabs: [
          Text(
            'Recipes',
            style: TxtThemes.h3.copyWith(
              color: AppColors.primaryText.withAlpha(228),
            ),
          ),
          Text(
            'Liked',
            style: TxtThemes.h3.copyWith(
              color: AppColors.primaryText.withAlpha(228),
            ),
          ),
        ],
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // User image and name
        CircleAvatar(
          foregroundImage: const AssetImage(
            'assets/images/p1.jpg',
          ),
          radius: 50.r,
        ),
        SizedBox(height: 24.h),
        Text(
          'ChefIO',
          style: TxtThemes.h2.copyWith(
            color: AppColors.primaryText.withAlpha(228),
          ),
        ),
        SizedBox(
          height: 24.h,
        ),

        // Metrics
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            _MetricItem(
              count: '32',
              name: 'Recipes',
            ),
            _MetricItem(
              count: '782',
              name: 'Following',
            ),
            _MetricItem(
              count: '1,877',
              name: 'Followers',
            ),
          ],
        ),
      ],
    );
  }
}

class _MetricItem extends StatelessWidget {
  const _MetricItem({
    Key? key,
    required this.count,
    required this.name,
  }) : super(key: key);

  final String count;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          count,
          style: TxtThemes.h2.copyWith(
            color: AppColors.primaryText.withAlpha(228),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          name,
          style: TxtThemes.s.copyWith(color: AppColors.secondaryText),
        ),
      ],
    );
  }
}

class _BtnIcon extends StatelessWidget {
  const _BtnIcon({
    Key? key,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashFactory: InkRipple.splashFactory,
      borderRadius: BorderRadius.circular(56.r),
      child: SizedBox.square(
        dimension: 56.r,
        child: Icon(
          iconData,
          size: 24.sp,
          color: AppColors.primaryText,
        ),
      ),
    );
  }
}

class _ProfileOptionSheet extends StatelessWidget {
  const _ProfileOptionSheet({
    Key? key,
    this.canLogOut = false,
  }) : super(key: key);

  final bool canLogOut;

  void _confirmLogout(BuildContext context) {
    Navigator.pop(context);
    showCupertinoDialog(
      context: context,
      builder: (ctx) => const _LogoutDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(32.r),
      child: SizedBox(
        width: 1.sw,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 16.h,
            ),
            const Center(
              child: SheetHandle(),
            ),
            SizedBox(
              height: 24.h,
            ),

            // Sheet Buttons
            _SheetBtn(
              iconData: Icons.share_rounded,
              text: 'Share',
              onTap: () {},
            ),
            _SheetBtn(
              iconData: Icons.settings_rounded,
              text: 'Settings',
              onTap: () {},
            ),
            canLogOut
                ? _SheetBtn(
                    iconData: Icons.logout_rounded,
                    text: 'Logout',
                    onTap: () => _confirmLogout(context),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class _SheetBtn extends StatelessWidget {
  const _SheetBtn({
    Key? key,
    required this.iconData,
    required this.text,
    this.onTap,
  }) : super(key: key);

  final IconData iconData;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashFactory: InkRipple.splashFactory,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 18.sp,
              color: AppColors.primaryText,
            ),
            SizedBox(
              width: 12.w,
            ),
            Text(
              text,
              style: TxtThemes.h2.copyWith(
                color: AppColors.primaryText,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _LogoutDialog extends StatelessWidget {
  const _LogoutDialog({
    Key? key,
  }) : super(key: key);

  void _confirmLogout(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(builder: (ctx) => const OnboardingScr()),
      (route) => !Navigator.canPop(context),
    );
  }

  void _goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.r)),
      backgroundColor: AppColors.white,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 0.8.sw),
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title and subtitle
              Text(
                'Confirm Logout',
                style: TxtThemes.h1.copyWith(color: AppColors.primaryText),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Do you really want to logout?',
                style: TxtThemes.p1.copyWith(
                  color: AppColors.primaryText.withAlpha(228),
                ),
              ),
              SizedBox(
                height: 32.h,
              ),

              // Buttons
              BtnPrimary(
                txt: 'Yes',
                onTap: () => _confirmLogout(context),
              ),
              SizedBox(
                height: 16.h,
              ),
              BtnPrimary(
                txt: 'No',
                onTap: () => _goBack(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
