// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/application/auth_cubit/auth_cubit.dart';
import 'src/infrastructure/auth/repositories/auth_facade.dart';
import 'src/application/categories_cubit/categories_cubit.dart';
import 'src/infrastructure/categories/repositories/categories_facade.dart';
import 'src/infrastructure/chat/repositories/chat_facade.dart';
import 'src/application/chat/chatroom_update_cubit/chatroom_update_cubit.dart';
import 'src/application/chat/chats_list_cubit/chats_list_cubit.dart';
import 'src/application/job_journey/client_approves_work_cubit/client_approves_work_cubit.dart';
import 'src/application/job_journey/clients_pays_worker_cubit/client_pays_worker_cubit.dart';
import 'src/application/job_journey/client_rates_job_done_cubit/client_rates_job_done_cubit.dart';
import 'src/application/chat/create_message_cubit/create_message_cubit.dart';
import 'src/application/favourites_cubit/favourites_creation_cubit.dart';
import 'src/application/favourites_cubit/favourites_cubit.dart';
import 'src/infrastructure/favourites/repositories/favourites_facade.dart';
import 'src/services/get_client_sp_chatroom.dart';
import 'src/domain/auth/i_auth_inteface.dart';
import 'src/domain/categories/i_categories_interface.dart';
import 'src/domain/chat/i_chat_interface.dart';
import 'src/domain/favourites/i_favourites_interface.dart';
import 'src/domain/job_journey/i_job_journey_interface.dart';
import 'src/domain/notificationsettings/i_notifications_interface.dart';
import 'src/domain/service_provider/i_service_provider_interface.dart';
import 'src/domain/update_user_profile/i_update_user_profile_interface.dart';
import 'common/config/injectable_modules.dart';
import 'src/application/chat/instant_messaging_cubit/instant_messaging_cubit.dart';
import 'src/application/job_journey/client_job_description_cubit/job_description_cubit.dart';
import 'src/application/job_journey/job_journey_cubit/job_journey_cubit.dart';
import 'src/infrastructure/job_journey/repositories/job_journey_facade.dart';
import 'src/application/login_cubit/login_cubit.dart';
import 'src/application/notifications/notification_messages_cubit/notification_messages_cubit.dart';
import 'src/application/notifications/notifications_cubit/notification_cubit.dart';
import 'src/infrastructure/notifications/repositories/notification_facade.dart';
import 'src/services/push_notification_service.dart';
import 'src/application/registration_cubit/registration_cubit.dart';
import 'src/application/reviews_cubit/reviews_cubit.dart';
import 'src/application/service_provider_details_cubit/sp_details_cubit.dart';
import 'src/application/service_providers_from_specific_category_cubit/sp_from_category_cubit.dart';
import 'src/application/sp_job_cubit/sp_job_cubit.dart';
import 'src/application/sp_job_cubit/sp_withdraws_money.dart/sp_withdraws_money_cubit.dart';
import 'src/application/search_cubit/search_cubit.dart';
import 'src/infrastructure/service_provider/repositories/service_provider_facade.dart';
import 'src/application/job_journey/sp_request_time_extension_cubit/sp_request_time_extension_cubit.dart';
import 'src/application/job_journey/sp_sets_price_cubit/sp_sets_price_cubit.dart';
import 'src/application/notifications/toggle_notifications_cubit/toggle_notifications_cubit.dart';
import 'src/application/update_user_profile_cubit/update_user_profile_cubit.dart';
import 'src/infrastructure/update_user_profile/repositories/update_user_profile_facade.dart';
import 'src/infrastructure/auth/mapper/user_mapper.dart';
import 'src/application/job_journey/work_completed_cubit/work_completed_cubit.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<Dio>(() => injectableModule.dio);
  gh.lazySingleton<DioCacheManager>(() => injectableModule.cacheManager);
  gh.lazySingleton<FirebaseAuth>(() => injectableModule.firebaseauth);
  gh.lazySingleton<FirebaseFirestore>(() => injectableModule.firestore);
  gh.lazySingleton<FirebaseMessaging>(() => injectableModule.firemessaging);
  gh.lazySingleton<FlutterSecureStorage>(() => injectableModule.storage);
  gh.lazySingleton<IChatFacade>(() => ChatFacade(get<FirebaseFirestore>()));
  gh.lazySingleton<IJobJourneyFacade>(
      () => JobJourneyFacade(get<Dio>(), get<FlutterSecureStorage>()));
  gh.lazySingleton<IServiceProviderFacade>(() => ServiceProviderFacade(
        get<Dio>(),
        get<FlutterSecureStorage>(),
        get<DioCacheManager>(),
      ));
  gh.factory<ReviewsCubit>(() => ReviewsCubit(get<IServiceProviderFacade>()));
  gh.factory<SPDetailsCubit>(
      () => SPDetailsCubit(get<IServiceProviderFacade>()));
  final sharedPreferences = await injectableModule.pref;
  gh.factory<SharedPreferences>(() => sharedPreferences);
  gh.factory<SpRequestTimeExtensionCubit>(() => SpRequestTimeExtensionCubit(
        get<IJobJourneyFacade>(),
        get<IChatFacade>(),
        get<SharedPreferences>(),
      ));
  gh.factory<SpSetsPriceeCubit>(() => SpSetsPriceeCubit(
        get<IJobJourneyFacade>(),
        get<IChatFacade>(),
        get<SharedPreferences>(),
      ));
  gh.lazySingleton<UserMapper>(() => UserMapper());
  gh.factory<WorkCompletedCubit>(() => WorkCompletedCubit(
        get<IJobJourneyFacade>(),
        get<SharedPreferences>(),
        get<IChatFacade>(),
      ));
  gh.factory<ChatroomUpdateCubit>(
      () => ChatroomUpdateCubit(get<IChatFacade>()));
  gh.factory<ChatsListCubit>(
      () => ChatsListCubit(get<IChatFacade>(), get<SharedPreferences>()));
  gh.factory<ClientApprovesWorkCubit>(() => ClientApprovesWorkCubit(
        get<IJobJourneyFacade>(),
        get<IChatFacade>(),
        get<SharedPreferences>(),
      ));
  gh.factory<ClientPaysWorkerCubit>(() => ClientPaysWorkerCubit(
        get<IJobJourneyFacade>(),
        get<IChatFacade>(),
        get<SharedPreferences>(),
      ));
  gh.factory<ClientRatesJobDoneCubit>(() => ClientRatesJobDoneCubit(
        get<IJobJourneyFacade>(),
        get<IChatFacade>(),
        get<SharedPreferences>(),
      ));
  gh.factory<CreateMessageCubit>(
      () => CreateMessageCubit(get<IChatFacade>(), get<SharedPreferences>()));
  gh.lazySingleton<GetChatroomService>(
      () => GetChatroomService(get<IChatFacade>()));
  gh.lazySingleton<IAuthFacade>(() => AuthFacade(
        get<Dio>(),
        get<SharedPreferences>(),
        get<FlutterSecureStorage>(),
        get<FirebaseFirestore>(),
        get<UserMapper>(),
        get<FirebaseAuth>(),
      ));
  gh.lazySingleton<ICasualCategoriesFacade>(() => CategoriesFacade(
        get<Dio>(),
        get<FlutterSecureStorage>(),
        get<DioCacheManager>(),
        get<SharedPreferences>(),
      ));
  gh.lazySingleton<IFavouritesFacade>(() =>
      FavouritesFacade(get<FirebaseFirestore>(), get<SharedPreferences>()));
  gh.lazySingleton<INotificationsFacade>(() =>
      NotificationsFacade(get<FirebaseFirestore>(), get<SharedPreferences>()));
  gh.lazySingleton<IUpdateUserProfileFacade>(() => UpdateUserProfileFacade(
        get<Dio>(),
        get<FlutterSecureStorage>(),
        get<SharedPreferences>(),
      ));
  gh.factory<InstantMessagingCubit>(() =>
      InstantMessagingCubit(get<IChatFacade>(), get<SharedPreferences>()));
  gh.factory<JobDescriptionCubit>(() => JobDescriptionCubit(
        get<IJobJourneyFacade>(),
        get<SharedPreferences>(),
        get<IChatFacade>(),
        get<IAuthFacade>(),
      ));
  gh.factory<JobJourneyCubit>(() => JobJourneyCubit(
        get<IJobJourneyFacade>(),
        get<IChatFacade>(),
        get<SharedPreferences>(),
      ));
  gh.factory<LoginCubit>(() => LoginCubit(get<IAuthFacade>()));
  gh.factory<NotificationMessagesCubit>(
      () => NotificationMessagesCubit(get<INotificationsFacade>()));
  gh.factory<NotificationsCubit>(
      () => NotificationsCubit(get<INotificationsFacade>()));
  gh.lazySingleton<PushNotificationService>(() => PushNotificationService(
        get<SharedPreferences>(),
        get<FirebaseMessaging>(),
        get<FirebaseFirestore>(),
      ));
  gh.factory<RegistrationCubit>(() => RegistrationCubit(get<IAuthFacade>()));
  gh.factory<SPFromCategoryCubit>(
      () => SPFromCategoryCubit(get<ICasualCategoriesFacade>()));
  gh.factory<SPJobCubit>(() =>
      SPJobCubit(get<IServiceProviderFacade>(), get<SharedPreferences>()));
  gh.factory<SPWithdrawsMoneyCubit>(() => SPWithdrawsMoneyCubit(
      get<IServiceProviderFacade>(), get<SharedPreferences>()));
  gh.factory<SearchCubit>(() => SearchCubit(get<ICasualCategoriesFacade>()));
  gh.factory<ToggleNotificationStatusCubit>(
      () => ToggleNotificationStatusCubit(get<INotificationsFacade>()));
  gh.factory<UpdateUserProfileCubit>(() => UpdateUserProfileCubit(
      get<IUpdateUserProfileFacade>(), get<SharedPreferences>()));
  gh.factory<AuthCubit>(
      () => AuthCubit(get<IAuthFacade>(), get<SharedPreferences>()));
  gh.factory<CategoriesCubit>(() => CategoriesCubit(
      get<ICasualCategoriesFacade>(), get<SharedPreferences>()));
  gh.factory<FavouritesCreationCubit>(
      () => FavouritesCreationCubit(get<IFavouritesFacade>()));
  gh.factory<FavouritesCubit>(() => FavouritesCubit(get<IFavouritesFacade>()));
  return get;
}

class _$InjectableModule extends InjectableModule {}
