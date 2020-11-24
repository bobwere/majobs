import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:division/division.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const kBlueBackgroundColor = Color(0xFF0095D8);
const kDarkBlueBackgroundColor = Color(0xFF407BD9);
const kGreenBackgroundColor = Color(0xFF07D054);
const kRedBackgroundColor = Color(0xFFF24343);

const kYellowStarColor = Color(0xFFE7711B);
const kBoxShadowColor = Colors.grey;
const kBoxShadowBlur = 3.0;
const kBoxShadowOffset = Offset(1, 1);

final List<Color> kPlaceHolderColors = [
  Color(0xFFBFC4C9),
  Color(0xFF809AB3),
  Color(0xFF6685A2),
  Color(0xFF809AB3),
  Color(0xFF4D7195),
  Color(0xFF325C84),
  Color(0xFF405A73),
  Color(0xFF33526F),
  Color(0xFF1B426B),
  Color(0xFF002951),
  Color(0xFF002448),
  Color(0xFF001F3C),
  Color(0xFF001A33),
];

final kUnitingTalentBackground = ParentStyle()
  ..height(60.h)
  ..background.color(kBlueBackgroundColor);

final kUnitingTalentTextStyle = TxtStyle()
  ..fontWeight(FontWeight.bold)
  ..fontSize(22.sp)
  ..textColor(Colors.white);

final kAppBarTxtStyle1 =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 28);

final kAppBarTxtStyle2 =
    TextStyle(color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 28);

final kOverviewTabButtonStyle = ParentStyle()
  ..height(65.h)
  ..width(65.h)
  ..borderRadius(all: 50.h)
  ..ripple(true,
      splashColor: kBlueBackgroundColor, highlightColor: kBlueBackgroundColor)
  ..background.color(Colors.white)
  ..boxShadow(
      color: kBoxShadowColor.shade400,
      blur: kBoxShadowBlur,
      offset: kBoxShadowOffset);

final kOverviewTabTextStyle =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black87);

final kSearchBarTextStyle = TextStyle(
    fontFamily: 'Avenir',
    fontSize: 20.sp,
    color: Colors.black87,
    fontWeight: FontWeight.w500);

final kSearchBarHintStyle = TextStyle(
    fontFamily: 'Avenir',
    fontSize: 20.sp,
    color: Colors.black87,
    fontWeight: FontWeight.w500);

final timeTextStyle = TextStyle(
  color: Color(0xFF6A6B6C),
  fontSize: 20,
  fontWeight: FontWeight.w500,
);

final notMetimeTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.w500,
);

final kMessageHeadingTextStyle = TextStyle(
  color: Color(0xFF6A6B6C),
  fontSize: 20,
  fontWeight: FontWeight.w500,
);

final kMessageBodyTextStyle = TextStyle(
  color: Color(0xFF6A6B6C),
  fontSize: 20,
  fontWeight: FontWeight.w400,
);

final kNotMeMessageBodyTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.w400,
);

final kNotMeMessageHeadingTextStyle = TextStyle(
  color: Color(0xFF6A6B6C),
  fontSize: 20,
  fontWeight: FontWeight.w500,
);

final kMessageBookingDateTimeStyle = TextStyle(
  color: Color(0xFF6A6B6C),
  fontSize: 20,
  fontWeight: FontWeight.w400,
);

