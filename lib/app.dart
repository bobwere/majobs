import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/theme.dart';
import 'package:bonyeza_kazi/common/routes/router.gr.dart' as router;
import 'package:bonyeza_kazi/injection_container.dart';
import 'package:bonyeza_kazi/src/application/job_journey/client_rates_job_done_cubit/client_rates_job_done_cubit.dart';
import 'package:bonyeza_kazi/src/application/job_journey/clients_pays_worker_cubit/client_pays_worker_cubit.dart';
import 'package:bonyeza_kazi/src/application/job_journey/client_approves_work_cubit/client_approves_work_cubit.dart';
import 'package:bonyeza_kazi/src/application/job_journey/job_journey_cubit/job_journey_cubit.dart';
import 'package:bonyeza_kazi/src/application/job_journey/sp_sets_price_cubit/sp_sets_price_cubit.dart';
import 'package:bonyeza_kazi/src/application/job_journey/work_completed_cubit/work_completed_cubit.dart';
import 'package:bonyeza_kazi/src/application/notifications/notification_messages_cubit/notification_messages_cubit.dart';
import 'package:bonyeza_kazi/src/application/notifications/notifications_cubit/notification_cubit.dart';
import 'package:bonyeza_kazi/src/application/notifications/toggle_notifications_cubit/toggle_notifications_cubit.dart';
import 'package:bonyeza_kazi/src/application/sp_job_cubit/sp_job_cubit.dart';
import 'package:bonyeza_kazi/src/application/sp_job_cubit/sp_withdraws_money.dart/sp_withdraws_money_cubit.dart';
import 'package:bonyeza_kazi/src/application/update_user_profile_cubit/update_user_profile_cubit.dart';
import 'package:bonyeza_kazi/src/application/job_journey/sp_request_time_extension_cubit/sp_request_time_extension_cubit.dart';
import 'package:bonyeza_kazi/src/services/get_client_sp_chatroom.dart';
import 'package:bonyeza_kazi/src/services/push_notification_service.dart';
import 'package:provider/provider.dart';
import 'package:bonyeza_kazi/src/application/auth_cubit/auth_cubit.dart';
import 'package:bonyeza_kazi/src/application/categories_cubit/categories_cubit.dart';
import 'package:bonyeza_kazi/src/application/chat/chats_list_cubit/chats_list_cubit.dart';
import 'package:bonyeza_kazi/src/application/chat/create_message_cubit/create_message_cubit.dart';
import 'package:bonyeza_kazi/src/application/chat/instant_messaging_cubit/instant_messaging_cubit.dart';
import 'package:bonyeza_kazi/src/application/job_journey/client_job_description_cubit/job_description_cubit.dart';
import 'package:bonyeza_kazi/src/application/favourites_cubit/favourites_creation_cubit.dart';
import 'package:bonyeza_kazi/src/application/favourites_cubit/favourites_cubit.dart';
import 'package:bonyeza_kazi/src/application/login_cubit/login_cubit.dart';
import 'package:bonyeza_kazi/src/application/chat/chatroom_update_cubit/chatroom_update_cubit.dart';
import 'package:bonyeza_kazi/src/application/registration_cubit/registration_cubit.dart';
import 'package:bonyeza_kazi/src/application/reviews_cubit/reviews_cubit.dart';
import 'package:bonyeza_kazi/src/application/search_cubit/search_cubit.dart';
import 'package:bonyeza_kazi/src/application/service_provider_details_cubit/sp_details_cubit.dart';
import 'package:bonyeza_kazi/src/application/service_providers_from_specific_category_cubit/sp_from_category_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(create: (_) => sl<AuthCubit>()..appStarted()),
          BlocProvider<CategoriesCubit>(
              create: (_) => sl<CategoriesCubit>()..getAllCategories()),
          BlocProvider<FavouritesCubit>(create: (_) => sl<FavouritesCubit>()),
          BlocProvider<ChatsListCubit>(create: (_) => sl<ChatsListCubit>()),
          BlocProvider<SPJobCubit>(create: (_) => sl<SPJobCubit>()),
          BlocProvider<LoginCubit>(create: (_) => sl<LoginCubit>()),
          BlocProvider<JobJourneyCubit>(create: (_) => sl<JobJourneyCubit>()),
          BlocProvider<RegistrationCubit>(
              create: (_) => sl<RegistrationCubit>()),
          BlocProvider<SearchCubit>(create: (_) => sl<SearchCubit>()),
          BlocProvider<SPFromCategoryCubit>(
              create: (_) => sl<SPFromCategoryCubit>()),
          BlocProvider<SPDetailsCubit>(create: (_) => sl<SPDetailsCubit>()),
          BlocProvider<ReviewsCubit>(create: (_) => sl<ReviewsCubit>()),
          BlocProvider<FavouritesCreationCubit>(
              create: (_) => sl<FavouritesCreationCubit>()),
          BlocProvider<JobDescriptionCubit>(
              create: (_) => sl<JobDescriptionCubit>()),
          BlocProvider<ClientPaysWorkerCubit>(
              create: (_) => sl<ClientPaysWorkerCubit>()),
          BlocProvider<SpSetsPriceeCubit>(
              create: (_) => sl<SpSetsPriceeCubit>()),
          BlocProvider<InstantMessagingCubit>(
              create: (_) => sl<InstantMessagingCubit>()),
          BlocProvider<CreateMessageCubit>(
              create: (_) => sl<CreateMessageCubit>()),
          BlocProvider<ChatroomUpdateCubit>(
              create: (_) => sl<ChatroomUpdateCubit>()),
          BlocProvider<WorkCompletedCubit>(
              create: (_) => sl<WorkCompletedCubit>()),
          BlocProvider<ClientRatesJobDoneCubit>(
              create: (_) => sl<ClientRatesJobDoneCubit>()),
          BlocProvider<UpdateUserProfileCubit>(
              create: (_) => sl<UpdateUserProfileCubit>()),
          BlocProvider<NotificationMessagesCubit>(
              create: (_) => sl<NotificationMessagesCubit>()),
          BlocProvider<NotificationsCubit>(
              create: (_) => sl<NotificationsCubit>()),
          BlocProvider<ToggleNotificationStatusCubit>(
              create: (_) => sl<ToggleNotificationStatusCubit>()),
          BlocProvider<SpRequestTimeExtensionCubit>(
              create: (_) => sl<SpRequestTimeExtensionCubit>()),
          BlocProvider<ClientApprovesWorkCubit>(
              create: (_) => sl<ClientApprovesWorkCubit>()),
          BlocProvider<SPWithdrawsMoneyCubit>(
              create: (_) => sl<SPWithdrawsMoneyCubit>()),
        ],
        child: Provider<PushNotificationService>(
          create: (_) => sl<PushNotificationService>(),
          child: Provider<GetChatroomService>(
            create: (_) => sl<GetChatroomService>(),
            child: MaterialApp(
              title: nameOfApp,
              theme: bonyezaTheme,
              debugShowCheckedModeBanner: false,
              builder: ExtendedNavigator.builder(
                router: router.Router(),
                builder: (context, extendedNav) => Theme(
                  data: bonyezaTheme,
                  child: extendedNav,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
