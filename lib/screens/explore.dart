import 'dart:math';
import 'package:chefio/theme/colors.dart';
import 'package:chefio/theme/text_styles.dart';
import 'package:chefio/widgets/buttons.dart';
import 'package:chefio/widgets/input.dart';
import 'package:chefio/widgets/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final TextEditingController searchTextController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  bool _searchFocused = false;
  bool _searchEntered = false;

  @override
  void initState() {
    super.initState();
    searchTextController.addListener(_handleSearch);
    searchFocusNode.addListener(_handleSearch);
  }

  void _handleSearch() {
    searchTextController.text.isEmpty
        ? _searchEntered = false
        : _searchEntered = true;
    _searchFocused = searchFocusNode.hasPrimaryFocus;
    setState(() {});
  }

  void _closeSearch() {
    searchFocusNode.unfocus();
    searchTextController.clear();
    // _searchFocused = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 28.h,
          ),

          // Search
          TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 250),
            tween: Tween<double>(
              begin: 0,
              end: _searchEntered
                  ? 2
                  : _searchFocused
                      ? 1
                      : 0,
            ),
            child: SearchBar(
              controller: searchTextController,
              focusNode: searchFocusNode,
            ),
            builder: (ctx, value, child) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w - (16.w * min(value, 1)),
                ),
                child: Row(
                  children: [
                    _VariableWidthIconButton(
                      onTap: _closeSearch,
                      widthFactor: min(value, 1),
                      iconData: Icons.arrow_back_ios_new_rounded,
                    ),
                    Expanded(
                      child: child!,
                    ),
                    _VariableWidthIconButton(
                      onTap: () {},
                      widthFactor: max(0, value - 1),
                      iconData: const IconData(0xf1de, fontFamily: 'fas'),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(
            height: 16.h,
          ),
          Expanded(
            child: IndexedStack(
              index: (_searchFocused || _searchEntered) ? 1 : 0,
              children: [
                const _FeedSection(),
                _SearchSection(
                  searchEntered: _searchEntered,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VariableWidthIconButton extends StatelessWidget {
  const _VariableWidthIconButton({
    Key? key,
    required this.onTap,
    required this.widthFactor,
    required this.iconData,
  }) : super(key: key);

  final VoidCallback onTap;
  final double widthFactor;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(36.r),
      child: SizedBox(
        height: 36.r,
        width: 36.r * widthFactor,
        child: ClipRect(
          child: Center(
            child: Icon(
              iconData,
              size: 24.sp,
              color: AppColors.primaryText,
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchSection extends StatelessWidget {
  const _SearchSection({
    Key? key,
    required this.searchEntered,
  }) : super(key: key);

  final bool searchEntered;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: ScrollController(),
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverPersistentHeader(delegate: _SeparatorDelegate()),
        SliverVisibility(
          visible: searchEntered,
          sliver: SliverPadding(
            padding: EdgeInsets.only(top: 8.h, left: 24.w, right: 24.w),
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
          replacementSliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const _SearchHistoryItem(),
              childCount: 3,
            ),
          ),
        ),
      ],
    );
  }
}

class _SearchHistoryItem extends StatelessWidget {
  const _SearchHistoryItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.symmetric(horizontal: 24.w),
      leading: Icon(
        Icons.history_rounded,
        size: 24.sp,
        color: AppColors.secondaryText,
      ),
      title: Text(
        'Pan Cake',
        style: TxtThemes.p1.copyWith(
          color: AppColors.primaryText.withAlpha(194),
        ),
      ),
      trailing: Transform.rotate(
        angle: pi / 4,
        child: Icon(
          Icons.arrow_back_rounded,
          size: 24.sp,
          color: AppColors.secondaryText,
        ),
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
