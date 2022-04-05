import 'package:chefio/theme/colors.dart';
import 'package:chefio/theme/text_styles.dart';
import 'package:chefio/widgets/buttons.dart';
import 'package:chefio/widgets/dialogs.dart';
import 'package:chefio/widgets/input.dart';
import 'package:chefio/widgets/misc.dart';
import 'package:chefio/widgets/scaffolds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadScr extends StatefulWidget {
  const UploadScr({Key? key}) : super(key: key);

  @override
  State<UploadScr> createState() => _UploadScrState();
}

class _UploadScrState extends State<UploadScr> with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 2,
      vsync: this,
      animationDuration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _BottomBar(
        tabController: tabController,
      ),
      body: TopBarScaffold(
        topBarChildren: [
          const _BtnCancel(),
          Text(
            '1/2',
            style: TxtThemes.h2.copyWith(color: AppColors.primaryText),
          )
        ],
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: tabController,
          children: const [
            _Page1(),
            _Page2(),
          ],
        ),
      ),
    );
  }
}

class _BottomBar extends StatefulWidget {
  const _BottomBar({
    Key? key,
    required this.tabController,
  }) : super(key: key);
  final TabController tabController;

  @override
  State<_BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<_BottomBar> {
  bool secondPage = false;

  void _finish(BuildContext context) {
    if (secondPage) {
      showCupertinoDialog(
        context: context,
        builder: (ctx) => SuccessDialog(
          title: 'Upload Success',
          subtitle:
              'Your recipe has been uploaded, you can see it on your profile',
          buttonText: 'Back to Home',
          onTap: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
      );
    } else {
      widget.tabController.animateTo(1);
      setState(() {
        secondPage = true;
      });
    }
  }

  void _handleBack(BuildContext context) {
    if (secondPage) {
      widget.tabController.animateTo(0);
      setState(() {
        secondPage = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: TweenAnimationBuilder<double>(
          // Tween options
          duration: const Duration(milliseconds: 200),
          tween: Tween<double>(begin: 1, end: secondPage ? 1 : 0),

          // Prebuilt button
          child: BtnPrimary(
            txt: secondPage ? 'Finish' : 'Next',
            onTap: () => _finish(context),
          ),

          // Builder
          builder: (context, value, nextButton) {
            return LayoutBuilder(builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Back button
                    SizedBox(
                      width: ((constraints.maxWidth - 16.w) / 2) * value,
                      child: ClipRect(
                        child: BtnPrimary(
                          width: (constraints.maxWidth - 16.w) / 2,
                          txt: value > 0.4 ? 'Back' : 'B',
                          onTap: () => _handleBack(context),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16.w * value,
                    ),

                    // Next Button
                    Expanded(
                      child: nextButton ?? const SizedBox(),
                    ),
                  ],
                ),
              );
            });
          }),
    );
  }
}

class _BtnCancel extends StatelessWidget {
  const _BtnCancel({
    Key? key,
  }) : super(key: key);

  void _cancel(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _cancel(context),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(
          'Cancel',
          style: TxtThemes.h2.copyWith(color: AppColors.secondary),
        ),
      ),
    );
  }
}

class _Page2 extends StatelessWidget {
  const _Page2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ScrollController(),
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 46.h,
            ),

            // Ingredients section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Ingredients',
                style: TxtThemes.h2.copyWith(
                  color: AppColors.primaryText.withAlpha(228),
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            ReorderableListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              buildDefaultDragHandles: false,
              prototypeItem: const _IngredientItem(index: 0),
              shrinkWrap: true,
              onReorder: (oldIndex, newIndex) {},
              itemBuilder: (ctx, index) => _IngredientItem(
                index: index,
                key: UniqueKey(),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            BtnSecondary(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.add,
                    size: 24.sp,
                    color: AppColors.primaryText.withAlpha(228),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    'Ingredient',
                    style: TxtThemes.p2.copyWith(
                      color: AppColors.primaryText.withAlpha(228),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Transform.scale(
              scaleX: 1.5,
              child: Divider(
                height: 0,
                thickness: 8.h,
                color: AppColors.form,
              ),
            ),
            SizedBox(
              height: 24.h,
            ),

            // Steps section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Steps',
                style: TxtThemes.h2.copyWith(
                  color: AppColors.primaryText.withAlpha(228),
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            ReorderableListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              buildDefaultDragHandles: false,
              itemBuilder: (ctx, index) => _StepItem(
                index: index,
                key: UniqueKey(),
              ),
              itemCount: 3,
              onReorder: (oldIndex, newIndex) {},
            ),
            SizedBox(
              height: 20.h,
            ),
            BtnSecondary(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.add,
                    size: 24.sp,
                    color: AppColors.primaryText.withAlpha(228),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    'Step',
                    style: TxtThemes.p2.copyWith(
                      color: AppColors.primaryText.withAlpha(228),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _StepItem extends StatelessWidget {
  const _StepItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              StepIndex(index: (index + 1).toString()),
              SizedBox(
                height: 16.h,
              ),

              // Drag handle
              ReorderableDragStartListener(
                index: index,
                child: Icon(
                  Icons.drag_indicator_rounded,
                  size: 24.sp,
                  color: AppColors.secondaryText,
                ),
              )
            ],
          ),
          SizedBox(
            width: 8.w,
          ),

          // Input
          const Expanded(
            child: TxtField(
              hint: 'Describe the process in steps',
              singleLine: false,
              inputType: TextInputType.text,
            ),
          )
        ],
      ),
    );
  }
}

