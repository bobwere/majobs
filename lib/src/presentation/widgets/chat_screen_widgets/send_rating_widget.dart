import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/auth_cubit/auth_cubit.dart';
import 'package:bonyeza_kazi/src/application/job_journey/client_rates_job_done_cubit/client_rates_job_done_cubit.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/chatroom_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/message_model.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/onboarding_page_widgets.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/registration_page_widgets.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:smart_form/smart_form.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:loading_indicator/loading_indicator.dart' as load;

class SendRatingWidget extends StatefulWidget {
  const SendRatingWidget(
      {Key key, this.chatRoom, this.isMe, this.message, this.userTypeID})
      : super(key: key);

  final Message message;
  final bool isMe;
  final ChatRoom chatRoom;
  final String userTypeID;

  @override
  _SendRatingWidgetState createState() => _SendRatingWidgetState();
}

class _SendRatingWidgetState extends State<SendRatingWidget> {
  final _formKey = GlobalKey<SmartFormState>();
  String review;
  TextEditingController reviewController;

  @override
  void initState() {
    reviewController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ClientRatesJobDoneCubit clientRatesJobDoneCubit =
        BlocProvider.of<ClientRatesJobDoneCubit>(context);

    return BlocConsumer<ClientRatesJobDoneCubit, ClientRatesJobDoneState>(
      listener: (context, cstate) {
        cstate.sendingFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold((failure) {
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
                }, (success) {
                  ExtendedNavigator.of(context).pop();
                  Flushbar(
                    title: 'Completed',
                    message: 'Rating Sent Successfully',
                    margin: EdgeInsets.all(20.h),
                    flushbarPosition: FlushbarPosition.TOP,
                    duration: Duration(seconds: 4),
                    isDismissible: true,
                    backgroundColor: Colors.green,
                    borderRadius: 15.h,
                  ).show(context);
                }));
      },
      builder: (context, cstate) {
        return BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return state.maybeMap(
                authenticated: (state) {
                  String userTypeId = state.userTypeId;
                  return Stack(
                    children: [
                      Scaffold(
                        appBar: AppBar(
                          title:
                              TextResponsive("Rating", style: kAppBarTxtStyle1),
                          centerTitle: true,
                          backgroundColor: kBlueBackgroundColor,
                          elevation: 3.h,
                        ),
                        body: Center(
                          child: SmartForm(
                            key: _formKey,
                            autovalidate: true,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextResponsive(
                                    userTypeId == '5'
                                        ? 'Rate the work done'
                                        : 'Rate your client',
                                    style: kAppBarTxtStyle2,
                                  ),
                                  TextResponsive('From 1 to 5 Star',
                                      style: kAppBarTxtStyle2),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  SmoothStarRating(
                                    starCount: 5,
                                    isReadOnly: false,
                                    size: 50.sp,
                                    allowHalfRating: true,
                                    rating: 0.0,
                                    color: kYellowStarColor,
                                    borderColor: kYellowStarColor,
                                    onRated: (value) {
                                      clientRatesJobDoneCubit
                                          .ratingChanged(value.toString());
                                    },
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsResponsive.symmetric(
                                        horizontal: 20),
                                    child: TextField(
                                      maxLines: null,
                                      controller: reviewController,
                                      onChanged: (value) {
                                        review = value;
                                        clientRatesJobDoneCubit
                                            .reviewChanged(value);
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Add your review',
                                        labelStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black54,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade400,
                                              width: 1.h,
                                              style: BorderStyle.solid),
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  BonyezaButton(
                                    backGroundColor: kGreenBackgroundColor,
                                    textColor: Colors.white,
                                    text: 'SUBMIT',
                                    onButtonPressed: () {
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      if (reviewController.text.isNotEmpty) {
                                        userTypeId == '5'
                                            ? clientRatesJobDoneCubit
                                                .clientRatesJobDone(
                                                    widget.message.workID,
                                                    widget.chatRoom,
                                                    widget.message)
                                            : clientRatesJobDoneCubit
                                                .workerRatesClient(
                                                    widget.message.workID,
                                                    widget.chatRoom,
                                                    widget.message);
                                      } else {
                                        Flushbar(
                                          title: 'An Error Occurred',
                                          message:
                                              'Please add a review to proceed',
                                          margin: EdgeInsets.all(20.h),
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                          duration: Duration(seconds: 3),
                                          isDismissible: true,
                                          backgroundColor: Color(0xFFFD9726),
                                          borderRadius: 15.h,
                                        ).show(context);
                                      }
                                    },
                                  ),
                                  SizedBox(height: 100.h),
                                  cstate.isSubmitting
                                      ? Center(
                                          child: Container(
                                            height: 50.h,
                                            width: 50.h,
                                            child: load.LoadingIndicator(
                                                indicatorType: load
                                                    .Indicator.ballTrianglePath,
                                                color: kBlueBackgroundColor),
                                          ),
                                        )
                                      : Container()
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SubmittingOverlay(isSubmitting: cstate.isSubmitting)
                    ],
                  );
                },
                orElse: () => Container());
          },
        );
      },
    );
  }
}
