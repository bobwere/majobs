import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/common/routes/router.gr.dart';
import 'package:bonyeza_kazi/src/application/chat/instant_messaging_cubit/instant_messaging_cubit.dart';
import 'package:bonyeza_kazi/src/application/job_journey/client_job_description_cubit/job_description_cubit.dart';
import 'package:bonyeza_kazi/src/infrastructure/categories/models/service_provider_search_model.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/onboarding_page_widgets.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/registration_page_widgets.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/service_provider_detail_page_widgets/booking_page_widgets.dart';
import 'package:bonyeza_kazi/src/services/get_client_sp_chatroom.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:loading_indicator/loading_indicator.dart' as load;
import 'package:location/location.dart' as loc;
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:smart_form/smart_form.dart';
import 'package:uuid/uuid.dart';

class BookingPage extends StatefulWidget {
  const BookingPage(
      {Key key,
      @required this.serviceProvider,
      @required this.locationData,
      @required this.userLocation})
      : super(key: key);
  final ServiceProvider serviceProvider;
  final loc.LocationData locationData;
  final String userLocation;

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  GlobalKey<SmartFormState> _formKey = GlobalKey<SmartFormState>();
  Completer<GoogleMapController> _mapController = Completer();
  TextEditingController searchTextController = TextEditingController();
  String userName;
  String searchSelectedLocation;
  String searchPlaceID;
  var uuid = Uuid();
  String _sessionToken;
  bool getSuggestions = true;
  List<dynamic> _placeList = [];
  Prediction prediction;
  String nameofTypedLocation;
  LatLng _locationData;

  @override
  void initState() {
    super.initState();
    _locationData =
        LatLng(widget.locationData.latitude, widget.locationData.longitude);
    searchSelectedLocation = widget.userLocation;
    searchTextController.text = searchSelectedLocation;
    getUserName();
    searchTextController.addListener(() {
      _onChanged();
    });
  }

  void _onChanged() async {
    if (_sessionToken == null) {
      setState(() {
        _sessionToken = uuid.v4();
      });
    }
    if (getSuggestions) await getSuggestion(searchTextController.text);
  }

  Future<void> getSuggestion(String input) async {
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$GOOGLE_MAP_API_KEY&sessiontoken=$_sessionToken';
    var response = await http.get(request);
    if (response.statusCode == 200) {
      setState(() {
        _placeList = json.decode(response.body)['predictions'];
      });
    } else {
      throw Exception('Failed to load predictions');
    }
  }

  Future<void> getLatLng(String predictionPlace) async {
    GoogleMapsPlaces places = GoogleMapsPlaces(apiKey: GOOGLE_MAP_API_KEY);

    PlacesDetailsResponse detail =
        await places.getDetailsByPlaceId(predictionPlace);

    double latofTypedLocation = detail.result.geometry.location.lat;

    double lngofTypedLocation = detail.result.geometry.location.lng;

    LatLng newLocationData = LatLng(latofTypedLocation, lngofTypedLocation);
    setState(() {
      _locationData = newLocationData;
    });
  }

  Future<String> getPlacemark() async {
    List<Placemark> data = await placemarkFromCoordinates(
        _locationData.latitude, _locationData.longitude);
    var mlocation = '${data[0].administrativeArea} ${data[0].subLocality}';
    return mlocation;
  }

