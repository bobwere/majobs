// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../../src/infrastructure/categories/models/service_provider_search_model.dart';
import '../../src/infrastructure/chat/models/chatroom_model.dart';
import '../../src/infrastructure/chat/models/message_model.dart';
import '../../src/presentation/list_of_service_providers_page/list_of_service_providers.dart';
import '../../src/presentation/login_page/login_page.dart';
import '../../src/presentation/messages_page/chat_screen_page.dart';
import '../../src/presentation/notifications_page/push_notification_page.dart';
import '../../src/presentation/profile_page/contacts_page.dart';
import '../../src/presentation/profile_page/update_profile_page/sp_update_profile_page.dart';
import '../../src/presentation/profile_page/update_profile_page/update_profile_page.dart';
import '../../src/presentation/search_page/search_page.dart';
import '../../src/presentation/service_provider_detail_page/service_provider_detail_page.dart';
import '../../src/presentation/widgets/auth_widget.dart';
import '../../src/presentation/widgets/chat_screen_widgets/client_rejects_work_widget.dart';
import '../../src/presentation/widgets/chat_screen_widgets/google_map_direction_widget.dart';
import '../../src/presentation/widgets/chat_screen_widgets/request_more_time_widget.dart';
import '../../src/presentation/widgets/chat_screen_widgets/send_rating_widget.dart';
import '../../src/presentation/widgets/chat_screen_widgets/set_agreed_price.dart';
import '../../src/presentation/widgets/chat_screen_widgets/sp_rejects_job_widget.dart';
import '../../src/presentation/widgets/chat_screen_widgets/withdraw_money_widget.dart';
import '../../src/presentation/widgets/chat_screen_widgets/work_completed_widget.dart';
import '../../src/presentation/widgets/service_provider_detail_page_widgets/booking_page.dart';
import '../../src/presentation/widgets/service_provider_detail_page_widgets/portfolio_gallery_detail_page.dart';
import 'page_transitions.dart';