class _IngredientItem extends StatelessWidget {
  const _IngredientItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
      ),
      child: Row(
        children: [
          // Drag handle
          ReorderableDragStartListener(
            index: index,
            child: Icon(
              Icons.drag_indicator_rounded,
              size: 24.sp,
              color: AppColors.secondaryText,
            ),
          ),
          SizedBox(
            width: 12.w,
          ),

          // Input
          Expanded(
            child: TxtField(
              hint: 'Enter Ingredient $index',
              inputType: TextInputType.text,
            ),
          )
        ],
      ),
    );
  }
}

class _Page1 extends StatelessWidget {
  const _Page1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 32.h,
            ),

            // Cover photo
            const _AddCoverPhoto(),
            SizedBox(
              height: 24.h,
            ),

            // Recipe name
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recipe Name',
                style: TxtThemes.h2
                    .copyWith(color: AppColors.primaryText.withAlpha(228)),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const TxtField(
              hint: 'Enter recipe name',
              inputType: TextInputType.text,
            ),
            SizedBox(
              height: 24.h,
            ),

            // Recipe description
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Description',
                style: TxtThemes.h2
                    .copyWith(color: AppColors.primaryText.withAlpha(228)),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const TxtField(
              hint: 'Let others know how tasty this recipe is',
              singleLine: false,
              inputType: TextInputType.multiline,
            ),
            SizedBox(
              height: 24.h,
            ),

            // Duration slider
            Row(
              children: [
                Text(
                  'Cooking Duration ',
                  style: TxtThemes.h2
                      .copyWith(color: AppColors.primaryText.withAlpha(228)),
                ),
                Text(
                  '(in minutes)',
                  style: TxtThemes.p2.copyWith(color: AppColors.secondaryText),
                )
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            const _DurationSlider(),
          ],
        ),
      ),
    );
  }
}

class _DurationSlider extends StatelessWidget {
  const _DurationSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Slider Values
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '<10',
              style: TxtThemes.h3.copyWith(color: AppColors.primary),
            ),
            Text(
              '30',
              style: TxtThemes.h3.copyWith(color: AppColors.primary),
            ),
            Text(
              '60<',
              style: TxtThemes.h3.copyWith(color: AppColors.primary),
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),

        // Slider
        SliderTheme(
          data: SliderThemeData(
            overlayShape: SliderComponentShape.noOverlay,
          ),
          child: Slider(
            label: '20',
            min: 10,
            max: 60,
            activeColor: AppColors.primary,
            divisions: 50,
            inactiveColor: AppColors.form,
            value: 20,
            onChanged: (numnum) {},
          ),
        ),
      ],
    );
  }
}

class _AddCoverPhoto extends StatelessWidget {
  const _AddCoverPhoto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.form, width: 2.sp),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: SizedBox(
          height: 160.r,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.image,
                size: 56.r,
                color: AppColors.secondaryText,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Add cover photo',
                style: TxtThemes.h3.copyWith(color: AppColors.primaryText),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                '(Up to 12 MB)',
                style: TxtThemes.s.copyWith(color: AppColors.secondaryText),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class _SliderShape extends RoundedRectSliderTrackShape {
//   Rect getPreferredRect({
//     required RenderBox parentBox,
//     Offset offset = Offset.zero,
//     required SliderThemeData sliderTheme,
//     bool isEnabled = false,
//     bool isDiscrete = false,
//   }) {
//     final double trackHeight = sliderTheme.trackHeight ?? 10;
//     final double trackLeft = offset.dx;
//     final double trackTop =
//         offset.dy + (parentBox.size.height - trackHeight) / 2;
//     final double trackWidth = parentBox.size.width;
//     return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
//   }
// }