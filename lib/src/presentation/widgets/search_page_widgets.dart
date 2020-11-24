import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/search_cubit/search_cubit.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import '../../../common/constants/style.dart';

final CameraPosition nrbCBD = CameraPosition(
  target: LatLng(-1.286389, 36.817223),
  zoom: 14,
);

class RatingDropDown extends StatefulWidget {
  RatingDropDown({Key key, @required this.items}) : super(key: key);
  List<String> items;

  @override
  _RatingDropDownState createState() => _RatingDropDownState();
}

class _RatingDropDownState extends State<RatingDropDown> {
  String rating;
  @override
  Widget build(BuildContext context) {
    SearchCubit searchCubit = BlocProvider.of<SearchCubit>(context);
    return Parent(
      style: ParentStyle()
        ..borderRadius(all: 5)
        ..background.color(Colors.white)
        ..boxShadow(
            color: kBoxShadowColor,
            blur: kBoxShadowBlur,
            offset: kBoxShadowOffset)
        ..height(55.h)
        ..padding(left: 10.h)
        ..ripple(true),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            value: rating,
            isExpanded: true,
            hint: TextResponsive("Rated",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.w400)),
            items: [...widget.items]
                .map((rating) => DropdownMenuItem(
                      value: rating,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('$rating',
                            style: TextStyle(
                                fontSize: 21.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.w400)),
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                rating = value;
              });
              searchCubit.ratingChanged(value);
            }),
      ),
    );
  }
}
