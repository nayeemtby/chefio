import 'package:chefio/screens/details.dart';
import 'package:chefio/screens/home.dart';
import 'package:chefio/screens/login.dart';
import 'package:chefio/screens/notifications.dart';
import 'package:chefio/screens/onboarding.dart';
import 'package:chefio/screens/profile.dart';
import 'package:chefio/screens/pskrecover.dart';
import 'package:chefio/screens/signup.dart';
import 'package:chefio/screens/upload.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () {
        return const MaterialApp(
          home: HomeScr(),
        );
      },
    );
  }
}
