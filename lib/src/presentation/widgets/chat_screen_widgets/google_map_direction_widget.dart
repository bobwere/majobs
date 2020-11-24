import 'dart:async';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:responsive_widgets/responsive_widgets.dart';

class DirectionToClient extends StatefulWidget {
  DirectionToClient({
    Key key,
    @required this.sPLocationData,
    @required this.clientLatData,
    @required this.clientLngData,
  }) : super(key: key);
  final loc.LocationData sPLocationData;
  final double clientLatData;
  final double clientLngData;

  @override
  _DirectionToClientState createState() => _DirectionToClientState();
}

class _DirectionToClientState extends State<DirectionToClient> {
  final Set<Polyline> polyline = {};
  Completer<GoogleMapController> _mapController = Completer();
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  @override
  void initState() {
    super.initState();
    _addMarker(
        LatLng(widget.sPLocationData.latitude, widget.sPLocationData.longitude),
        "origin",
        BitmapDescriptor.defaultMarker);
    _addMarker(LatLng(widget.clientLatData, widget.clientLngData),
        "destination", BitmapDescriptor.defaultMarkerWithHue(275));
    _getPolyline();
  }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        width: 5,
        polylineId: id,
        color: kBlueBackgroundColor,
        points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

  _getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      GOOGLE_MAP_API_KEY,
      PointLatLng(
          widget.sPLocationData.latitude, widget.sPLocationData.longitude),
      PointLatLng(widget.clientLatData, widget.clientLngData),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 3.h,
          title: TextResponsive('Directions', style: kAppBarTxtStyle1),
          centerTitle: true,
        ),
        body: GoogleMap(
          onMapCreated: onMapCreated,
          myLocationEnabled: true,
          tiltGesturesEnabled: true,
          compassEnabled: true,
          scrollGesturesEnabled: true,
          zoomGesturesEnabled: true,
          initialCameraPosition: CameraPosition(
            zoom: 14,
            target: LatLng(widget.sPLocationData.latitude,
                widget.sPLocationData.longitude),
          ),
          markers: Set<Marker>.of(markers.values),
          polylines: Set<Polyline>.of(polylines.values),
          mapType: MapType.normal,
        ));
  }

  void onMapCreated(GoogleMapController controller) {
    _mapController.complete(controller);
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
