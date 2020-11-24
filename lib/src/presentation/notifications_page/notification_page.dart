import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/constants/loading_and_error_widget.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/common/routes/router.gr.dart';
import 'package:bonyeza_kazi/src/application/notifications/notification_messages_cubit/notification_messages_cubit.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:loading_indicator/loading_indicator.dart' as load;
import 'package:bonyeza_kazi/src/presentation/widgets/search_page_widgets.dart';
import 'package:division/division.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool isNotificationDialogClosed = true;

  @override
  void initState() {
    getNotificationStatusSeen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextResponsive("Notifications", style: kAppBarTxtStyle1),
        centerTitle: true,
        backgroundColor: kBlueBackgroundColor,
        elevation: 3.h,
      ),
      body: Column(
        children: [
          SizedBoxResponsive(
            height: 20,
          ),
          isNotificationDialogClosed
              ? ContainerResponsive(
                  margin: EdgeInsetsResponsive.fromLTRB(20, 0, 20, 20),
                  padding: EdgeInsetsResponsive.all(20),
                  height: 235,
                  widthResponsive: false,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color(0xFF4973E9),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ContainerResponsive(
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextResponsive(
                                'Stay up to date!',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 27,
                                    fontWeight: FontWeight.w500),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    isNotificationDialogClosed =
                                        !isNotificationDialogClosed;
                                  });
                                  SharedPreferences sharedPreferences =
                                      await SharedPreferences.getInstance();
                                  sharedPreferences.setBool(
                                      NOTIFICATION_MSG_SEEN, false);
                                },
                                child: ContainerResponsive(
                                  height: 30,
                                  width: 40,
                                  child: Center(
                                    child:
                                        Icon(Icons.close, color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBoxResponsive(
                          height: 20,
                        ),
                        TextResponsive(
                          'Turn on notifications so that you dont miss any updates',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBoxResponsive(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            ExtendedNavigator.of(context)
                                .push(Routes.pushNotificationPage);
                          },
                          child: ContainerResponsive(
                            height: 60,
                            width: 300,
                            padding:
                                EdgeInsetsResponsive.symmetric(horizontal: 20),
                            child: Center(
                              child: TextResponsive(
                                'Enable Notifications',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                          ),
                        )
                      ]),
                )
              : Container(),
          ContainerResponsive(
            height: 60,
            alignment: Alignment.centerLeft,
            padding: EdgeInsetsResponsive.symmetric(horizontal: 20),
            color: Color(0xFFEBECEE),
            child: TextResponsive('LAST 7 DAYS',
                style: TextStyle(
                    color: Color(0xFFA0A1A3),
                    fontSize: 21,
                    fontWeight: FontWeight.w500)),
          ),
          BlocBuilder<NotificationMessagesCubit, NotificationsMessagesState>(
              builder: (context, state) {
            return state.map(
                initial: (_) => Container(),
                loading: (_) => Expanded(child: LoadingBallIndicator()),
                success: (state) {
                  return state.notificationMsgs.size == 0
                      ? NoNotificationsFound()
                      : Expanded(
                          child: ListView.builder(
                              padding: EdgeInsets.only(top: 20.h, bottom: 70.h),
                              itemCount: state.notificationMsgs.size,
                              itemBuilder: (context, index) {
                                final msg = state.notificationMsgs[index];
                                final DateTime timeStamp =
                                    DateTime.fromMillisecondsSinceEpoch(
                                        int.parse(msg.time));
                                final date = DateFormat("EEEE, d MMM y")
                                    .format(timeStamp);
                                return ContainerResponsive(
                                  padding: EdgeInsetsResponsive.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextResponsive(
                                        msg.message,
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 21,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBoxResponsive(height: 10),
                                      TextResponsive(
                                        date,
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 21,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBoxResponsive(height: 10),
                                      TextResponsive(
                                        msg.body,
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 21,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        );
                },
                failure: (state) {
                  return state.failure.map(serverError: (_) {
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<NotificationMessagesCubit>(context)
                            .getNotificationsMsgs();
                      },
                      child: Expanded(
                        child: Container(
                          child: Center(
                            child: ErrorIndicator(
                              message: SERVER_ERROR_MESSAGE,
                            ),
                          ),
                        ),
                      ),
                    );
                  }, noInternet: (_) {
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<NotificationMessagesCubit>(context)
                            .getNotificationsMsgs();
                      },
                      child: Expanded(
                        child: Container(
                          child: Center(
                            child: ErrorIndicator(
                              message: NO_INTERNET_MESSAGE,
                            ),
                          ),
                        ),
                      ),
                    );
                  });
                });
          })
        ],
      ),
    );
  }

  void getNotificationStatusSeen() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var isSeen = sharedPreferences.getBool(NOTIFICATION_MSG_SEEN) ?? true;
    setState(() {
      isNotificationDialogClosed = isSeen;
    });
  }
}

class NoNotificationsFound extends StatelessWidget {
  const NoNotificationsFound({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(LineAwesomeIcons.dropbox, size: 180.sp, color: Color(0xFFA8AEC0)),
        Txt(
          'No Notifications Yet!',
          style: TxtStyle()
            ..textAlign.center()
            ..fontFamily('Avenir')
            ..fontWeight(FontWeight.w800)
            ..fontSize(20.h)
            ..textColor(
              Color(0xFF7F869A),
            ),
        ),
      ],
    ));
  }
}
