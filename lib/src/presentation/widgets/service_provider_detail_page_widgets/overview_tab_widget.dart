import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/common/routes/router.gr.dart';
import 'package:bonyeza_kazi/src/application/auth_cubit/auth_cubit.dart';
import 'package:bonyeza_kazi/src/application/reviews_cubit/reviews_cubit.dart';
import 'package:bonyeza_kazi/src/application/service_provider_details_cubit/sp_details_cubit.dart';
import 'package:bonyeza_kazi/src/infrastructure/categories/models/service_provider_search_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/favourites/models/favourites_model.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/service_provider_detail_page_widgets/overview_tab_button_widget.dart';
import 'package:bonyeza_kazi/src/application/favourites_cubit/favourites_creation_cubit.dart';
import 'package:division/division.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:share/share.dart';

class OverviewTab extends StatefulWidget {
  const OverviewTab({Key key, @required this.serviceProvider})
      : super(key: key);
  final ServiceProvider serviceProvider;

  @override
  _OverviewTabState createState() => _OverviewTabState();
}

class _OverviewTabState extends State<OverviewTab>
    with AutomaticKeepAliveClientMixin<OverviewTab> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    FavouritesCreationCubit favouritesCreationCubit =
        BlocProvider.of<FavouritesCreationCubit>(context);
    SPDetailsCubit spDetailsCubit = BlocProvider.of<SPDetailsCubit>(context);
    ReviewsCubit reviewsCubit = BlocProvider.of<ReviewsCubit>(context);
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            key: PageStorageKey<String>('overview'),
            slivers: <Widget>[
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Column(
                      children: [
                        Parent(
                          style: ParentStyle()
                            ..height(140.h)
                            ..background.color(Colors.white)
                            ..boxShadow(
                                offset: Offset(0, 2),
                                blur: kBoxShadowBlur,
                                color: kBoxShadowColor.shade400),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BlocBuilder<AuthCubit, AuthState>(
                                builder: (context, state) {
                                  return state.maybeMap(authenticated: (state) {
                                    return OverviewTabButton(
                                        text: 'BOOK',
                                        icon: LineAwesomeIcons
                                            .calendar_with_day_focus,
                                        onButtonPressed: () async {
                                          Flushbar(
                                            title:
                                                'Attempting to get permission to access your location',
                                            message: 'Please wait a moment...',
                                            margin: EdgeInsets.all(20.h),
                                            flushbarPosition:
                                                FlushbarPosition.TOP,
                                            duration: Duration(seconds: 3),
                                            isDismissible: true,
                                            backgroundColor: Colors.green,
                                            borderRadius: 15.h,
                                          ).show(context);
                                          var permissionStatus =
                                              await _getPermission();

                                          if (permissionStatus ==
                                              PermissionStatus.granted) {
                                            loc.Location location =
                                                loc.Location();
                                            Flushbar(
                                              title:
                                                  'Attempting to retrieve your current location...',
                                              message:
                                                  'Please wait a moment...',
                                              margin: EdgeInsets.all(20.h),
                                              flushbarPosition:
                                                  FlushbarPosition.TOP,
                                              duration: Duration(seconds: 3),
                                              isDismissible: true,
                                              backgroundColor: Colors.green,
                                              borderRadius: 15.h,
                                            ).show(context);
                                            var locationData =
                                                await location.getLocation();
                                            List<Placemark> data =
                                                await placemarkFromCoordinates(
                                                    locationData.latitude,
                                                    locationData.longitude);
                                            var mlocation =
                                                '${data[0].administrativeArea} ${data[0].subLocality}';

                                            ExtendedNavigator.of(context).push(
                                              Routes.bookingPage,
                                              arguments: BookingPageArguments(
                                                  serviceProvider:
                                                      widget.serviceProvider,
                                                  locationData: locationData,
                                                  userLocation: mlocation),
                                            );
                                          } else {
                                            Flushbar(
                                              title: 'Permissions error',
                                              message:
                                                  'Please enable permission to access your location in the system settings to proceed',
                                              margin: EdgeInsets.all(20.h),
                                              flushbarPosition:
                                                  FlushbarPosition.TOP,
                                              duration: Duration(seconds: 3),
                                              isDismissible: true,
                                              backgroundColor:
                                                  Color(0xFFFD9726),
                                              borderRadius: 15.h,
                                            ).show(context);
                                          }
                                        });
                                  }, orElse: () {
                                    return OverviewTabButton(
                                      text: 'BOOK',
                                      icon: LineAwesomeIcons
                                          .calendar_with_day_focus,
                                      onButtonPressed: () {
                                        Flushbar(
                                          title: 'Registered users only',
                                          message:
                                              'Please register first in order to make a booking',
                                          margin: EdgeInsets.all(20.h),
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                          duration: Duration(seconds: 5),
                                          isDismissible: true,
                                          backgroundColor: Color(0xFFFD9726),
                                          borderRadius: 15.h,
                                          mainButton: FlatButton(
                                            color: kGreenBackgroundColor,
                                            onPressed: () {
                                              authCubit.spClientWasLookingAt(
                                                  serviceProvider:
                                                      widget.serviceProvider);
                                              authCubit.registerClient();
                                              ExtendedNavigator.of(context)
                                                  .popUntilRoot();
                                            },
                                            child: TextResponsive(
                                              "CLICK TO\nREGISTER",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ).show(context);
                                      },
                                    );
                                  });
                                },
                              ),
                              BlocBuilder<AuthCubit, AuthState>(
                                builder: (context, state) {
                                  return state.maybeMap(authenticated: (state) {
                                    return OverviewTabButton(
                                      text: 'SAVE',
                                      icon: Icons.favorite_border,
                                      onButtonPressed: () {
                                        final favourites = Favourites(
                                          id: widget.serviceProvider.id,
                                          name:
                                              widget.serviceProvider.username ??
                                                  " ",
                                          skill: widget.serviceProvider.skills,
                                          rating: widget.serviceProvider
                                                  .clientRating ??
                                              null,
                                          imageUrl:
                                              widget.serviceProvider.photo,
                                          msisdn: widget.serviceProvider.msisdn,
                                          images: widget.serviceProvider.images,
                                          time: DateTime.now()
                                              .millisecondsSinceEpoch
                                              .toString(),
                                          location:
                                              widget.serviceProvider.location,
                                          city: widget.serviceProvider.city,
                                        );
                                        favouritesCreationCubit
                                            .createFavourites(
                                                favourites: favourites);
                                      },
                                    );
                                  }, orElse: () {
                                    return OverviewTabButton(
                                      text: 'SAVE',
                                      icon: Icons.favorite_border,
                                      onButtonPressed: () {
                                        Flushbar(
                                          title: 'Registered users only',
                                          message:
                                              'Please register/login first in order to favourite this service provider',
                                          margin: EdgeInsets.all(20.h),
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                          duration: Duration(seconds: 5),
                                          isDismissible: true,
                                          backgroundColor: Color(0xFFFD9726),
                                          borderRadius: 15.h,
                                          mainButton: FlatButton(
                                            color: kGreenBackgroundColor,
                                            onPressed: () {
                                              authCubit.spClientWasLookingAt(
                                                  serviceProvider:
                                                      widget.serviceProvider);
                                              authCubit.registerClient();
                                              ExtendedNavigator.of(context)
                                                  .popUntilRoot();
                                            },
                                            child: TextResponsive(
                                              "CLICK TO\nREGISTER",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ).show(context);
                                      },
                                    );
                                  });
                                },
                              ),
                              OverviewTabButton(
                                  text: 'SHARE',
                                  icon: LineAwesomeIcons.share_square,
                                  onButtonPressed: () {
                                    Share.share(SOCIAL_SHARE_MESSAGE);
                                  }),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsetsResponsive.all(20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: TextResponsive(
                              widget.serviceProvider.bio ?? ' ',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 21),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<PermissionStatus> _getPermission() async {
    final PermissionStatus permission = await Permission.location.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.denied) {
      final Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.location].request();
      return permissionStatus[Permission.location] ??
          PermissionStatus.undetermined;
    } else {
      return permission;
    }
  }
}
