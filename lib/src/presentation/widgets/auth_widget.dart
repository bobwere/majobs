import 'package:bonyeza_kazi/src/application/auth_cubit/auth_cubit.dart';
import 'package:bonyeza_kazi/src/application/notifications/notification_messages_cubit/notification_messages_cubit.dart';
import 'package:bonyeza_kazi/src/application/notifications/notifications_cubit/notification_cubit.dart';
import 'package:bonyeza_kazi/src/application/sp_job_cubit/sp_job_cubit.dart';
import 'package:bonyeza_kazi/src/presentation/login_page/login_page.dart';
import 'package:bonyeza_kazi/src/presentation/onboarding_page/onboarding_direct_page.dart';
import 'package:bonyeza_kazi/src/presentation/onboarding_page/onboarding_page.dart';
import 'package:bonyeza_kazi/src/presentation/registration_page/new_client_registration.dart';

import 'package:bonyeza_kazi/src/presentation/registration_page/new_sp_registration.dart';
import 'package:bonyeza_kazi/src/presentation/registration_page/sp_select_category_page.dart';
import 'package:bonyeza_kazi/src/presentation/splash_page/splash_page.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/home_widget/client_home_widget.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/home_widget/client_unauthenticated_home_widget.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/home_widget/sp_home_widget.dart';
import 'package:bonyeza_kazi/src/services/push_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PushNotificationService pushNotificationService =
        Provider.of<PushNotificationService>(context);
    SPJobCubit sPJobCubit = BlocProvider.of<SPJobCubit>(context);
    NotificationMessagesCubit notificationMessagesCubit =
        BlocProvider.of<NotificationMessagesCubit>(context);
    NotificationsCubit notificationsCubit =
        BlocProvider.of<NotificationsCubit>(context);

    ResponsiveWidgets.init(
      context,
      height: 854,
      width: 480,
      allowFontScaling: false,
    );

    return ResponsiveWidgets.builder(
      height: 854,
      width: 480,
      allowFontScaling: false,
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return state.map(uninitialized: (_) {
            return SplashPage();
          }, authenticated: (state) {
            notificationMessagesCubit.getNotificationsMsgs();
            notificationsCubit.getNotificationsStatus();
            pushNotificationService.onTokenRefresh();
            sPJobCubit.getJobStatus();
            if (state.userTypeId == '4') {
              return SPHomeWidget(username: state.username);
            } else {
              return ClientHomeWidget(
                serviceProvider: state.serviceProvider,
              );
            }
          }, unauthenticated: (_) {
            return OnboardingPage();
          }, unauthenticatedButLoginedIn: (_) {
            return ClientUnauthenticatedHomeWidget();
          }, login: (_) {
            return LoginPage();
          }, onboarding: (_) {
            return OnboardingPage();
          }, searchingFor: (_) {
            return OnboardingDirectPage();
          }, unregisteredClient: (_) {
            return NewClientRegistrationPage();
          }, unregisteredSp: (_) {
            return NewSPRegistrationPage();
          }, spSelectsCategory: (_) {
            return SPSelectCategoryPage();
          });
        },
      ),
    );
  }
}
