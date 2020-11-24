import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/common/routes/router.gr.dart';
import 'package:bonyeza_kazi/src/application/auth_cubit/auth_cubit.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/profile_page_widgets.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

class ClientProfile extends StatefulWidget {
  const ClientProfile({Key key, this.username}) : super(key: key);
  final String username;

  @override
  _ClientProfileState createState() => _ClientProfileState();
}

class _ClientProfileState extends State<ClientProfile> {
  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBlueBackgroundColor,
        centerTitle: true,
        title: TextResponsive(
          'My Profile',
          style: kAppBarTxtStyle1,
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (choice) {
              choiceAction(choice, authCubit, context);
            },
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice,
                      style: TextStyle(
                          fontSize: 21.h, fontWeight: FontWeight.w400)),
                );
              }).toList();
            },
          )
        ],
      ),
      body: Column(
        children: [
          UserProfilePicAndDetails(
              username: widget.username, padding: 0, containerHeight: 120),
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

  Future<PermissionStatus> _getPermission() async {
    final PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.denied) {
      final Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.contacts].request();
      return permissionStatus[Permission.contacts] ??
          PermissionStatus.undetermined;
    } else {
      return permission;
    }
  }

  void choiceAction(String choice, AuthCubit authCubit, BuildContext context) {
    if (choice == Constants.UpdateProfile) {
      ExtendedNavigator.of(context).push(Routes.updateProfilePage);
    } else if (choice == Constants.SignOut) {
      authCubit.logOut();
    } else if (choice == Constants.InviteFriends) {
      _getPermission().then((permissionStatus) {
        if (permissionStatus == PermissionStatus.granted) {
          ExtendedNavigator.of(context).push(Routes.contactsPage);
        } else {
          Flushbar(
            title: 'Permissions error',
            message:
                'Please enable contacts access permission in system settings',
            margin: EdgeInsets.all(20.h),
            flushbarPosition: FlushbarPosition.TOP,
            duration: Duration(seconds: 3),
            isDismissible: true,
            backgroundColor: Color(0xFFFD9726),
            borderRadius: 15.h,
          ).show(context);
        }
      });
    }
  }
}
