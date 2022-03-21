import 'package:chefio/theme/colors.dart';
import 'package:chefio/theme/text_styles.dart';
import 'package:chefio/widgets/buttons.dart';
import 'package:chefio/widgets/dialogs.dart';
import 'package:chefio/widgets/input.dart';
import 'package:chefio/widgets/scaffolds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadScr extends StatelessWidget {
  const UploadScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const _BottomBar(),
      body: TopBarScaffold(
        topBarChildren: [
          Text(
            'Cancel',
            style: TxtThemes.h2.copyWith(color: AppColors.secondary),
          ),
          Text(
            '1/2',
            style: TxtThemes.h2.copyWith(color: AppColors.primaryText),
          )
        ],
        body: const _Page2(),
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
            const _BtnAdd(
              txt: 'Ingredient',
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
            const _BtnAdd(
              txt: 'Step',
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
              Material(
                color: AppColors.primaryText.withAlpha(228),
                borderRadius: BorderRadius.circular(24.r),
                child: SizedBox.square(
                  dimension: 24.r,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      (index + 1).toString(),
                      style: TxtThemes.s.copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
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

class _BtnAdd extends StatelessWidget {
  const _BtnAdd({
    Key? key,
    required this.txt,
  }) : super(key: key);
  final String txt;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.r),
              side: BorderSide(
                width: 1.sp,
                color: AppColors.form,
              ),
            ),
          ),
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
                txt,
                style: TxtThemes.p2.copyWith(
                  color: AppColors.primaryText.withAlpha(228),
                ),
              )
            ],
          )),
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
            DecoratedBox(
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
                        style:
                            TxtThemes.h3.copyWith(color: AppColors.primaryText),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        '(Up to 12 MB)',
                        style: TxtThemes.s
                            .copyWith(color: AppColors.secondaryText),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
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

class _BottomBar extends StatelessWidget {
  const _BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: BtnPrimary(
        txt: 'Next',
        onTap: () {
          showCupertinoDialog(
            context: context,
            builder: (ctx) => SuccessDialog(
              title: 'Upload Success',
              subtitle:
                  'Your recipe has been uploaded, you can see it on your profile',
              buttonText: 'Back to Home',
              onTap: () => Navigator.pop(context),
            ),
          );
        },
      ),
    );
  }
}
