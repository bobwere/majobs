import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/job_journey/client_job_description_cubit/job_description_cubit.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:smart_form/smart_form.dart';

class BookingTitleField extends StatelessWidget {
  const BookingTitleField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JobDescriptionCubit clientJobDescriptonCubit =
        BlocProvider.of<JobDescriptionCubit>(context);
    return Container(
      height: 65.h,
      padding: EdgeInsets.only(top: 25.h),
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(15.h),
          boxShadow: [
            BoxShadow(
                color: kBoxShadowColor.shade400,
                blurRadius: kBoxShadowBlur,
                offset: kBoxShadowOffset)
          ]),
      child: SmartTextFormField(
        autovalidate: true,
        style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black54,
            fontSize: 21.h,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 25.h, left: 25.h),
            helperText: ' ',
            hintText: 'work title e.g. Plumbing Kitchen',
            hintStyle: TextStyle(fontSize: 21.h, fontWeight: FontWeight.w400),
            border: InputBorder.none),
        validator: RequiredValidator(errorText: 'please enter a title'),
        onChanged: (value) {
          clientJobDescriptonCubit.workTitleChanged(value);
        },
      ),
    );
  }
}

class BookingDescriptionField extends StatelessWidget {
  const BookingDescriptionField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JobDescriptionCubit clientJobDescriptonCubit =
        BlocProvider.of<JobDescriptionCubit>(context);
    return Container(
      height: 100.h,
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(5.h),
          boxShadow: [
            BoxShadow(
                color: kBoxShadowColor.shade400,
                blurRadius: kBoxShadowBlur,
                offset: kBoxShadowOffset)
          ]),
      child: SmartTextFormField(
        autovalidate: true,
        maxLines: null,
        style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black54,
            fontSize: 14,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10.h, 20.h, 25.h, 20.h),
            helperText: ' ',
            hintText: 'Describe work to be done...',
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
            border: InputBorder.none),
        validator:
            RequiredValidator(errorText: 'please enter your description'),
        onChanged: (value) {
          clientJobDescriptonCubit.descriptionChanged(value);
        },
      ),
    );
  }
}

class PlaceDescriptionField extends StatelessWidget {
  const PlaceDescriptionField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JobDescriptionCubit clientJobDescriptonCubit =
        BlocProvider.of<JobDescriptionCubit>(context);
    return Container(
      height: 55.h,
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(5.h),
          boxShadow: [
            BoxShadow(
                color: kBoxShadowColor.shade400,
                blurRadius: kBoxShadowBlur,
                offset: kBoxShadowOffset)
          ]),
      child: SmartTextFormField(
        autovalidate: true,
        maxLines: 1,
        style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black54,
            fontSize: 14,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10.h, 0.h, 20.h, 20.h),
            hintText: 'Floor, door, and other notes for the worker',
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
            border: InputBorder.none),
        onChanged: (value) {
          clientJobDescriptonCubit.placeDescriptionChanged(value);
        },
      ),
    );
  }
}

class BookingMultipleImagePicker extends StatefulWidget {
  BookingMultipleImagePicker({Key key}) : super(key: key);

  @override
  _BookingMultipleImagePickerState createState() =>
      _BookingMultipleImagePickerState();
}

class _BookingMultipleImagePickerState
    extends State<BookingMultipleImagePicker> {
  List<Asset> images;

  @override
  void initState() {
    super.initState();
    images = [];
  }

  Widget buildGridView(BuildContext context) {
    return SizedBox(
      height: images.length == 0 ? 0.h : 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          Asset asset = images[index];
          return ContainerResponsive(
            margin: EdgeInsets.only(right: 20.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.h),
              child: ContainerResponsive(
                child: AssetThumb(
                  asset: asset,
                  spinner: Center(
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> loadAssets(BuildContext context) async {
    JobDescriptionCubit clientJobDescriptonCubit =
        BlocProvider.of<JobDescriptionCubit>(context);
    List<Asset> resultList = List<Asset>();

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 8,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#0095D8",
          actionBarTitle: "Select Images",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#0095D8",
        ),
      );
    } on Exception catch (e) {}

    if (!mounted) return;

    setState(() {
      images = resultList;
      clientJobDescriptonCubit.workTodoPhotosChanged(images);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SmartFormField(
        initialValue: [],
        autovalidate: true,
        validator: (value) {
          if (value.length == 0) return 'please add atleast one photo';
        },
        builder: (state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  state.errorText ?? '',
                  style: TextStyle(
                      color: Theme.of(context).errorColor, fontSize: 12),
                ),
              ),
              Padding(
                padding: EdgeInsetsResponsive.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.h),
                      child: GestureDetector(
                        onTap: () async {
                          await loadAssets(context);
                          state.didChange(images);
                          state.validate();
                        },
                        child: ContainerResponsive(
                            height: 100,
                            width: 100,
                            color: kBlueBackgroundColor,
                            child: Center(
                              child: TextResponsive(
                                'Add Photos',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 21,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            )),
                      ),
                    ),
                    SizedBoxResponsive(
                      width: 20,
                    ),
                    Expanded(child: buildGridView(context))
                  ],
                ),
              ),
            ],
          );
        });
  }
}

class BookingDatePicker extends StatelessWidget {
  const BookingDatePicker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JobDescriptionCubit clientJobDescriptonCubit =
        BlocProvider.of<JobDescriptionCubit>(context);
    return Container(
        height: 55.h,
        margin: EdgeInsets.symmetric(horizontal: 20.h),
        padding: EdgeInsets.only(left: 15.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(5.h),
          boxShadow: [
            BoxShadow(
                color: kBoxShadowColor.shade400,
                blurRadius: kBoxShadowBlur,
                offset: kBoxShadowOffset)
          ],
        ),
        child: Row(
          children: [
            Icon(
              Icons.calendar_today,
              color: Colors.black54,
              size: 20,
            ),
            SizedBoxResponsive(width: 10),
            Expanded(
              child: DateTimePicker(
                style: TextStyle(color: Colors.black54),
                decoration: InputDecoration(
                  contentPadding: EdgeInsetsResponsive.only(bottom: 15),
                  border: InputBorder.none,
                ),
                type: DateTimePickerType.date,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                dateMask: 'yyyy/MM/dd',
                initialValue: DateTime.now().toString(),
                onChanged: (val) {
                  clientJobDescriptonCubit.bookingDateChanged(val);
                },
              ),
            ),
          ],
        ));
  }
}

class BookingTimePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    JobDescriptionCubit clientJobDescriptonCubit =
        BlocProvider.of<JobDescriptionCubit>(context);
    return Container(
        height: 55.h,
        margin: EdgeInsets.symmetric(horizontal: 20.h),
        padding: EdgeInsets.only(left: 15.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(5.h),
          boxShadow: [
            BoxShadow(
                color: kBoxShadowColor.shade400,
                blurRadius: kBoxShadowBlur,
                offset: kBoxShadowOffset)
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.query_builder,
              color: Colors.black54,
              size: 20,
            ),
            SizedBoxResponsive(width: 10),
            Expanded(
              child: DateTimePicker(
                use24HourFormat: false,
                style: TextStyle(color: Colors.black54),
                decoration: InputDecoration(
                  contentPadding: EdgeInsetsResponsive.only(bottom: 15),
                  border: InputBorder.none,
                ),
                type: DateTimePickerType.time,
                initialValue: DateFormat('HH:mm').format(DateTime.now()),
                onChanged: (val) {
                  clientJobDescriptonCubit.bookingTimeChanged(val);
                },
              ),
            ),
          ],
        ));
  }
}
