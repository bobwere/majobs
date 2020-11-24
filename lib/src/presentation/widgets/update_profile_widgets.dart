import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/update_user_profile_cubit/update_user_profile_cubit.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_form/smart_form.dart';

class UpdateBioField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UpdateUserProfileCubit updateUserProfileCubit =
        BlocProvider.of<UpdateUserProfileCubit>(context);

    return FutureBuilder(
        future: getBio(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ContainerResponsive(
                  height: 200,
                  padding: EdgeInsets.only(top: 25.h),
                  margin: EdgeInsets.symmetric(horizontal: 20.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.h),
                      boxShadow: [
                        BoxShadow(
                            color: kBoxShadowColor.shade400,
                            blurRadius: kBoxShadowBlur,
                            offset: kBoxShadowOffset)
                      ]),
                  child: SmartTextFormField(
                    initialValue: snapshot.data.toString(),
                    autovalidate: true,
                    maxLines: null,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(bottom: 27.h, left: 20.h),
                        hintText: 'Description about your business',
                        hintStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        border: InputBorder.none),
                    validator: RequiredValidator(
                        errorText:
                            '                please enter your description'),
                    onChanged: (value) {
                      updateUserProfileCubit.userBio(value);
                    },
                  ),
                )
              : ContainerResponsive(height: 200);
        });
  }

  Future<String> getBio() async {
    String str;
    final pref = await SharedPreferences.getInstance();
    str = pref.getString(USER_BIO) ?? '';
    return str;
  }
}

class UpdateUsernameField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UpdateUserProfileCubit updateUserProfileCubit =
        BlocProvider.of<UpdateUserProfileCubit>(context);

    return FutureBuilder(
        future: getUsername(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ContainerResponsive(
                  height: 55,
                  padding: EdgeInsets.only(top: 25.h),
                  margin: EdgeInsets.symmetric(horizontal: 20.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.h),
                      boxShadow: [
                        BoxShadow(
                            color: kBoxShadowColor.shade400,
                            blurRadius: kBoxShadowBlur,
                            offset: kBoxShadowOffset)
                      ]),
                  child: SmartTextFormField(
                    initialValue: snapshot.data.toString(),
                    autovalidate: true,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(bottom: 27.h, left: 20.h),
                        hintText: 'Enter your username',
                        hintStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        border: InputBorder.none),
                    validator: RequiredValidator(
                        errorText:
                            '                please enter your username'),
                    onChanged: (value) {
                      updateUserProfileCubit.usernameChanged(value);
                    },
                  ),
                )
              : Container(height: 65.h);
        });
  }

  Future<String> getUsername() async {
    String str;
    final pref = await SharedPreferences.getInstance();
    str = pref.getString(USER_NAME);
    return str;
  }
}

class UpdatePhoneNumberField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UpdateUserProfileCubit updateUserProfileCubit =
        BlocProvider.of<UpdateUserProfileCubit>(context);

    return FutureBuilder<String>(
        future: getPhone(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ContainerResponsive(
                  height: 55,
                  padding: EdgeInsets.only(top: 25.h, right: 30.h),
                  margin: EdgeInsets.only(left: 10.h, right: 20.h),
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
                    maxLength: 9,
                    initialValue: snapshot.data.contains('+')
                        ? snapshot.data.substring(4)
                        : snapshot.data,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black54,
                        fontSize: 21.h,
                        fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(bottom: 7.h, left: 20.h),
                        hintText: 'Enter your phone number',
                        hintStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        border: InputBorder.none),
                    onChanged: (value) {
                      updateUserProfileCubit.phoneChanged(value);
                    },
                  ),
                )
              : Container(height: 65.h);
        });
  }

  Future<String> getPhone() async {
    String str;
    final pref = await SharedPreferences.getInstance();
    str = pref.getString(USER_PHONE);
    return str;
  }
}

class UpdateCountryCodeField extends StatelessWidget {
  const UpdateCountryCodeField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UpdateUserProfileCubit updateUserProfileCubit =
        BlocProvider.of<UpdateUserProfileCubit>(context);

    return ContainerResponsive(
      height: 55,
      width: 100,
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      margin: EdgeInsets.only(left: 20.h, right: 10.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(5.h),
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
            updateUserProfileCubit.dialCodeChanged(countryCode.toString());
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

class UpdateLocationRegDropDown extends StatefulWidget {
  UpdateLocationRegDropDown({Key key, @required this.items}) : super(key: key);

  List<String> items;

  @override
  _UpdateLocationRegDropDownState createState() =>
      _UpdateLocationRegDropDownState();
}

class _UpdateLocationRegDropDownState extends State<UpdateLocationRegDropDown> {
  String location;

  @override
  Widget build(BuildContext context) {
    final UpdateUserProfileCubit updateUserProfileCubit =
        BlocProvider.of<UpdateUserProfileCubit>(context);

    return FutureBuilder(
        future: getLocation(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SmartFormField(builder: (state) {
              return Parent(
                  style: ParentStyle()
                    ..borderRadius(all: 5.h)
                    ..background.color(Colors.white)
                    ..height(55.h)
                    ..padding(bottom: 5.h, left: 20.h, right: 20.h)
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
                                  hint: TextResponsive(snapshot.data.toString(),
                                      style: TextStyle(
                                          fontSize: 21,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w400)),
                                  items: [...widget.items]
                                      .map((location) => DropdownMenuItem(
                                            value: location,
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: TextResponsive('$location',
                                                  style: TextStyle(
                                                      fontSize: 21,
                                                      color: Colors.black54,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      FocusScope.of(context)
                                          .requestFocus(new FocusNode());
                                      location = value;
                                    });

                                    updateUserProfileCubit
                                        .locationChanged(value);
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ));
            });
          } else {
            return Container(height: 65.h);
          }
        });
  }

  Future<String> getLocation() async {
    String str;
    final pref = await SharedPreferences.getInstance();
    str = pref.getString(USER_LOCATION);
    return str;
  }
}

class UpdateMultipleImagePicker extends StatefulWidget {
  UpdateMultipleImagePicker({Key key}) : super(key: key);

  @override
  _UpdateMultipleImagePickerState createState() =>
      _UpdateMultipleImagePickerState();
}

class _UpdateMultipleImagePickerState extends State<UpdateMultipleImagePicker> {
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
    final UpdateUserProfileCubit updateUserProfileCubit =
        BlocProvider.of<UpdateUserProfileCubit>(context);
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
      updateUserProfileCubit.workPhotosChanged(images);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SmartFormField(
        initialValue: [],
        builder: (state) {
          return Padding(
            padding: EdgeInsets.only(left: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.h),
                  child: GestureDetector(
                    onTap: () async {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      await loadAssets(context);
                    },
                    child: ContainerResponsive(
                        height: 100,
                        width: 100,
                        color: kBlueBackgroundColor,
                        child: Center(
                          child: TextResponsive(
                            'Add Photos Of Your Work',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
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
