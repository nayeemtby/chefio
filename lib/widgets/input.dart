import 'package:chefio/theme/colors.dart';
import 'package:chefio/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TxtField extends StatelessWidget {
  const TxtField({
    Key? key,
    this.controller,
    this.inputType,
    this.obscure = false,
    this.prefix,
    this.suffix,
    this.hint,
    this.singleLine = true,
  }) : super(key: key);

  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool obscure;
  final Widget? prefix;
  final Widget? suffix;
  final String? hint;
  final bool singleLine;

  @override
  Widget build(BuildContext context) {
    return TextField(
      // General Options
      obscureText: obscure,
      maxLines: singleLine ? 1 : null,
      cursorColor: AppColors.primary,
      keyboardType: inputType,
      minLines: singleLine ? null : 3,
      style: singleLine
          ? TxtThemes.p2.copyWith(color: AppColors.primaryText)
          : TxtThemes.s.copyWith(color: AppColors.primaryText),

      // Decoration
      decoration: InputDecoration(
        // Misc
        hintText: hint,
        hintMaxLines: 2,
        hintStyle: TxtThemes.p2.copyWith(color: AppColors.secondaryText),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 20.h),

        // Borders
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.r),
          borderSide: BorderSide(width: 1.sp, color: AppColors.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.r),
          borderSide: BorderSide(width: 2.sp, color: AppColors.primary),
        ),

        // Suffix and Prefix
        prefixIconConstraints: const BoxConstraints(minWidth: 0),
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 24.r,
            ),
            prefix ?? const SizedBox(),
            SizedBox(
              width: prefix == null ? null : 10.r,
            )
          ],
        ),
        suffixIconConstraints: const BoxConstraints(minWidth: 0),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: prefix == null ? null : 10.r,
            ),
            suffix ?? const SizedBox(),
            SizedBox(
              width: 24.r,
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      // General Options
      maxLines: 1,
      cursorColor: AppColors.primary,
      keyboardType: TextInputType.text,
      style: TxtThemes.p2.copyWith(color: AppColors.primaryText),

      // Decoration
      decoration: InputDecoration(
        // Misc
        hintText: 'Search',
        hintStyle: TxtThemes.p2.copyWith(color: AppColors.secondaryText),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 20.h),
        filled: true,
        fillColor: AppColors.form,

        // Borders
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.r),
            borderSide: BorderSide.none),

        // Prefix
        prefixIconConstraints: const BoxConstraints(minWidth: 0),
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 24.r,
            ),
            Icon(
              const IconData(0xf002, fontFamily: 'fas'),
              size: 18.sp,
              color: AppColors.secondaryText,
            ),
            SizedBox(
              width: 10.r,
            )
          ],
        ),
      ),
    );
  }
}