class Routes {
  static const String authWidget = '/';
  static const String loginPage = '/login';
  static const String listOfServiceProviders = '/listofserviceproviders';
  static const String bookingPage = '/bookingpage';
  static const String serviceProviderDetailPage = '/serviceproviderdetailpage';
  static const String chatScreen = '/chatscreen';
  static const String workCompletedWidget = '/workcompletedwidget';
  static const String sendRatingWidget = '/sendratingwidget';
  static const String setAgreedPrice = '/sendagreedPricewidget';
  static const String updateProfilePage = '/updateprofilepage';
  static const String contactsPage = '/contactspage';
  static const String pushNotificationPage = '/pushnotificationpage';
  static const String searchPage = '/searchpage';
  static const String sPUpdateProfilePage = '/spupdateprofilepage';
  static const String sPRejectsJob = '/sprejectsjobpage';
  static const String requestMoreTime = '/requestmoretimepage';
  static const String clientRejectsWork = '/clientRejectsWork';
  static const String directionToClient = '/directionToClient';
  static const String portfolioGalleryDetailPage =
      '/portfolioGalleryDetailPage';
  static const String withdrawMoneyWidget = '/withdrawMoneyWidget';
  static const all = <String>{
    authWidget,
    loginPage,
    listOfServiceProviders,
    bookingPage,
    serviceProviderDetailPage,
    chatScreen,
    workCompletedWidget,
    sendRatingWidget,
    setAgreedPrice,
    updateProfilePage,
    contactsPage,
    pushNotificationPage,
    searchPage,
    sPUpdateProfilePage,
    sPRejectsJob,
    requestMoreTime,
    clientRejectsWork,
    directionToClient,
    portfolioGalleryDetailPage,
    withdrawMoneyWidget,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.authWidget, page: AuthWidget),
    RouteDef(Routes.loginPage, page: LoginPage),
    RouteDef(Routes.listOfServiceProviders, page: ListOfServiceProviders),
    RouteDef(Routes.bookingPage, page: BookingPage),
    RouteDef(Routes.serviceProviderDetailPage, page: ServiceProviderDetailPage),
    RouteDef(Routes.chatScreen, page: ChatScreen),
    RouteDef(Routes.workCompletedWidget, page: WorkCompletedWidget),
    RouteDef(Routes.sendRatingWidget, page: SendRatingWidget),
    RouteDef(Routes.setAgreedPrice, page: SetAgreedPrice),
    RouteDef(Routes.updateProfilePage, page: UpdateProfilePage),
    RouteDef(Routes.contactsPage, page: ContactsPage),
    RouteDef(Routes.pushNotificationPage, page: PushNotificationPage),
    RouteDef(Routes.searchPage, page: SearchPage),
    RouteDef(Routes.sPUpdateProfilePage, page: SPUpdateProfilePage),
    RouteDef(Routes.sPRejectsJob, page: SPRejectsJob),
    RouteDef(Routes.requestMoreTime, page: RequestMoreTime),
    RouteDef(Routes.clientRejectsWork, page: ClientRejectsWork),
    RouteDef(Routes.directionToClient, page: DirectionToClient),
    RouteDef(Routes.portfolioGalleryDetailPage,
        page: PortfolioGalleryDetailPage),
    RouteDef(Routes.withdrawMoneyWidget, page: WithdrawMoneyWidget),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    AuthWidget: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AuthWidget(),
        settings: data,
      );
    },
    LoginPage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LoginPage(),
        settings: data,
        transitionsBuilder: fadeThrough,
      );
    },
    ListOfServiceProviders: (data) {
      final args = data.getArgs<ListOfServiceProvidersArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ListOfServiceProviders(
          key: args.key,
          title: args.title,
        ),
        settings: data,
        transitionsBuilder: fadeThrough,
      );
    },
    BookingPage: (data) {
      final args = data.getArgs<BookingPageArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => BookingPage(
          key: args.key,
          serviceProvider: args.serviceProvider,
          locationData: args.locationData,
          userLocation: args.userLocation,
        ),
        settings: data,
        transitionsBuilder: fadeThrough,
        fullscreenDialog: true,
      );
    },
    ServiceProviderDetailPage: (data) {
      final args =
          data.getArgs<ServiceProviderDetailPageArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ServiceProviderDetailPage(
          key: args.key,
          serviceProvider: args.serviceProvider,
        ),
        settings: data,
        transitionsBuilder: fadeThrough,
      );
    },
    ChatScreen: (data) {
      final args = data.getArgs<ChatScreenArguments>(
        orElse: () => ChatScreenArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => ChatScreen(
          chatroomID: args.chatroomID,
          otherUser: args.otherUser,
          unread: args.unread,
          chatroom: args.chatroom,
        ),
        settings: data,
        transitionsBuilder: fadeThrough,
      );
    },
    WorkCompletedWidget: (data) {
      final args = data.getArgs<WorkCompletedWidgetArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            WorkCompletedWidget(
          key: args.key,
          chatRoom: args.chatRoom,
          isMe: args.isMe,
          message: args.message,
        ),
        settings: data,
        transitionsBuilder: fadeThrough,
        fullscreenDialog: true,
      );
    },
    SendRatingWidget: (data) {
      final args = data.getArgs<SendRatingWidgetArguments>(
        orElse: () => SendRatingWidgetArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            SendRatingWidget(
          key: args.key,
          chatRoom: args.chatRoom,
          isMe: args.isMe,
          message: args.message,
          userTypeID: args.userTypeID,
        ),
        settings: data,
        transitionsBuilder: fadeThrough,
        fullscreenDialog: true,
      );
    },
    SetAgreedPrice: (data) {
      final args = data.getArgs<SetAgreedPriceArguments>(
        orElse: () => SetAgreedPriceArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => SetAgreedPrice(
          key: args.key,
          chatRoom: args.chatRoom,
          isMe: args.isMe,
          message: args.message,
        ),
        settings: data,
        transitionsBuilder: fadeThrough,
        fullscreenDialog: true,
      );
    },
    UpdateProfilePage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const UpdateProfilePage(),
        settings: data,
        transitionsBuilder: fadeThrough,
      );
    },
    ContactsPage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => ContactsPage(),
        settings: data,
        transitionsBuilder: fadeThrough,
      );
    },
    PushNotificationPage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const PushNotificationPage(),
        settings: data,
        transitionsBuilder: fadeThrough,
      );
    },
    SearchPage: (data) {
      final args = data.getArgs<SearchPageArguments>(
        orElse: () => SearchPageArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => SearchPage(
          key: args.key,
          searchlistviewBottomPadding: args.searchlistviewBottomPadding,
        ),
        settings: data,
        transitionsBuilder: fadeThrough,
      );
    },
    SPUpdateProfilePage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const SPUpdateProfilePage(),
        settings: data,
        transitionsBuilder: fadeThrough,
        fullscreenDialog: true,
      );
    },
    SPRejectsJob: (data) {
      final args = data.getArgs<SPRejectsJobArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => SPRejectsJob(
          key: args.key,
          chatRoom: args.chatRoom,
          isMe: args.isMe,
          message: args.message,
        ),
        settings: data,
        transitionsBuilder: fadeThrough,
        fullscreenDialog: true,
      );
    },
    RequestMoreTime: (data) {
      final args = data.getArgs<RequestMoreTimeArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            RequestMoreTime(
          key: args.key,
          chatRoom: args.chatRoom,
          isMe: args.isMe,
          message: args.message,
        ),
        settings: data,
        transitionsBuilder: fadeThrough,
        fullscreenDialog: true,
      );
    },
    ClientRejectsWork: (data) {
      final args = data.getArgs<ClientRejectsWorkArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ClientRejectsWork(
          key: args.key,
          chatRoom: args.chatRoom,
          isMe: args.isMe,
          message: args.message,
        ),
        settings: data,
        transitionsBuilder: fadeThrough,
        fullscreenDialog: true,
      );
    },
    DirectionToClient: (data) {
      final args = data.getArgs<DirectionToClientArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            DirectionToClient(
          key: args.key,
          sPLocationData: args.sPLocationData,
          clientLatData: args.clientLatData,
          clientLngData: args.clientLngData,
        ),
        settings: data,
        transitionsBuilder: fadeThrough,
        fullscreenDialog: true,
      );
    },
    PortfolioGalleryDetailPage: (data) {
      final args =
          data.getArgs<PortfolioGalleryDetailPageArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            PortfolioGalleryDetailPage(
          key: args.key,
          imagePaths: args.imagePaths,
          currentIndex: args.currentIndex,
        ),
        settings: data,
        transitionsBuilder: fadeThrough,
        fullscreenDialog: true,
      );
    },
    WithdrawMoneyWidget: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const WithdrawMoneyWidget(),
        settings: data,
        transitionsBuilder: fadeThrough,
        fullscreenDialog: true,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ListOfServiceProviders arguments holder class
