import 'package:bonyeza_kazi/common/constants/loading_and_error_widget.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/notifications/notifications_cubit/notification_cubit.dart';
import 'package:bonyeza_kazi/src/application/notifications/toggle_notifications_cubit/toggle_notifications_cubit.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart' as load;

class PushNotificationPage extends StatelessWidget {
  const PushNotificationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ToggleNotificationStatusCubit,
        ToggleNotificationStatusState>(
      listener: (context, state) {
        state.sendingFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold((failure) {
                  failure.map(
                    serverError: (_) {
                      Flushbar(
                        title: 'An Error Occurred',
                        message: SERVER_ERROR_MESSAGE,
                        margin: EdgeInsets.all(20.h),
                        flushbarPosition: FlushbarPosition.TOP,
                        duration: Duration(seconds: 3),
                        isDismissible: true,
                        backgroundColor: Color(0xFFFD9726),
                        borderRadius: 15.h,
                      ).show(context);
                    },
                    noInternet: (_) {
                      Flushbar(
                        title: 'An Error Occurred',
                        message: NO_INTERNET_MESSAGE,
                        margin: EdgeInsets.all(20.h),
                        flushbarPosition: FlushbarPosition.TOP,
                        duration: Duration(seconds: 3),
                        isDismissible: true,
                        backgroundColor: Color(0xFFFD9726),
                        borderRadius: 15.h,
                      ).show(context);
                    },
                  );
                }, (_) {}));
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 3.h,
          backgroundColor: kBlueBackgroundColor,
          centerTitle: true,
          title: TextResponsive(
            'Push Notifications',
            style: kAppBarTxtStyle1,
          ),
        ),
        body: FutureBuilder<String>(
            future: getUserTypeID(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data == '5'
                    ? ClientPushNotificationPage()
                    : SPPushNotificationPage();
              } else {
                return Container();
              }
            }),
      ),
    );
  }

  Future<String> getUserTypeID() async {
    final pref = await SharedPreferences.getInstance();
    String userTypeID = pref.getString(USER_TYPE_ID);
    return userTypeID;
  }
}

class ClientPushNotificationPage extends StatelessWidget {
  const ClientPushNotificationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ToggleNotificationStatusCubit toggleNotificationStatusCubit =
        BlocProvider.of<ToggleNotificationStatusCubit>(context);
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        return state.map(
            initial: (_) => Container(),
            loading: (_) => Center(
                  child: Container(
                    height: 50.h,
                    width: 50.h,
                    child: load.LoadingIndicator(
                        indicatorType: load.Indicator.ballTrianglePath,
                        color: kBlueBackgroundColor),
                  ),
                ),
            success: (state) {
              final notification = state.notification;
              return Column(
                children: [
                  NotificationTile(
                      title: 'Inbox Messages',
                      status: notification.inboxmessages,
                      onTap: (status) {
                        toggleNotificationStatusCubit
                            .inboxmessageChanged(!status);
                        print('called');
                      }),
                  Divider(),
                  NotificationTile(
                      title: 'My Job Updates Messages',
                      status: notification.jobupdatemessages,
                      onTap: (status) {
                        toggleNotificationStatusCubit
                            .jobupdatemessageChanged(!status);
                      }),
                  Divider(),
                ],
              );
            },
            failure: (_) => Container());
      },
    );
  }
}

class SPPushNotificationPage extends StatelessWidget {
  const SPPushNotificationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ToggleNotificationStatusCubit toggleNotificationStatusCubit =
        BlocProvider.of<ToggleNotificationStatusCubit>(context);
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        return state.map(
            initial: (_) => Container(),
            loading: (_) => LoadingBallIndicator(),
            success: (state) {
              final notification = state.notification;
              return Column(
                children: [
                  NotificationTile(
                      title: 'Inbox Messages',
                      status: notification.inboxmessages,
                      onTap: (status) {
                        toggleNotificationStatusCubit
                            .inboxmessageChanged(!status);
                      }),
                  Divider(),
                  NotificationTile(
                      title: 'My Job Updates Messages',
                      status: notification.jobupdatemessages,
                      onTap: (status) {
                        toggleNotificationStatusCubit
                            .jobupdatemessageChanged(!status);
                      }),
                  Divider(),
                ],
              );
            },
            failure: (_) => Container());
      },
    );
  }
}

class NotificationTile extends StatelessWidget {
  const NotificationTile(
      {Key key,
      @required this.title,
      @required this.status,
      @required this.onTap})
      : super(key: key);
  final String title;
  final bool status;
  final void Function(bool value) onTap;

  @override
  Widget build(BuildContext context) {
    var isSwitched = status;
    return ListTile(
      leading: TextResponsive(
        title,
        style: TextStyle(
            fontSize: 21, color: Colors.black87, fontWeight: FontWeight.w400),
      ),
      trailing: Switch(
        value: isSwitched,
        onChanged: (value) => onTap(!value),
        activeTrackColor: kGreenBackgroundColor.withOpacity(0.5),
        activeColor: kGreenBackgroundColor,
      ),
    );
  }
}

class Divider extends StatelessWidget {
  const Divider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerResponsive(
      margin: EdgeInsetsResponsive.symmetric(horizontal: 20),
      height: 1.2,
      color: Color(0xFFC6C6C6),
    );
  }
}
