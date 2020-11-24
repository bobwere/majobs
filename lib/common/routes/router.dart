import 'package:auto_route/auto_route_annotations.dart';
import 'package:bonyeza_kazi/common/routes/page_transitions.dart';
import 'package:bonyeza_kazi/src/presentation/list_of_service_providers_page/list_of_service_providers.dart';
import 'package:bonyeza_kazi/src/presentation/login_page/login_page.dart';
import 'package:bonyeza_kazi/src/presentation/profile_page/contacts_page.dart';
import 'package:bonyeza_kazi/src/presentation/notifications_page/push_notification_page.dart';
import 'package:bonyeza_kazi/src/presentation/profile_page/update_profile_page/sp_update_profile_page.dart';
import 'package:bonyeza_kazi/src/presentation/profile_page/update_profile_page/update_profile_page.dart';
import 'package:bonyeza_kazi/src/presentation/search_page/search_page.dart';
import 'package:bonyeza_kazi/src/presentation/service_provider_detail_page/service_provider_detail_page.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/auth_widget.dart';
import 'package:bonyeza_kazi/src/presentation/messages_page/chat_screen_page.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/chat_screen_widgets/client_rejects_work_widget.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/chat_screen_widgets/google_map_direction_widget.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/chat_screen_widgets/request_more_time_widget.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/chat_screen_widgets/send_rating_widget.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/chat_screen_widgets/withdraw_money_widget.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/service_provider_detail_page_widgets/booking_page.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/chat_screen_widgets/set_agreed_price.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/chat_screen_widgets/sp_rejects_job_widget.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/chat_screen_widgets/work_completed_widget.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/service_provider_detail_page_widgets/portfolio_gallery_detail_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: AuthWidget, initial: true),
    CustomRoute(
        path: '/login', page: LoginPage, transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/listofserviceproviders',
        page: ListOfServiceProviders,
        transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/bookingpage',
        fullscreenDialog: true,
        page: BookingPage,
        transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/serviceproviderdetailpage',
        page: ServiceProviderDetailPage,
        transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/chatscreen', page: ChatScreen, transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/workcompletedwidget',
        fullscreenDialog: true,
        page: WorkCompletedWidget,
        transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/sendratingwidget',
        fullscreenDialog: true,
        page: SendRatingWidget,
        transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/sendagreedPricewidget',
        fullscreenDialog: true,
        page: SetAgreedPrice,
        transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/updateprofilepage',
        page: UpdateProfilePage,
        transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/contactspage',
        page: ContactsPage,
        transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/pushnotificationpage',
        page: PushNotificationPage,
        transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/searchpage', page: SearchPage, transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/spupdateprofilepage',
        page: SPUpdateProfilePage,
        fullscreenDialog: true,
        transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/sprejectsjobpage',
        page: SPRejectsJob,
        fullscreenDialog: true,
        transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/requestmoretimepage',
        page: RequestMoreTime,
        fullscreenDialog: true,
        transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/clientRejectsWork',
        page: ClientRejectsWork,
        fullscreenDialog: true,
        transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/directionToClient',
        page: DirectionToClient,
        fullscreenDialog: true,
        transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/portfolioGalleryDetailPage',
        page: PortfolioGalleryDetailPage,
        fullscreenDialog: true,
        transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/withdrawMoneyWidget',
        page: WithdrawMoneyWidget,
        fullscreenDialog: true,
        transitionsBuilder: fadeThrough),
  ],
)
class $Router {}
