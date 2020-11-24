import 'dart:io';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/registration_cubit/registration_cubit.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:smart_form/smart_form.dart';

class BonyezaPhoneRegistrationField extends StatelessWidget {
  const BonyezaPhoneRegistrationField(
      {Key key,
      @required this.hintText,
      @required this.onChanged,
      this.obscureText = false,
      this.maxLength,
      @required this.validationErrorText})
      : super(key: key);

  final String hintText;
  final Function(String value) onChanged;
  final String validationErrorText;
  final bool obscureText;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return ContainerResponsive(
      widthResponsive: false,
      margin: EdgeInsetsResponsive.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100.h),
          boxShadow: [
            BoxShadow(
                color: kBoxShadowColor.shade400,
                blurRadius: kBoxShadowBlur,
                offset: kBoxShadowOffset)
          ]),
      child: SmartTextFormField(
          autovalidate: true,
          obscureText: obscureText,
          textAlign: TextAlign.left,
          maxLength: 9,
          style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black54,
              fontSize: 14,
              fontWeight: FontWeight.w400),
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(top: 20.h, bottom: 20.h, left: 20.h),
              isDense: true,
              hintText: hintText,
              errorStyle: TextStyle(height: 0),
              hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              border: InputBorder.none),
          validator: RequiredValidator(errorText: ''),
          onChanged: (value) => onChanged(value)),
    );
  }
}

class BonyezaRegistrationField extends StatelessWidget {
  const BonyezaRegistrationField(
      {Key key,
      @required this.hintText,
      @required this.onChanged,
      this.obscureText = false,
      @required this.validationErrorText})
      : super(key: key);

  final String hintText;
  final Function(String value) onChanged;
  final String validationErrorText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return ContainerResponsive(
      height: 55,
      widthResponsive: false,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsetsResponsive.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100.h),
          boxShadow: [
            BoxShadow(
                color: kBoxShadowColor.shade400,
                blurRadius: kBoxShadowBlur,
                offset: kBoxShadowOffset)
          ]),
      child: SmartTextFormField(
        autovalidate: true,
        obscureText: obscureText,
        textAlign: TextAlign.left,
        style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black54,
            fontSize: 14,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 15.h, left: 20.h),
            isDense: true,
            hintText: hintText,
            errorStyle: TextStyle(height: 0),
            hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            border: InputBorder.none),
        validator: RequiredValidator(errorText: ''),
        onChanged: (value) => onChanged(value),
      ),
    );
  }
}

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({Key key, this.onTextPressed}) : super(key: key);

  final Function onTextPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RaisedButtonResponsive(
        splashColor: Colors.white,
        highlightColor: Colors.white,
        hoverColor: Colors.white,
        highlightElevation: 0,
        hoverElevation: 0,
        elevation: 0,
        child: Center(
          child: RichText(
            text: TextSpan(
                text: 'Already have an account?',
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w400),
                children: <TextSpan>[
                  TextSpan(
                    text: ' Sign in',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w800),
                  )
                ]),
          ),
        ),
        color: Colors.white,
        onPressed: this.onTextPressed,
      ),
    );
  }
}

class LocationRegDropDown extends StatefulWidget {
  LocationRegDropDown({Key key, @required this.items}) : super(key: key);
  List<String> items;

  @override
  _LocationRegDropDownState createState() => _LocationRegDropDownState();
}

class _LocationRegDropDownState extends State<LocationRegDropDown> {
  String location;
  @override
  Widget build(BuildContext context) {
    RegistrationCubit registrationCubit =
        BlocProvider.of<RegistrationCubit>(context);
    return SmartFormField(
        autovalidate: true,
        validator: (value) {
          if (value == null) return 'please select a location';
        },
        builder: (state) {
          return Parent(
              style: ParentStyle()
                ..borderRadius(all: 100.h)
                ..background.color(Colors.white)
                ..height(55.h)
                ..padding(left: 20.h, right: 20.h)
                ..margin(horizontal: 20.h)
                ..ripple(true)
                ..boxShadow(
                    color: kBoxShadowColor.shade400,
                    blur: kBoxShadowBlur,
                    offset: kBoxShadowOffset),
              child: Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              value: location,
                              isExpanded: true,
                              hint: TextResponsive("Location",
                                  style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54)),
                              items: [...widget.items]
                                  .map((location) => DropdownMenuItem(
                                        value: location,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: TextResponsive('$location',
                                              style: TextStyle(
                                                  fontSize: 21,
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.w400)),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                  location = value;
                                });
                                state.didChange(location);
                                state.validate();
                                registrationCubit.locationChanged(value);
                              }),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      height: 70.h,
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(left: 50.h),
                      child: Text(
                        state.errorText ?? ' ',
                        style: TextStyle(
                            color: Theme.of(context).errorColor, fontSize: 12),
                      ))
                ],
              ));
        });
  }
}

