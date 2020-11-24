import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/common/routes/router.gr.dart';
import 'package:bonyeza_kazi/src/application/auth_cubit/auth_cubit.dart';
import 'package:bonyeza_kazi/src/presentation/favourites_page/my_favourites_page.dart';
import 'package:bonyeza_kazi/src/presentation/home_page/client_home_page.dart';
import 'package:bonyeza_kazi/src/presentation/messages_page/messages_page.dart';
import 'package:bonyeza_kazi/src/presentation/notifications_page/notification_page.dart';
import 'package:bonyeza_kazi/src/presentation/profile_page/profile_page.dart';
import 'package:bonyeza_kazi/src/presentation/search_page/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bonyeza_kazi/src/infrastructure/categories/models/service_provider_search_model.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClientHomeWidget extends StatefulWidget {
  final BuildContext menuScreenContext;
  final ServiceProvider serviceProvider;
  const ClientHomeWidget(
      {Key key, @required this.serviceProvider, this.menuScreenContext})
      : super(key: key);

  @override
  _ClientHomeWidgetState createState() => _ClientHomeWidgetState();
}

class _ClientHomeWidgetState extends State<ClientHomeWidget> {
  PersistentTabController _controller;
  bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    if (widget.serviceProvider != null)
      ExtendedNavigator.of(context).push(Routes.serviceProviderDetailPage,
          arguments: ServiceProviderDetailPageArguments(
              serviceProvider: widget.serviceProvider));

    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens(BuildContext context) {
    return [
      ClientHomePage(),
      MessagesPage(),
      SearchPage(),
      NotificationPage(),
      MyFavouritesPage(),
      ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      navBarHeight: 70.h,
      iconSize: 40.h,
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
        icon: Icon(CupertinoIcons.search),
        title: ("Search"),
        activeColor: kBlueBackgroundColor,
        inactiveColor: CupertinoColors.systemGrey),
    PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.bell),
        title: ("Notification"),
        activeColor: kBlueBackgroundColor,
        inactiveColor: CupertinoColors.systemGrey),
    PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.heart),
        title: ("Favourites"),
        activeColor: kBlueBackgroundColor,
        inactiveColor: CupertinoColors.systemGrey),
    PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.profile_circled),
        title: ("Profile"),
        activeColor: kBlueBackgroundColor,
        inactiveColor: CupertinoColors.systemGrey),
  ];
}
