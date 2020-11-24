import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/routes/router.gr.dart';
import 'package:bonyeza_kazi/src/application/auth_cubit/auth_cubit.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/profile_page_widgets.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPHomePage extends StatefulWidget {
  const SPHomePage({Key key, @required this.username}) : super(key: key);
  final String username;

  @override
  _SPHomePageState createState() => _SPHomePageState();
}

class _SPHomePageState extends State<SPHomePage> {
  @override
  void initState() {
    determinePageSeen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          UserProfilePicAndDetails(
              username: widget.username, padding: 60, containerHeight: 180),
          SPBalanceAndActionButtions(),
          SizedBoxResponsive(
            height: 10,
          ),
          JobStatusButtons(),
          BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
            return state.maybeMap(
                authenticated: (state) {
                  return JobStatusInformationList(userTypeID: state.userTypeId);
                },
                orElse: () => Container());
          }),
        ],
      ),
    );
  }

  Future<void> determinePageSeen() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var isSeen = sharedPreferences.getBool(SP_SEES_HOME_PAGE) ?? false;
    var isBioSet = sharedPreferences.getString(USER_BIO) ?? null;

    if (!isSeen && isBioSet == null)
      Flushbar(
        title: 'Incomplete Profile',
        message: 'Kindly update your profile to increase your visibility',
        margin: EdgeInsets.all(20.h),
        flushbarPosition: FlushbarPosition.TOP,
        duration: Duration(seconds: 10),
        isDismissible: true,
        backgroundColor: Colors.green,
        borderRadius: 15.h,
        mainButton: FlatButton(
          color: Color(0xFFFD9726),
          onPressed: () {
            ExtendedNavigator.of(context).push(Routes.sPUpdateProfilePage);
          },
          child: TextResponsive(
            "CLICK TO\nUPDATE",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ).show(context);
    sharedPreferences.setBool(SP_SEES_HOME_PAGE, true);
  }
}