class ListOfServiceProvidersArguments {
  final Key key;
  final String title;
  ListOfServiceProvidersArguments({this.key, @required this.title});
}

/// BookingPage arguments holder class
class BookingPageArguments {
  final Key key;
  final ServiceProvider serviceProvider;
  final LocationData locationData;
  final String userLocation;
  BookingPageArguments(
      {this.key,
      @required this.serviceProvider,
      @required this.locationData,
      @required this.userLocation});
}

/// ServiceProviderDetailPage arguments holder class
class ServiceProviderDetailPageArguments {
  final Key key;
  final ServiceProvider serviceProvider;
  ServiceProviderDetailPageArguments(
      {this.key, @required this.serviceProvider});
}

/// ChatScreen arguments holder class
class ChatScreenArguments {
  final String chatroomID;
  final ChatUser otherUser;
  final bool unread;
  final ChatRoom chatroom;
  ChatScreenArguments(
      {this.chatroomID, this.otherUser, this.unread, this.chatroom});
}

/// WorkCompletedWidget arguments holder class
class WorkCompletedWidgetArguments {
  final Key key;
  final ChatRoom chatRoom;
  final bool isMe;
  final Message message;
  WorkCompletedWidgetArguments(
      {this.key,
      @required this.chatRoom,
      @required this.isMe,
      @required this.message});
}

/// SendRatingWidget arguments holder class
class SendRatingWidgetArguments {
  final Key key;
  final ChatRoom chatRoom;
  final bool isMe;
  final Message message;
  final String userTypeID;
  SendRatingWidgetArguments(
      {this.key, this.chatRoom, this.isMe, this.message, this.userTypeID});
}

/// SetAgreedPrice arguments holder class
class SetAgreedPriceArguments {
  final Key key;
  final ChatRoom chatRoom;
  final bool isMe;
  final Message message;
  SetAgreedPriceArguments({this.key, this.chatRoom, this.isMe, this.message});
}

/// SearchPage arguments holder class
class SearchPageArguments {
  final Key key;
  final double searchlistviewBottomPadding;
  SearchPageArguments({this.key, this.searchlistviewBottomPadding = 280.0});
}

/// SPRejectsJob arguments holder class
class SPRejectsJobArguments {
  final Key key;
  final ChatRoom chatRoom;
  final bool isMe;
  final Message message;
  SPRejectsJobArguments(
      {this.key,
      @required this.chatRoom,
      @required this.isMe,
      @required this.message});
}

/// RequestMoreTime arguments holder class
class RequestMoreTimeArguments {
  final Key key;
  final ChatRoom chatRoom;
  final bool isMe;
  final Message message;
  RequestMoreTimeArguments(
      {this.key,
      @required this.chatRoom,
      @required this.isMe,
      @required this.message});
}

/// ClientRejectsWork arguments holder class
class ClientRejectsWorkArguments {
  final Key key;
  final ChatRoom chatRoom;
  final bool isMe;
  final Message message;
  ClientRejectsWorkArguments(
      {this.key,
      @required this.chatRoom,
      @required this.isMe,
      @required this.message});
}

/// DirectionToClient arguments holder class
class DirectionToClientArguments {
  final Key key;
  final LocationData sPLocationData;
  final double clientLatData;
  final double clientLngData;
  DirectionToClientArguments(
      {this.key,
      @required this.sPLocationData,
      @required this.clientLatData,
      @required this.clientLngData});
}

/// PortfolioGalleryDetailPage arguments holder class
class PortfolioGalleryDetailPageArguments {
  final Key key;
  final List<String> imagePaths;
  final int currentIndex;
  PortfolioGalleryDetailPageArguments(
      {this.key, @required this.imagePaths, @required this.currentIndex});
}
