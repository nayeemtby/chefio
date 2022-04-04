import 'package:chefio/screens/explore.dart';
import 'package:chefio/screens/notifications.dart';
import 'package:chefio/screens/profile.dart';
import 'package:chefio/screens/upload.dart';
import 'package:chefio/theme/colors.dart';
import 'package:chefio/theme/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScr extends StatefulWidget {
  const HomeScr({Key? key}) : super(key: key);

  @override
  State<HomeScr> createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _NavBar(
        pageController: pageController,
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          ExplorePage(),
          SizedBox(),
          NotificationPage(),
          ProfileScr(),
        ],
      ),
    );
  }
}

class _NavBar extends StatefulWidget {
  const _NavBar({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  State<_NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<_NavBar> {
  int selectedIndex = 0;

  void _handleNavigation(int _index) {
    if (_index == 1) {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (ctx) => const UploadScr(),
        ),
      );
    } else {
      widget.pageController.jumpToPage(_index);
      setState(() {
        selectedIndex = _index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // Funtional
      currentIndex: selectedIndex,
      onTap: _handleNavigation,

      // Theming
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      selectedItemColor: AppColors.primary,
      selectedLabelStyle: TxtThemes.s,
      unselectedItemColor: AppColors.secondaryText,
      unselectedLabelStyle: TxtThemes.s,

      // Items
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: _NavbarItemIcon(
            iconData: IconData(0xf015, fontFamily: 'fas'),
          ),
        ),
        BottomNavigationBarItem(
          label: 'New Recipe',
          icon: _NavbarItemIcon(
            iconData: IconData(0xf52d, fontFamily: 'fas'),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Notification',
          icon: _NavbarItemIcon(
            iconData: IconData(0xf0f3, fontFamily: 'fas'),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: _NavbarItemIcon(
            iconData: IconData(0xf007, fontFamily: 'fas'),
          ),
        ),
      ],
    );
  }
}

class _NavbarItemIcon extends StatelessWidget {
  const _NavbarItemIcon({
    Key? key,
    required this.iconData,
  }) : super(key: key);

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Icon(
        iconData,
        size: 24.sp,
      ),
    );
  }
}
