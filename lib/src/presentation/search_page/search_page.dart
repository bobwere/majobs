import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/constants/loading_and_error_widget.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/common/routes/router.gr.dart';
import 'package:bonyeza_kazi/common/utils/dropdown_search.dart';
import 'package:bonyeza_kazi/src/application/reviews_cubit/reviews_cubit.dart';
import 'package:bonyeza_kazi/src/application/search_cubit/search_cubit.dart';
import 'package:bonyeza_kazi/src/application/service_provider_details_cubit/sp_details_cubit.dart';
import 'package:bonyeza_kazi/src/infrastructure/categories/models/service_provider_search_model.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/list_of_service_providers_page_widgets.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/search_page_widgets.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import '../../../common/constants/style.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key, this.searchlistviewBottomPadding = 280.0})
      : super(key: key);
  final double searchlistviewBottomPadding;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Completer<GoogleMapController> _mapController = Completer();
  List<Marker> spMarkers = [];
  TextEditingController skillSearchController = TextEditingController();
  TextEditingController locationSearchController = TextEditingController();
  List<ServiceProvider> serviceProviderList = [];
  String selectedSkill;
  String selectedLocation;

  Future<void> moveCamera(int index) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: spMarkers[index].position,
        zoom: 14.0,
        bearing: 45.0,
        tilt: 45.0)));
  }

  Future<String> awaitASecond() async {
    await Future.delayed(Duration(seconds: 1));
    return 'Done';
  }

  @override
  Widget build(BuildContext context) {
    SearchCubit searchCubit = BlocProvider.of<SearchCubit>(context);
    SPDetailsCubit spDetailsCubit = BlocProvider.of<SPDetailsCubit>(context);
    ReviewsCubit reviewsCubit = BlocProvider.of<ReviewsCubit>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBoxResponsive(height: 60),
            ContainerResponsive(
              margin: EdgeInsetsResponsive.symmetric(horizontal: 20),
              child: DropDownField(
                controller: skillSearchController,
                items: skills,
                setter: (value) {},
                onValueChanged: (value) {
                  setState(() {
                    selectedSkill = value;
                  });
                  searchCubit.skillChanged(selectedSkill);
                },
                hintText: 'Search for service...',
              ),
            ),
            SizedBoxResponsive(height: 20),
            Padding(
              padding: EdgeInsetsResponsive.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: DropDownField(
                      controller: locationSearchController,
                      items: locations,
                      onValueChanged: (value) {
                        setState(() {
                          selectedLocation = value;
                        });
                        searchCubit.locationChanged(selectedLocation);
                      },
                      hintText: 'Location',
                    ),
                  ),
                  SizedBoxResponsive(width: 10),
                  Expanded(
                    flex: 1,
                    child: RatingDropDown(items: [...ratings]),
                  ),
                ],
              ),
            ),
            SizedBoxResponsive(height: 20),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                awaitASecond();
                return FutureBuilder(
                  future: awaitASecond(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        height: 300.h,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: nrbCBD,
                          onMapCreated: (GoogleMapController controller) {
                            _mapController.complete(controller);
                          },
                          markers: Set.from(spMarkers),
                        ),
                      );
                    }
                    return Container(
                      height: 300.h,
                      child: GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: nrbCBD,
                        onMapCreated: (GoogleMapController controller) {
                          _mapController.complete(controller);
                        },
                        markers: Set.from(spMarkers),
                      ),
                    );
                  },
                );
              },
            ),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state == SearchState.initial()) {
                  return Container();
                }
                if (state.isSubmitting) {
                  return Padding(
                      padding: EdgeInsetsResponsive.only(top: 100),
                      child: LoadingBallIndicator());
                }
                return state.searchFailureOrSuccessOption
                    .fold(() => Container(), (either) {
                  return either.fold((failure) {
                    return failure.map(
                        serverError: (_) => GestureDetector(
                            onTap: () {
                              searchCubit.searchForServiceProviders();
                            },
                            child:
                                ErrorIndicator(message: SERVER_ERROR_MESSAGE)),
                        noInternet: (_) => GestureDetector(
                            onTap: () {
                              searchCubit.searchForServiceProviders();
                            },
                            child:
                                ErrorIndicator(message: NO_INTERNET_MESSAGE)));
                  }, (serviceProviders) {
                    spMarkers.clear();
                    serviceProviderList = serviceProviders.asList();
                    serviceProviderList.forEach((element) {
                      final latLng = coordinates[element.location];

                      spMarkers.add(Marker(
                          markerId: MarkerId(element.id),
                          draggable: false,
                          infoWindow: InfoWindow(title: element.name),
                          position: latLng));
                    });
                    return serviceProviderList.length != 0
                        ? ContainerResponsive(
                            height: widget.searchlistviewBottomPadding,
                            child: ListView.builder(
                              padding: EdgeInsets.only(top: 20.h),
                              itemCount: serviceProviderList.length,
                              itemBuilder: (context, index) {
                                final serviceProvider =
                                    serviceProviderList[index];
                                return Container(
                                  padding: EdgeInsets.only(
                                      top: 0.h,
                                      bottom: 10.h,
                                      left: 10.h,
                                      right: 10.h),
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            ExtendedNavigator.of(context).push(
                                              Routes.serviceProviderDetailPage,
                                              arguments:
                                                  ServiceProviderDetailPageArguments(
                                                      serviceProvider:
                                                          serviceProvider),
                                            );
                                            spDetailsCubit
                                                .getServiceProviderDetails(
                                                    id: serviceProvider.id);
                                            reviewsCubit
                                                .getServiceProviderReviews(
                                                    id: serviceProvider.id);
                                          },
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBoxResponsive(
                                                width: 20,
                                              ),
                                              Column(
                                                children: [
                                                  SPDetails(
                                                      name: serviceProvider
                                                          .username,
                                                      rating: serviceProvider
                                                          .clientRating,
                                                      skills: serviceProvider
                                                          .skills,
                                                      location: serviceProvider
                                                          .location)
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                            icon: Icon(
                                              LineAwesomeIcons.map_marker,
                                              color: kBlueBackgroundColor,
                                              size: 40.h,
                                            ),
                                            onPressed: () {
                                              moveCamera(index);
                                            })
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Divider(
                                      height: 2.h,
                                    )
                                  ]),
                                );
                              },
                            ),
                          )
                        : Container(
                            height: 100.h,
                            child: Center(
                              child: Txt(
                                'No Results found!',
                                style: TxtStyle()
                                  ..textAlign.center()
                                  ..fontFamily('Avenir')
                                  ..fontWeight(FontWeight.w500)
                                  ..fontSize(27.sp)
                                  ..textColor(
                                    Color(0xFF7F869A),
                                  ),
                              ),
                            ),
                          );
                  });
                });
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _disposeController();
    super.dispose();
  }

  Future<void> _disposeController() async {
    final GoogleMapController controller = await _mapController.future;
    controller.dispose();
  }
}