class CountryCodeField extends StatelessWidget {
  const CountryCodeField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegistrationCubit registrationCubit =
        BlocProvider.of<RegistrationCubit>(context);

    return ContainerResponsive(
      height: 55,
      widthResponsive: false,
      width: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      margin: EdgeInsets.only(left: 20.h, right: 10.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(100.h),
          boxShadow: [
            BoxShadow(
                color: kBoxShadowColor.shade400,
                blurRadius: kBoxShadowBlur,
                offset: kBoxShadowOffset)
          ]),
      child: Center(
        child: CountryCodePicker(
          onChanged: (CountryCode countryCode) {
            FocusScope.of(context).requestFocus(new FocusNode());
            registrationCubit.dialCodeChanged(countryCode.toString());
          },
          initialSelection: '+254',
          textStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black54),
          favorite: ['+255', '+256'],
          showFlag: false,
          showCountryOnly: false,
          showOnlyCountryWhenClosed: false,
          alignLeft: false,
        ),
      ),
    );
  }
}

class MultipleImagePicker extends StatefulWidget {
  MultipleImagePicker({Key key}) : super(key: key);

  @override
  _MultipleImagePickerState createState() => _MultipleImagePickerState();
}

class _MultipleImagePickerState extends State<MultipleImagePicker> {
  List<Asset> images = List<Asset>();

  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView(BuildContext context) {
    return SizedBox(
      height: images.length == 0 ? 0.h : 120.h,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 20.h),
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          Asset asset = images[index];
          return Container(
            margin: EdgeInsets.only(right: 20.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.h),
              child: Container(
                child: AssetThumb(
                  asset: asset,
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
    final RegistrationCubit registrationCubit =
        BlocProvider.of<RegistrationCubit>(context);
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
      registrationCubit.workPhotosChanged(images);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SmartFormField(
        initialValue: [],
        autovalidate: true,
        validator: (value) {
          if (value.length < 2) return 'add atleast two photos of your work';
        },
        builder: (state) {
          return Padding(
            padding: EdgeInsets.only(left: 20.h),
            child: Column(
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.h),
                  child: GestureDetector(
                    onTap: () async {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      await loadAssets(context);
                      state.didChange(images);
                      state.validate();
                    },
                    child: Container(
                        height: 100.h,
                        width: 100.h,
                        color: kBlueBackgroundColor,
                        child: Center(
                          child: TextResponsive(
                            'Add Photos Of Your Work',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 21,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        )),
                  ),
                ),
                buildGridView(context)
              ],
            ),
          );
        });
  }
}

class ProfileImagePicker extends StatefulWidget {
  ProfileImagePicker({Key key}) : super(key: key);

  @override
  _ProfileImagePickerState createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  File _image;
  final picker = ImagePicker();

  Future<void> getImage(BuildContext context) async {
    final RegistrationCubit registrationCubit =
        BlocProvider.of<RegistrationCubit>(context);
    PickedFile pickedFile;
    try {
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    } on Exception catch (e) {
      print(e.toString());
    }
    if (!mounted) return;

    setState(() {
      _image = File(pickedFile.path);
    });
    registrationCubit.photoChanged(_image);
  }

  @override
  Widget build(BuildContext context) {
    return SmartFormField(
        autovalidate: true,
        validator: (value) {
          if (value == null) return 'please add a photo';
        },
        builder: (SmartFormFieldState<File> state) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.h),
                child: GestureDetector(
                  onTap: () async {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    await getImage(context);
                    state.didChange(_image);
                    state.validate();
                  },
                  child: ContainerResponsive(
                      height: 100,
                      width: 100,
                      color: kBlueBackgroundColor,
                      child: _image == null
                          ? Center(
                              child: TextResponsive(
                                'Add Profile Photo',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 21,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          : Image.file(_image, fit: BoxFit.cover)),
                ),
              ),
              Expanded(
                  child: ContainerResponsive(
                      height: 70,
                      padding: EdgeInsets.only(top: 25.h),
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.symmetric(horizontal: 20.h),
                      child: TextResponsive(
                        state.errorText ?? '',
                        style: TextStyle(
                            color: Theme.of(context).errorColor, fontSize: 20),
                      ))),
            ],
          );
        });
  }
}

class SubmittingOverlay extends StatelessWidget {
  final bool isSubmitting;

  const SubmittingOverlay({
    Key key,
    @required this.isSubmitting,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isSubmitting,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        color:
            isSubmitting ? Colors.black.withOpacity(0.2) : Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
