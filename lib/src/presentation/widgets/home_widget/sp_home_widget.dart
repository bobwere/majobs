import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/presentation/home_page/sp_home_page.dart';
import 'package:bonyeza_kazi/src/presentation/messages_page/messages_page.dart';
import 'package:bonyeza_kazi/src/presentation/notifications_page/notification_page.dart';
import 'package:bonyeza_kazi/src/presentation/profile_page/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SPHomeWidget extends StatefulWidget {
  final BuildContext menuScreenContext;
  final String username;
  const SPHomeWidget({Key key, this.menuScreenContext, @required this.username})
      : super(key: key);

  @override
  _SPHomeWidgetState createState() => _SPHomeWidgetState();
}

class _SPHomeWidgetState extends State<SPHomeWidget> {
  PersistentTabController _controller;
  bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens(BuildContext context) {
    return [
      SPHomePage(username: widget.username),
      MessagesPage(),
      NotificationPage(),
      ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      navBarHeight: 70.h,
      iconSize: 40.sp,
      controller: _controller,
      screens: _buildScreens(context),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: false,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      bottomScreenMargin: 0.0,
      hideNavigationBar: _hideNavBar,
      decoration: NavBarDecoration(colorBehindNavBar: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(-1.0, 0.0),
          blurRadius: 2,
        )
      ]),
      popAllScreensOnTapOfSelectedTab: true,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style12, // Choose the nav bar style with this property
    );
  }
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColor: kBlueBackgroundColor,
        inactiveColor: CupertinoColors.systemGrey),
    PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.mail),
        title: ("Messages"),
        activeColor: kBlueBackgroundColor,
        inactiveColor: CupertinoColors.systemGrey),
    PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.bell),
        title: ("Notification"),
        activeColor: kBlueBackgroundColor,
        inactiveColor: CupertinoColors.systemGrey),
    PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.profile_circled),
        title: ("Profile"),
        activeColor: kBlueBackgroundColor,
        inactiveColor: CupertinoColors.systemGrey),
  ];
}