final kMessageAcceptDenyTextSytle = TextStyle(
  color: Colors.white,
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

final kServerOrNotMeMessageBoxDecoration = BoxDecoration(
  color: Color(0xFFF6F7F8),
  borderRadius: BorderRadius.all(
    Radius.circular(10.h),
  ),
);

final isMeBorderRadius = BorderRadius.all(
  Radius.circular(10.h),
);

final isNotMeBorderRadius = BorderRadius.all(
  Radius.circular(10.h),
);

Flushbar flushbarLoginSuccess = Flushbar(
  title: 'Login Successful',
  message: 'Welcome Back',
  margin: EdgeInsets.all(20.h),
  flushbarPosition: FlushbarPosition.TOP,
  duration: Duration(seconds: 3),
  isDismissible: true,
  backgroundColor: Colors.green,
  borderRadius: 15.h,
);

Flushbar flushbarLoginAttempt = Flushbar(
  title: 'Attempting to login',
  message: 'Please wait a moment...',
  margin: EdgeInsets.all(20.h),
  flushbarPosition: FlushbarPosition.TOP,
  duration: Duration(seconds: 3),
  isDismissible: true,
  backgroundColor: Colors.green,
  borderRadius: 15.h,
);

Flushbar flushbarServerFailure = Flushbar(
  title: 'An Error Occurred',
  message: SERVER_ERROR_MESSAGE,
  margin: EdgeInsets.all(20.h),
  flushbarPosition: FlushbarPosition.TOP,
  duration: Duration(seconds: 3),
  isDismissible: true,
  backgroundColor: Color(0xFFFD9726),
  borderRadius: 15.h,
);

Flushbar flushbarNoInternet = Flushbar(
  title: 'An Error Occurred',
  message: NO_INTERNET_MESSAGE,
  margin: EdgeInsets.all(20.h),
  flushbarPosition: FlushbarPosition.TOP,
  duration: Duration(seconds: 3),
  isDismissible: true,
  backgroundColor: Color(0xFFFD9726),
  borderRadius: 15.h,
);

Flushbar flushbarUserNotFound = Flushbar(
  title: 'An Error Occurred',
  message: USER_NOT_FOUND,
  margin: EdgeInsets.all(20.h),
  flushbarPosition: FlushbarPosition.TOP,
  duration: Duration(seconds: 3),
  isDismissible: true,
  backgroundColor: Color(0xFFFD9726),
  borderRadius: 15.h,
);

Flushbar flushbarUnableToLogin = Flushbar(
  title: 'Unable to login',
  message: 'Provide the missing details to proceed',
  margin: EdgeInsets.all(20.h),
  flushbarPosition: FlushbarPosition.TOP,
  duration: Duration(seconds: 3),
  isDismissible: true,
  backgroundColor: Color(0xFFFD9726),
  borderRadius: 15.h,
);

Flushbar flushbarRegistrationSuccess = Flushbar(
  title: 'Registration Successful',
  message: 'Welcome to Majobs',
  margin: EdgeInsets.all(20.h),
  flushbarPosition: FlushbarPosition.TOP,
  duration: Duration(seconds: 3),
  isDismissible: true,
  backgroundColor: Colors.green,
  borderRadius: 15.h,
);

Flushbar flushbarRegistrationAttempt = Flushbar(
  title: 'Attempting to register you',
  message: 'Please wait a moment...',
  margin: EdgeInsets.all(20.h),
  flushbarPosition: FlushbarPosition.TOP,
  duration: Duration(seconds: 3),
  isDismissible: true,
  backgroundColor: Colors.green,
  borderRadius: 15.h,
);

Flushbar flushbarPasswordNotMatching = Flushbar(
  title: 'Unable to register you',
  message: 'your passwords dont match',
  margin: EdgeInsets.all(20.h),
  flushbarPosition: FlushbarPosition.TOP,
  duration: Duration(seconds: 3),
  isDismissible: true,
  backgroundColor: Color(0xFFFD9726),
  borderRadius: 15.h,
);

Flushbar flushbarMissingDetail = Flushbar(
  title: 'Unable to register you',
  message: 'Provide the missing details to proceed',
  margin: EdgeInsets.all(20.h),
  flushbarPosition: FlushbarPosition.TOP,
  duration: Duration(seconds: 3),
  isDismissible: true,
  backgroundColor: Color(0xFFFD9726),
  borderRadius: 15.h,
);

Flushbar flushbarUpdateProfile = Flushbar(
  title: 'Successfully updated your profile',
  message: ' ',
  margin: EdgeInsets.all(20.h),
  flushbarPosition: FlushbarPosition.TOP,
  duration: Duration(seconds: 3),
  isDismissible: true,
  backgroundColor: Colors.green,
  borderRadius: 15.h,
);

Flushbar flushbarSubmittingDetails = Flushbar(
  title: 'Attempting to submit your details',
  message: 'Please wait a moment...',
  margin: EdgeInsets.all(20.h),
  flushbarPosition: FlushbarPosition.TOP,
  duration: Duration(seconds: 3),
  isDismissible: true,
  backgroundColor: Colors.green,
  borderRadius: 15.h,
);
