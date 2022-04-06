import 'package:chefio/theme/colors.dart';
import 'package:chefio/theme/text_styles.dart';
import 'package:chefio/widgets/buttons.dart';
import 'package:chefio/widgets/input.dart';
import 'package:chefio/widgets/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// TODO: Add search page
class ExplorePage extends StatelessWidget {
  const ExplorePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 28.h,
          ),
          // Search
          const SearchBar(),
          SizedBox(
            height: 16.h,
          ),
          Expanded(
            child: IndexedStack(
              index: 0,
              children: const [
                _FeedSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FeedSection extends StatelessWidget {
  const _FeedSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // Categories
        const SliverPersistentHeader(
          delegate: _CategoryBarDelegate(),
          floating: true,
        ),

        // Separator
        const SliverPersistentHeader(
          delegate: _SeparatorDelegate(),
          pinned: true,
        ),

        // Grid
        SliverPadding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 8.h),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (ctx, index) => const RecipeItem(
                authorImageUri: 'authorImageUri',
                authorName: 'Toki',
                imageUri: 'imageUri',
                itemName: 'Dumplings',
                categoryName: 'Bento',
                requiredTime: '60 mins',
              ),
              childCount: 13,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 264.h,
              crossAxisCount: 2,
              crossAxisSpacing: 24.w,
              mainAxisSpacing: 32.h,
            ),
          ),
        ),
      ],
    );
  }
}

class _CategoryBarDelegate extends SliverPersistentHeaderDelegate {
  const _CategoryBarDelegate();
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: LayoutBuilder(builder: (context, constraints) {
        return ColoredBox(
          color: AppColors.white,
          child: SizedBox(
            height: constraints.maxHeight,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Category',
                    style: TxtThemes.h2.copyWith(
                      color: AppColors.primaryText.withAlpha(194),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Row(
                  children: [
                    const CatRadio(text: 'All', groupValue: 'All'),
                    SizedBox(
                      width: 16.w,
                    ),
                    const CatRadio(text: 'Food', groupValue: 'All'),
                    SizedBox(
                      width: 16.w,
                    ),
                    const CatRadio(text: 'Drink', groupValue: 'All'),
                  ],
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
          ),
        );
      }),
    );
  }

  @override
  double get maxExtent => 17.sp + 24.h + 48.h;

  @override
  double get minExtent => 17.sp + 24.h + 48.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class _SeparatorDelegate extends SliverPersistentHeaderDelegate {
  const _SeparatorDelegate();
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Divider(
      height: 4.h,
      thickness: 4.h,
      color: AppColors.form,
    );
  }

  @override
  double get maxExtent => 4.h;

  @override
  double get minExtent => 4.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