  Future<void> _moveCamera(LatLng _locationData) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: _locationData, zoom: 14.0, bearing: 45.0, tilt: 45.0)));
  }

  @override
  Widget build(BuildContext context) {
    JobDescriptionCubit jobDescriptionCubit =
        BlocProvider.of<JobDescriptionCubit>(context);
    GetChatroomService getChatroomService =
        Provider.of<GetChatroomService>(context);
    InstantMessagingCubit instantMessagingCubit =
        BlocProvider.of<InstantMessagingCubit>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlueBackgroundColor,
        elevation: 3.h,
        title: TextResponsive('Book Now', style: kAppBarTxtStyle1),
        centerTitle: true,
      ),
      body: BlocListener<JobDescriptionCubit, JobDescriptionState>(
        listener: (context, state) {
          state.bookingFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                failure.map(serverError: (_) {
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
                }, noInternet: (_) {
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
                });
              },
              (jobDescription) async {
                ExtendedNavigator.of(context).pop();
                Flushbar(
                  title: 'Enquiry Sent Successfully',
                  message:
                      'keep in touch with ${widget.serviceProvider.username} from your inbox',
                  margin: EdgeInsets.all(20.h),
                  flushbarPosition: FlushbarPosition.TOP,
                  duration: Duration(seconds: 4),
                  isDismissible: true,
                  backgroundColor: Colors.green,
                  borderRadius: 15.h,
                ).show(context);
              },
            ),
          );
        },
        child: Stack(
          children: [
            SmartForm(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBoxResponsive(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsetsResponsive.only(left: 20),
                      child: TextResponsive(
                        'Description',
                        style: TextStyle(
                            color: Color(0xFF3B4141),
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBoxResponsive(height: 10),
                  BookingDescriptionField(),
                  BookingMultipleImagePicker(),
                  SizedBoxResponsive(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsetsResponsive.only(left: 20),
                      child: TextResponsive(
                        'When and where do you want the service?',
                        style: TextStyle(
                            color: Color(0xFF3B4141),
                            fontSize: 21,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBoxResponsive(height: 10),
                  Padding(
                    padding: EdgeInsetsResponsive.symmetric(horizontal: 20),
                    child: TextField(
                      controller: searchTextController,
                      autocorrect: false,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                  _placeList.length != 0
                      ? ContainerResponsive(
                          height: 300,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _placeList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () async {
                                  getSuggestions = false;
                                  searchTextController.text =
                                      _placeList[index]["description"];
                                  getSuggestions = true;
                                  searchSelectedLocation =
                                      _placeList[index]["description"];
                                  searchPlaceID = _placeList[index]["place_id"];

                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  setState(() {
                                    _placeList.clear();
                                  });

                                  await getLatLng(searchPlaceID);

                                  await _moveCamera(_locationData);
                                },
                                child: ListTile(
                                  dense: true,
                                  title: TextResponsive(
                                    _placeList[index]["description"],
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 21,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : Container(),
                  SizedBoxResponsive(height: 10),
                  PlaceDescriptionField(),
                  SizedBoxResponsive(height: 10),
                  ContainerResponsive(
                    height: 200,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      compassEnabled: true,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                            _locationData.latitude, _locationData.longitude),
                        zoom: 12,
                      ),
                      myLocationButtonEnabled: true,
                      myLocationEnabled: true,
                      onMapCreated: (GoogleMapController controller) {
                        _mapController.complete(controller);
                      },
                      onTap: (newPosition) async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        var _newlocationData =
                            LatLng(newPosition.latitude, newPosition.longitude);
                        _locationData = _newlocationData;
                        var newLocation = await getPlacemark();
                        var myNewLocation = newLocation;
                        getSuggestions = false;
                        searchTextController.text = myNewLocation;
                        setState(() {
                          _locationData = _newlocationData;
                          searchSelectedLocation = myNewLocation;
                        });

                        await _moveCamera(_locationData);

                        jobDescriptionCubit.locationChanged(newLocation);
                        getSuggestions = true;
                      },
                      markers: {
                        Marker(
                          markerId: MarkerId('user'),
                          draggable: false,
                          position: LatLng(
                              _locationData.latitude, _locationData.longitude),
                        )
                      },
                    ),
                  ),
                  SizedBoxResponsive(height: 20),
                  Row(
                    children: [
                      Expanded(child: BookingDatePicker()),
                      SizedBoxResponsive(width: 5),
                      Expanded(child: BookingTimePicker()),
                    ],
                  ),
                  SizedBoxResponsive(height: 20),
                  BonyezaButton(
                    backGroundColor: kGreenBackgroundColor,
                    textColor: Colors.white,
                    text: "ENQUIRE",
                    onButtonPressed: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      final _pref = await SharedPreferences.getInstance();
                      String userTypeID = _pref.getString(USER_TYPE_ID);
                      if (userTypeID == '4') {
                        Flushbar(
                          title: 'Unable to make a booking',
                          message: 'Login as a client to book services',
                          margin: EdgeInsets.all(20.h),
                          flushbarPosition: FlushbarPosition.TOP,
                          duration: Duration(seconds: 3),
                          isDismissible: true,
                          backgroundColor: Color(0xFFFD9726),
                          borderRadius: 15.h,
                        ).show(context);
                      } else {
                        if (_formKey.currentState.validate()) {
                          jobDescriptionCubit
                              .workerIDChanged(widget.serviceProvider.id);
                          jobDescriptionCubit.workerImageURLChanged(
                              widget.serviceProvider.photo);
                          jobDescriptionCubit.workTitleChanged(
                              '${widget.serviceProvider.username}_$userName');
                          jobDescriptionCubit
                              .latChanged(_locationData.latitude);
                          jobDescriptionCubit
                              .lngChanged(_locationData.longitude);
                          jobDescriptionCubit
                              .locationChanged(searchSelectedLocation);
                          jobDescriptionCubit.workerNameChanged(
                              widget.serviceProvider.username);
                          jobDescriptionCubit.clientJobDescriptionSubmission();
                        } else {
                          Flushbar(
                            title: 'Unable to make a booking',
                            message: 'Provide the missing details to proceed',
                            margin: EdgeInsets.all(20.h),
                            flushbarPosition: FlushbarPosition.TOP,
                            duration: Duration(seconds: 3),
                            isDismissible: true,
                            backgroundColor: Color(0xFFFD9726),
                            borderRadius: 15.h,
                          ).show(context);
                        }
                      }
                    },
                    borderRadius: 5,
                  ),
                  SizedBoxResponsive(height: 20),
                ]),
              ),
            ),
            Positioned(
              bottom: 215.h,
              left: 220.w,
              child: BlocBuilder<JobDescriptionCubit, JobDescriptionState>(
                builder: (context, state) {
                  if (state.isSubmitting) {
                    return Container(
                      height: 50.h,
                      width: 50.h,
                      child: load.LoadingIndicator(
                          indicatorType: load.Indicator.ballTrianglePath,
                          color: kBlueBackgroundColor),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            BlocBuilder<JobDescriptionCubit, JobDescriptionState>(
              builder: (context, state) {
                if (state.isSubmitting) {
                  return SubmittingOverlay(isSubmitting: state.isSubmitting);
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  getUserName() async {
    final _pref = await SharedPreferences.getInstance();
    userName = _pref.getString(USER_NAME);
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
