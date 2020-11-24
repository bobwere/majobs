import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/common/routes/router.gr.dart';
import 'package:bonyeza_kazi/src/application/job_journey/client_approves_work_cubit/client_approves_work_cubit.dart';
import 'package:bonyeza_kazi/src/application/job_journey/clients_pays_worker_cubit/client_pays_worker_cubit.dart';
import 'package:bonyeza_kazi/src/application/job_journey/job_journey_cubit/job_journey_cubit.dart';
import 'package:bonyeza_kazi/src/application/job_journey/sp_request_time_extension_cubit/sp_request_time_extension_cubit.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/chatroom_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/message_model.dart';
import 'package:location/location.dart' as loc;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:bonyeza_kazi/src/application/sp_job_cubit/sp_job_cubit.dart';
import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart' as load;
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

Widget buildEnquirySentMessage(
    Message message, bool isMe, BuildContext context, bool isANewDay) {
  final DateTime timeStamp =
      DateTime.fromMillisecondsSinceEpoch(int.parse(message.time));
  final time = DateFormat("hh:mm").format(timeStamp);
  final date = DateFormat("EEEE, d MMM y").format(timeStamp);
  SPJobCubit spJobCubit = BlocProvider.of<SPJobCubit>(context);

  spJobCubit.getJobStatus();
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Center(
            child: TextResponsive(
          date,
          style: TextStyle(
              color: Colors.black87, fontSize: 21, fontWeight: FontWeight.w500),
        )),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            child: Column(
              children: [
                Center(
                  child: isANewDay
                      ? TextResponsive(
                          date,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 21,
                              fontWeight: FontWeight.w500),
                        )
                      : Container(),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsetsResponsive.symmetric(
                        horizontal: 20, vertical: 10),
                    padding: EdgeInsetsResponsive.symmetric(
                        horizontal: 20, vertical: 10),
                    width: MediaQuery.of(context).size.width * 0.75,
                    decoration: BoxDecoration(
                        color: isMe ? Color(0xFF81AAD4) : Color(0xFFF6F7F8),
                        borderRadius: isNotMeBorderRadius),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextResponsive("Enquiry Sent",
                                style: kMessageBodyTextStyle),
                            ContainerResponsive(
                              width: 250,
                              child: TextResponsive(
                                  "To protect your payment, always communicate and pay through the Majobs app",
                                  style: kMessageBodyTextStyle),
                            ),
                          ],
                        ),
                        SizedBoxResponsive(height: 10),
                        TextResponsive(time.toString(),
                            style: isMe ? notMetimeTextStyle : timeTextStyle),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildJobEnquiryMessage(Message message, BuildContext context,
    ChatRoom chatRoom, bool isMe, bool isANewDay, String userTypeID) {
  final DateTime timeStamp =
      DateTime.fromMillisecondsSinceEpoch(int.parse(message.time));
  final time = DateFormat("hh:mm").format(timeStamp);
  final date = DateFormat("EEEE, d MMM y").format(timeStamp);
  JobJourneyCubit jobJourneyCubit = BlocProvider.of<JobJourneyCubit>(context);
  SPJobCubit spJobCubit = BlocProvider.of<SPJobCubit>(context);

  spJobCubit.getJobStatus();

  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Center(
            child: TextResponsive(
          date,
          style: TextStyle(
              color: Colors.black87, fontSize: 21, fontWeight: FontWeight.w500),
        )),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin:
                EdgeInsetsResponsive.symmetric(horizontal: 20, vertical: 10),
            padding:
                EdgeInsetsResponsive.symmetric(horizontal: 20, vertical: 10),
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: kServerOrNotMeMessageBoxDecoration,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextResponsive('Requesting Your Services',
                              style: kMessageHeadingTextStyle),
                          SizedBoxResponsive(height: 5),
                          TextResponsive("On ${message.bookingDate}",
                              style: kMessageBookingDateTimeStyle),
                          TextResponsive("At ${message.bookingTime}",
                              style: kMessageBookingDateTimeStyle),
                          SizedBoxResponsive(height: 10),
                          TextResponsive('Job Description',
                              style: kMessageHeadingTextStyle),
                          TextResponsive(message.bookingDescription,
                              style: kMessageBodyTextStyle),
                          SizedBoxResponsive(height: 10),
                          GestureDetector(
                            onTap: () {
                              ExtendedNavigator.of(context).push(
                                  Routes.portfolioGalleryDetailPage,
                                  arguments:
                                      PortfolioGalleryDetailPageArguments(
                                          imagePaths: message.bookingImage,
                                          currentIndex: 0));
                            },
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.h)),
                              child: SizedBoxResponsive(
                                width: 250,
                                height: 250,
                                child: CachedNetworkImage(
                                  fadeOutDuration:
                                      const Duration(milliseconds: 500),
                                  fadeInDuration:
                                      const Duration(milliseconds: 500),
                                  imageUrl: message.bookingImage[0],
                                  placeholder: (context, url) {
                                    return Container(
                                      color: randomChoice<Color>(
                                          kPlaceHolderColors),
                                    );
                                  },
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBoxResponsive(height: 5),
                          BlocBuilder<JobJourneyCubit, JobJourneyState>(
                            builder: (context, state) {
                              if (state == JobJourneyState.loading() &&
                                  message.showActionButton !=
                                      INBOX_ACTION_BUTTON_CLICKED) {
                                return Container(
                                  height: 60.h,
                                  width: 150.h,
                                  child: Center(
                                    child: Container(
                                      height: 40.h,
                                      width: 40.h,
                                      child: load.LoadingIndicator(
                                          indicatorType:
                                              load.Indicator.ballTrianglePath,
                                          color: kBlueBackgroundColor),
                                    ),
                                  ),
                                );
                              } else {
                                return message.showActionButton !=
                                        INBOX_ACTION_BUTTON_CLICKED
                                    ? Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.55,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: RaisedButtonResponsive(
                                                color: kRedBackgroundColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.h),
                                                ),
                                                onPressed: () {
                                                  ExtendedNavigator.of(context)
                                                      .push(Routes.sPRejectsJob,
                                                          arguments:
                                                              SPRejectsJobArguments(
                                                                  chatRoom:
                                                                      chatRoom,
                                                                  isMe: isMe,
                                                                  message:
                                                                      message));
                                                },
                                                child: TextResponsive('DECLINE',
                                                    style:
                                                        kMessageAcceptDenyTextSytle),
                                              ),
                                            ),
                                            SizedBoxResponsive(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: RaisedButtonResponsive(
                                                color: kGreenBackgroundColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.h),
                                                ),
                                                onPressed: () {
                                                  jobJourneyCubit.spAcceptsJob(
                                                      message.workID,
                                                      chatRoom,
                                                      message);
                                                },
                                                child: TextResponsive('CONFIRM',
                                                    style:
                                                        kMessageAcceptDenyTextSytle),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container();
                              }
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    TextResponsive(time.toString(),
                        style: isMe ? notMetimeTextStyle : timeTextStyle),
                    LocationButton(message: message)
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildNormalMessage(
    Message message, bool isMe, BuildContext context, bool isANewDay) {
  final DateTime timeStamp =
      DateTime.fromMillisecondsSinceEpoch(int.parse(message.time));
  final time = DateFormat("hh:mm").format(timeStamp);
  final date = DateFormat("EEEE, d MMM y").format(timeStamp);
  SPJobCubit spJobCubit = BlocProvider.of<SPJobCubit>(context);

  spJobCubit.getJobStatus();
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Center(
          child: isANewDay
              ? TextResponsive(
                  date,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 21,
                      fontWeight: FontWeight.w500),
                )
              : Container(),
        ),
        Align(
          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: isMe
                ? EdgeInsetsResponsive.symmetric(horizontal: 20, vertical: 10)
                : EdgeInsetsResponsive.symmetric(horizontal: 20, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 15.h),
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
                color: isMe ? Color(0xFF81AAD4) : Color(0xFFF6F7F8),
                borderRadius: isMe ? isMeBorderRadius : isNotMeBorderRadius),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ContainerResponsive(
                      width: 250,
                      child: TextResponsive(message.text,
                          style: isMe
                              ? kNotMeMessageBodyTextStyle
                              : kMessageBodyTextStyle),
                    )
                  ],
                ),
                SizedBoxResponsive(height: 10),
                TextResponsive(time.toString(),
                    style: isMe ? notMetimeTextStyle : timeTextStyle),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildBookingConfirmedMessage(
    Message message,
    bool isMe,
    BuildContext context,
    ChatRoom chatRoom,
    String userTypeID,
    bool isANewDay) {
  final DateTime timeStamp =
      DateTime.fromMillisecondsSinceEpoch(int.parse(message.time));
  final time = DateFormat("hh:mm").format(timeStamp);
  final date = DateFormat("EEEE, d MMM y").format(timeStamp);
  SPJobCubit spJobCubit = BlocProvider.of<SPJobCubit>(context);

  spJobCubit.getJobStatus();
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Center(
          child: isANewDay
              ? TextResponsive(
                  date,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 21,
                      fontWeight: FontWeight.w500),
                )
              : Container(),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsetsResponsive.symmetric(
                      horizontal: 20, vertical: 10),
                  padding: EdgeInsetsResponsive.symmetric(
                      horizontal: 20, vertical: 10),
                  width: MediaQuery.of(context).size.width * 0.75,
                  decoration: BoxDecoration(
                      color: isMe ? Color(0xFF81AAD4) : Color(0xFFF6F7F8),
                      borderRadius: isNotMeBorderRadius),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          userTypeID == '5'
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    /*      TextResponsive(message.bookingText,
                                        style: kMessageHeadingTextStyle),*/
                                    /*  SizedBoxResponsive(height: 10),*/
                                    TextResponsive("Booking confirmed",
                                        style: kMessageHeadingTextStyle),
                                    SizedBoxResponsive(height: 10),
                                    ContainerResponsive(
                                      width: 250,
                                      child: TextResponsive(
                                          "Go ahead and negotiate the price, duration and commencement of this job",
                                          style: kMessageBodyTextStyle),
                                    ),
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    ContainerResponsive(
                                      width: 250,
                                      child: TextResponsive(
                                          "Booking confirmed notification sent",
                                          style: kMessageHeadingTextStyle),
                                    ),
                                    SizedBoxResponsive(height: 20),
                                    ContainerResponsive(
                                      width: 250,
                                      child: TextResponsive(
                                          "Go ahead and negotiate the price and duration for this job and click the green button to submit the agreed price",
                                          style: kMessageBodyTextStyle),
                                    ),
                                  ],
                                )
                        ],
                      ),
                      SizedBoxResponsive(height: 10),
                      TextResponsive(time.toString(),
                          style: isMe ? notMetimeTextStyle : timeTextStyle),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildBookingDeclinedMessage(
    Message message,
    bool isMe,
    BuildContext context,
    ChatRoom chatRoom,
    String userTypeID,
    bool isANewDay) {
  final DateTime timeStamp =
      DateTime.fromMillisecondsSinceEpoch(int.parse(message.time));
  final time = DateFormat("hh:mm").format(timeStamp);
  final date = DateFormat("EEEE, d MMM y").format(timeStamp);
  SPJobCubit spJobCubit = BlocProvider.of<SPJobCubit>(context);

  spJobCubit.getJobStatus();
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Center(
          child: isANewDay
              ? TextResponsive(
                  date,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 21,
                      fontWeight: FontWeight.w500),
                )
              : Container(),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin:
                EdgeInsetsResponsive.symmetric(horizontal: 20, vertical: 10),
            padding:
                EdgeInsetsResponsive.symmetric(horizontal: 20, vertical: 10),
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
                color: isMe ? Color(0xFF81AAD4) : Color(0xFFF6F7F8),
                borderRadius: isNotMeBorderRadius),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                userTypeID == '5'
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextResponsive("Booking Declined",
                              style: kMessageHeadingTextStyle),
                          SizedBoxResponsive(
                            height: 10,
                          ),
                          ContainerResponsive(
                            width: 250,
                            child: TextResponsive('REASON FOR DECLINE:',
                                style: kMessageHeadingTextStyle),
                          ),
                          SizedBoxResponsive(
                            height: 10,
                          ),
                          ContainerResponsive(
                            width: 250,
                            child: TextResponsive(message.reasonForDeclinedJob,
                                style: kMessageBodyTextStyle),
                          ),
                          SizedBoxResponsive(
                            height: 10,
                          ),
                          ContainerResponsive(
                            width: 250,
                            child: TextResponsive(
                                'kindly seek another service provider to assist you',
                                style: kMessageBodyTextStyle),
                          ),
                        ],
                      )
                    : ContainerResponsive(
                        width: 250,
                        child: TextResponsive(
                            "Booking declined notification sent",
                            style: kMessageBodyTextStyle),
                      ),
                SizedBoxResponsive(height: 10),
                TextResponsive(time.toString(),
                    style: isMe ? notMetimeTextStyle : timeTextStyle),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildPriceSetMessage(Message message, bool isMe, BuildContext context,
    String userTypeID, ChatRoom chatRoom, bool isANewDay) {
  final DateTime timeStamp =
      DateTime.fromMillisecondsSinceEpoch(int.parse(message.time));
  final time = DateFormat("hh:mm").format(timeStamp);
  final date = DateFormat("EEEE, d MMM y").format(timeStamp);
  SPJobCubit spJobCubit = BlocProvider.of<SPJobCubit>(context);

  spJobCubit.getJobStatus();
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Center(
          child: isANewDay
              ? TextResponsive(
                  date,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 21,
                      fontWeight: FontWeight.w500),
                )
              : Container(),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin:
                EdgeInsetsResponsive.symmetric(horizontal: 20, vertical: 10),
            padding:
                EdgeInsetsResponsive.symmetric(horizontal: 20, vertical: 10),
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
                color: isMe ? Color(0xFF81AAD4) : Color(0xFFF6F7F8),
                borderRadius: isNotMeBorderRadius),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    userTypeID == '5'
                        ? ContainerResponsive(
                            width: 250,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextResponsive(
                                    'Work Duration: ${message.workDuration}',
                                    style: kMessageBodyTextStyle),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  textBaseline: TextBaseline.ideographic,
                                  children: [
                                    TextResponsive('Invoice/Charges: ',
                                        style: kMessageBodyTextStyle),
                                    TextResponsive(
                                      'Ksh.${message.agreedPrice}',
                                      style: TextStyle(
                                        color: Color(0xFF6A6B6C),
                                        fontSize: 21,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        : ContainerResponsive(
                            width: 250,
                            child: TextResponsive(
                                "Invoice sent, wait for your client to confirm its the correct amount before you start this work",
                                style: kMessageBodyTextStyle),
                          ),
                  ],
                ),
                SizedBoxResponsive(height: 10),
                TextResponsive(time.toString(),
                    style: isMe ? notMetimeTextStyle : timeTextStyle),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildPriceConfirmedMessage(
    Message message,
    bool isMe,
    BuildContext context,
    String userTypeID,
    ChatRoom chatRoom,
    bool isANewDay) {
  final DateTime timeStamp =
      DateTime.fromMillisecondsSinceEpoch(int.parse(message.time));
  final time = DateFormat("hh:mm").format(timeStamp);
  final date = DateFormat("EEEE, d MMM y").format(timeStamp);
  SPJobCubit spJobCubit = BlocProvider.of<SPJobCubit>(context);

  spJobCubit.getJobStatus();
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Center(
          child: isANewDay
              ? TextResponsive(
                  date,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 21,
                      fontWeight: FontWeight.w500),
                )
              : Container(),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin:
                EdgeInsetsResponsive.symmetric(horizontal: 20, vertical: 10),
            padding:
                EdgeInsetsResponsive.symmetric(horizontal: 20, vertical: 10),
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
                color: isMe ? Color(0xFF81AAD4) : Color(0xFFF6F7F8),
                borderRadius: isNotMeBorderRadius),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                userTypeID == '5'
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ContainerResponsive(
                            width: 250,
                            child: TextResponsive(
                                "Service provider can now begin this job",
                                style: kMessageBodyTextStyle),
                          )
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ContainerResponsive(
                            width: 250,
                            child: TextResponsive(
                                "Client has confirmed the agreed price you can now begin this job, once it is completed click the green button to submit images of the work done",
                                style: kMessageBodyTextStyle),
                          ),
                          SizedBoxResponsive(height: 10),
                          ContainerResponsive(
                            width: 250,
                            child: TextResponsive(
                                "In the likelyhood the agreed work duration won\'t be enough, you can click the green button to request for more time",
                                style: kMessageBodyTextStyle),
                          ),
                          SizedBoxResponsive(height: 10),
                          message.workDurationChanged == null
                              ? RaisedButtonResponsive(
                                  color: kGreenBackgroundColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.h),
                                  ),
                                  onPressed: () {
                                    ExtendedNavigator.of(context).push(
                                        Routes.requestMoreTime,
                                        arguments: RequestMoreTimeArguments(
                                            chatRoom: chatRoom,
                                            isMe: isMe,
                                            message: message));
                                  },
                                  child: TextResponsive('REQUEST MORE TIME',
                                      style: kMessageAcceptDenyTextSytle),
                                )
                              : Container(),
                        ],
                      ),
                SizedBoxResponsive(height: 10),
                TextResponsive(time.toString(),
                    style: isMe ? notMetimeTextStyle : timeTextStyle),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildClientTimeExtensionRequestMessage(Message message, bool isMe,
    BuildContext context, ChatRoom chatRoom, bool isANewDay) {
  final DateTime timeStamp =
      DateTime.fromMillisecondsSinceEpoch(int.parse(message.time));
  final time = DateFormat("hh:mm").format(timeStamp);
  final date = DateFormat("EEEE, d MMM y").format(timeStamp);
  SpRequestTimeExtensionCubit spRequestTimeExtensionCubit =
      BlocProvider.of<SpRequestTimeExtensionCubit>(context);
  SPJobCubit spJobCubit = BlocProvider.of<SPJobCubit>(context);

  spJobCubit.getJobStatus();
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Center(
          child: isANewDay
              ? TextResponsive(
                  date,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 21,
                      fontWeight: FontWeight.w500),
                )
              : Container(),
        ),
        Container(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsetsResponsive.symmetric(
                      horizontal: 20, vertical: 10),
                  padding: EdgeInsetsResponsive.symmetric(
                      horizontal: 20, vertical: 10),
                  width: MediaQuery.of(context).size.width * 0.75,
                  decoration: BoxDecoration(
                      color: isMe ? Color(0xFF81AAD4) : Color(0xFFF6F7F8),
                      borderRadius: isNotMeBorderRadius),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      message.serverMessageType ==
                                  SERVER_MSG_TYPE_REQUEST_MORE_TIME &&
                              message.serverMessageStatus ==
                                  SERVER_MSG_STATUS_REQUEST_TIME_UNCONFIRMED
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ContainerResponsive(
                                  width: 250,
                                  child: TextResponsive(
                                      "Service provider is requesting ${message.workDurationChanged} to complete this job",
                                      style: kMessageBodyTextStyle),
                                ),
                                BlocBuilder<SpRequestTimeExtensionCubit,
                                    SpRequestTimeExtensionState>(
                                  builder: (context, state) {
                                    if (state.isSubmitting) {
                                      return ContainerResponsive(
                                        width: 200,
                                        child: RaisedButtonResponsive(
                                          color: kGreenBackgroundColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.h),
                                          ),
                                          onPressed: () {},
                                          child: TextResponsive('SUBMITTING...',
                                              style:
                                                  kMessageAcceptDenyTextSytle),
                                        ),
                                      );
                                    } else {
                                      return ContainerResponsive(
                                        width: 200,
                                        child: RaisedButtonResponsive(
                                          color: kGreenBackgroundColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.h),
                                          ),
                                          onPressed: () {
                                            spRequestTimeExtensionCubit
                                                .clientConfirmsTimeExtension(
                                                    message.workID,
                                                    chatRoom,
                                                    message);
                                          },
                                          child: TextResponsive('CONFIRM',
                                              style:
                                                  kMessageAcceptDenyTextSytle),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ],
                            )
                          : ContainerResponsive(
                              width: 250,
                              child: TextResponsive(
                                  "confirmation notification to extend time for this job to be completed has been sent",
                                  style: kMessageBodyTextStyle),
                            ),
                      SizedBoxResponsive(height: 10),
                      TextResponsive(time.toString(),
                          style: isMe ? notMetimeTextStyle : timeTextStyle),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget buildSPTimeExtensionRequestMessage(Message message, bool isMe,
    BuildContext context, ChatRoom chatRoom, bool isANewDay) {
  final DateTime timeStamp =
      DateTime.fromMillisecondsSinceEpoch(int.parse(message.time));
  final time = DateFormat("hh:mm").format(timeStamp);
  final date = DateFormat("EEEE, d MMM y").format(timeStamp);
  SPJobCubit spJobCubit = BlocProvider.of<SPJobCubit>(context);

  spJobCubit.getJobStatus();

  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Center(
          child: isANewDay
              ? TextResponsive(
                  date,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 21,
                      fontWeight: FontWeight.w500),
                )
              : Container(),
        ),
        Container(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsetsResponsive.symmetric(
                      horizontal: 20, vertical: 10),
                  padding: EdgeInsetsResponsive.symmetric(
                      horizontal: 20, vertical: 10),
                  width: MediaQuery.of(context).size.width * 0.75,
                  decoration: BoxDecoration(
                      color: isMe ? Color(0xFF81AAD4) : Color(0xFFF6F7F8),
                      borderRadius: isNotMeBorderRadius),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      message.serverMessageType ==
                                  SERVER_MSG_TYPE_REQUEST_MORE_TIME &&
                              message.serverMessageStatus ==
                                  SERVER_MSG_STATUS_REQUEST_TIME_UNCONFIRMED
                          ? ContainerResponsive(
                              width: 250,
                              child: TextResponsive(
                                  "Request to extend time for this work has been sent, wait for your client to confirm",
                                  style: kMessageBodyTextStyle),
                            )
                          : ContainerResponsive(
                              width: 250,
                              child: TextResponsive(
                                  "Request to extend time for this work has been confirmed",
                                  style: kMessageBodyTextStyle),
                            ),
                      SizedBoxResponsive(height: 10),
                      TextResponsive(time.toString(),
                          style: isMe ? notMetimeTextStyle : timeTextStyle),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget buildWorkCompletedMessage(
    Message message,
    bool isMe,
    BuildContext context,
    ChatRoom chatRoom,
    String userTypeID,
    bool isANewDay) {
  final DateTime timeStamp =
      DateTime.fromMillisecondsSinceEpoch(int.parse(message.time));
  final time = DateFormat("hh:mm").format(timeStamp);
  final date = DateFormat("EEEE, d MMM y").format(timeStamp);
  SPJobCubit spJobCubit = BlocProvider.of<SPJobCubit>(context);

  spJobCubit.getJobStatus();
  ClientPaysWorkerCubit clientPaysWorkerCubit =
      BlocProvider.of<ClientPaysWorkerCubit>(context);
  ClientApprovesWorkCubit clientApprovesWorkCubit =
      BlocProvider.of<ClientApprovesWorkCubit>(context);
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Center(
          child: isANewDay
              ? TextResponsive(
                  date,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 21,
                      fontWeight: FontWeight.w500),
                )
              : Container(),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin:
                EdgeInsetsResponsive.symmetric(horizontal: 20, vertical: 10),
            padding:
                EdgeInsetsResponsive.symmetric(horizontal: 20, vertical: 10),
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
                color: isMe ? Color(0xFF81AAD4) : Color(0xFFF6F7F8),
                borderRadius: isNotMeBorderRadius),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        userTypeID == '5'
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    TextResponsive("Work completed",
                                        style: kMessageBodyTextStyle),
                                    SizedBox(height: 10.h),
                                    message.showActionButton !=
                                            INBOX_ACTION_BUTTON_CLICKED
                                        ? GestureDetector(
                                            onTap: () {
                                              if (message
                                                      .showActionApprovalButton ==
                                                  INBOX_ACTION_BUTTON_CLICKED)
                                                clientPaysWorkerCubit
                                                    .clientPaysWorker(
                                                        message.workID,
                                                        chatRoom,
                                                        message);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: message
                                                              .showActionApprovalButton ==
                                                          INBOX_ACTION_BUTTON_CLICKED
                                                      ? kGreenBackgroundColor
                                                      : Colors.grey.shade500,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15.h,
                                                  horizontal: 15.h),
                                              child: TextResponsive(
                                                "CLICK HERE TO PAY",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          )
                                        : Container(),
                                    SizedBox(height: 10.h),
                                    ContainerResponsive(
                                      width: 250,
                                      child: TextResponsive(
                                          "Alternatively,\nYou can use\nPaybill No. 290091\nA/C No. ${message.workerPhone}\nAmount ${message.agreedPrice}",
                                          style: kMessageBodyTextStyle),
                                    ),
                                    SizedBox(height: 10.h),
                                    ContainerResponsive(
                                      width: 250,
                                      child: TextResponsive(
                                          "Kindly approve or disapprove the work done by the service provider before paying",
                                          style: kMessageBodyTextStyle),
                                    ),
                                    SizedBox(height: 10.h),
                                    message.showActionApprovalButton !=
                                            INBOX_ACTION_BUTTON_CLICKED
                                        ? Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.55,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: RaisedButtonResponsive(
                                                    color: kRedBackgroundColor,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.h),
                                                    ),
                                                    onPressed: () {
                                                      ExtendedNavigator.of(context).push(
                                                          Routes
                                                              .clientRejectsWork,
                                                          arguments:
                                                              ClientRejectsWorkArguments(
                                                                  chatRoom:
                                                                      chatRoom,
                                                                  isMe: isMe,
                                                                  message:
                                                                      message));
                                                    },
                                                    child: TextResponsive(
                                                        'REJECT',
                                                        style:
                                                            kMessageAcceptDenyTextSytle),
                                                  ),
                                                ),
                                                SizedBoxResponsive(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: RaisedButtonResponsive(
                                                    color:
                                                        kGreenBackgroundColor,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.h),
                                                    ),
                                                    onPressed: () {
                                                      clientApprovesWorkCubit
                                                          .clientApprovesWork(
                                                              message.workID,
                                                              chatRoom,
                                                              message);
                                                    },
                                                    child: TextResponsive(
                                                        'APPROVE',
                                                        style:
                                                            kMessageAcceptDenyTextSytle),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    BlocBuilder<ClientPaysWorkerCubit,
                                            ClientPaysWorkerState>(
                                        builder: (context, state) {
                                      if (state.isSubmitting) {
                                        return Container(
                                          height: 60.h,
                                          width: 150.h,
                                          child: Center(
                                            child: Container(
                                              height: 40.h,
                                              width: 40.h,
                                              child: load.LoadingIndicator(
                                                  indicatorType: load.Indicator
                                                      .ballTrianglePath,
                                                  color: kBlueBackgroundColor),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Container();
                                      }
                                    }),
                                    BlocBuilder<ClientApprovesWorkCubit,
                                            ClientApprovesWorkState>(
                                        builder: (context, state) {
                                      if (state.isSubmitting) {
                                        return Container(
                                          height: 60.h,
                                          width: 150.h,
                                          child: Center(
                                            child: Container(
                                              height: 40.h,
                                              width: 40.h,
                                              child: load.LoadingIndicator(
                                                  indicatorType: load.Indicator
                                                      .ballTrianglePath,
                                                  color: kBlueBackgroundColor),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Container();
                                      }
                                    }),
                                  ])
                            : ContainerResponsive(
                                width: 250,
                                child: TextResponsive(
                                    "Work completed, Notification for your client to approve your work and make a payment has been sent",
                                    style: kMessageBodyTextStyle),
                              ),
                      ],
                    ),
                    SizedBoxResponsive(height: 10),
                    TextResponsive(time.toString(),
                        style: isMe ? notMetimeTextStyle : timeTextStyle),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildPaymentMadeNotificationClientMessage(
    Message message,
    bool isMe,
    BuildContext context,
    String userTypeID,
    ChatRoom chatRoom,
    bool isANewDay) {
  final DateTime timeStamp =
      DateTime.fromMillisecondsSinceEpoch(int.parse(message.time));
  final time = DateFormat("hh:mm").format(timeStamp);
  final date = DateFormat("EEEE, d MMM y").format(timeStamp);
  SPJobCubit spJobCubit = BlocProvider.of<SPJobCubit>(context);

  spJobCubit.getJobStatus();
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Center(
          child: isANewDay
              ? TextResponsive(
                  date,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 21,
                      fontWeight: FontWeight.w500),
                )
              : Container(),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin:
                EdgeInsetsResponsive.symmetric(horizontal: 20, vertical: 10),
            padding:
                EdgeInsetsResponsive.symmetric(horizontal: 20, vertical: 10),
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
                color: isMe ? Color(0xFF81AAD4) : Color(0xFFF6F7F8),
                borderRadius: isNotMeBorderRadius),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    message.serverMessageStatus == SERVER_MSG_STATUS_PAID
                        //    ||message.serverMessageStatus ==     SERVER_MSG_STATUS_RATED
                        ? ContainerResponsive(
                            width: 250,
                            child: TextResponsive(
                                "Payment made notification sent",
                                style: kMessageBodyTextStyle),
                          )
                        : Container(),
                  ],
                ),
                SizedBoxResponsive(height: 10),
                TextResponsive(time.toString(),
                    style: isMe ? notMetimeTextStyle : timeTextStyle),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildPaymentMadeNotificationSPMessage(
    Message message,
    bool isMe,
    BuildContext context,
    String userTypeID,
    ChatRoom chatRoom,
    bool isANewDay) {
  final DateTime timeStamp =
      DateTime.fromMillisecondsSinceEpoch(int.parse(message.time));
  final time = DateFormat("hh:mm").format(timeStamp);
  final date = DateFormat("EEEE, d MMM y").format(timeStamp);
  SPJobCubit spJobCubit = BlocProvider.of<SPJobCubit>(context);

  spJobCubit.getJobStatus();
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Center(
          child: isANewDay
              ? TextResponsive(
                  date,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 21,
                      fontWeight: FontWeight.w500),
                )
              : Container(),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin:
                EdgeInsetsResponsive.symmetric(horizontal: 20, vertical: 10),
            padding:
                EdgeInsetsResponsive.symmetric(horizontal: 20, vertical: 10),
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
                color: isMe ? Color(0xFF81AAD4) : Color(0xFFF6F7F8),
                borderRadius: isNotMeBorderRadius),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    message.serverMessageStatus == SERVER_MSG_STATUS_PAID
                        //  ||         message.serverMessageStatus ==         SERVER_MSG_STATUS_RATED
                        ? ContainerResponsive(
                            width: 250,
                            child: TextResponsive("Payment confirmed",
                                style: kMessageBodyTextStyle),
                          )
                        : Container()
                  ],
                ),
                SizedBoxResponsive(height: 10),
                TextResponsive(time.toString(),
                    style: isMe ? notMetimeTextStyle : timeTextStyle),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildImageMessage(
    Message message, bool isMe, BuildContext context, bool isANewDay) {
  final DateTime timeStamp =
      DateTime.fromMillisecondsSinceEpoch(int.parse(message.time));
  final time = DateFormat("hh:mm").format(timeStamp);
  final date = DateFormat("EEEE, d MMM y").format(timeStamp);
  SPJobCubit spJobCubit = BlocProvider.of<SPJobCubit>(context);

  spJobCubit.getJobStatus();
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Center(
          child: isANewDay
              ? TextResponsive(
                  date,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 21,
                      fontWeight: FontWeight.w500),
                )
              : Container(),
        ),
        Align(
          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin:
                EdgeInsetsResponsive.symmetric(horizontal: 20, vertical: 10),
            padding:
                EdgeInsetsResponsive.symmetric(horizontal: 20, vertical: 10),
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
                color: isMe ? Color(0xFF81AAD4) : Color(0xFFF6F7F8),
                borderRadius: isMe ? isMeBorderRadius : isNotMeBorderRadius),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15.h)),
                      child: SizedBoxResponsive(
                        width: 250,
                        height: 250,
                        child: CachedNetworkImage(
                          fadeOutDuration: const Duration(milliseconds: 500),
                          fadeInDuration: const Duration(milliseconds: 500),
                          imageUrl: message.imageUrl,
                          placeholder: (context, url) {
                            return Container(
                              color: randomChoice<Color>(kPlaceHolderColors),
                            );
                          },
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBoxResponsive(height: 10),
                TextResponsive(time.toString(),
                    style: isMe ? notMetimeTextStyle : timeTextStyle),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildSPApprovalDisApprovalMessage(
    Message message,
    bool isMe,
    BuildContext context,
    ChatRoom chatRoom,
    String userTypeID,
    bool isANewDay) {
  final DateTime timeStamp =
      DateTime.fromMillisecondsSinceEpoch(int.parse(message.time));
  final time = DateFormat("hh:mm").format(timeStamp);
  final date = DateFormat("EEEE, d MMM y").format(timeStamp);
  SPJobCubit spJobCubit = BlocProvider.of<SPJobCubit>(context);

  spJobCubit.getJobStatus();

  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Center(
          child: isANewDay
              ? TextResponsive(
                  date,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 21,
                      fontWeight: FontWeight.w500),
                )
              : Container(),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin:
                EdgeInsetsResponsive.symmetric(horizontal: 20, vertical: 10),
            padding:
                EdgeInsetsResponsive.symmetric(horizontal: 20, vertical: 10),
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
                color: isMe ? Color(0xFF81AAD4) : Color(0xFFF6F7F8),
                borderRadius: isNotMeBorderRadius),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    message.serverMessageType == SERVER_MSG_TYPE_JOB_APPROVAL &&
                            message.serverMessageStatus ==
                                SERVER_MSG_STATUS_JOB_DISAPPROVED
                        ? Column(
                            children: [
                              ContainerResponsive(
                                width: 250,
                                child: TextResponsive(
                                    "Your client has disapproved this work",
                                    style: kMessageBodyTextStyle),
                              ),
                              SizedBoxResponsive(height: 10),
                              ContainerResponsive(
                                width: 250,
                                child: TextResponsive(
                                    message.reasonForClientDeclinedJob,
                                    style: kMessageBodyTextStyle),
                              ),
                            ],
                          )
                        : ContainerResponsive(
                            width: 250,
                            child: TextResponsive(
                                "Your client has approved this work",
                                style: kMessageBodyTextStyle),
                          )
                  ],
                ),
                SizedBoxResponsive(height: 10),
                TextResponsive(time.toString(),
                    style: isMe ? notMetimeTextStyle : timeTextStyle),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildClientApprovalDisApprovalMessage(
    Message message,
    bool isMe,
    BuildContext context,
    ChatRoom chatRoom,
    String userTypeID,
    bool isANewDay) {
  final DateTime timeStamp =
      DateTime.fromMillisecondsSinceEpoch(int.parse(message.time));
  final time = DateFormat("hh:mm").format(timeStamp);
  final date = DateFormat("EEEE, d MMM y").format(timeStamp);
  SPJobCubit spJobCubit = BlocProvider.of<SPJobCubit>(context);

  spJobCubit.getJobStatus();

  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Center(
          child: isANewDay
              ? TextResponsive(
                  date,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 21,
                      fontWeight: FontWeight.w500),
                )
              : Container(),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin:
                EdgeInsetsResponsive.symmetric(horizontal: 20, vertical: 10),
            padding:
                EdgeInsetsResponsive.symmetric(horizontal: 20, vertical: 10),
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
                color: isMe ? Color(0xFF81AAD4) : Color(0xFFF6F7F8),
                borderRadius: isNotMeBorderRadius),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    message.serverMessageType == SERVER_MSG_TYPE_JOB_APPROVAL &&
                            message.serverMessageStatus ==
                                SERVER_MSG_STATUS_JOB_DISAPPROVED
                        ? ContainerResponsive(
                            width: 250,
                            child: TextResponsive(
                                "dissaproval notification has been sent to the service provider",
                                style: kMessageBodyTextStyle),
                          )
                        : ContainerResponsive(
                            width: 250,
                            child: TextResponsive(
                                "approval notification has been sent to the service provider",
                                style: kMessageBodyTextStyle),
                          )
                  ],
                ),
                SizedBoxResponsive(height: 10),
                TextResponsive(time.toString(),
                    style: isMe ? notMetimeTextStyle : timeTextStyle),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

class LocationButton extends StatelessWidget {
  const LocationButton({Key key, @required this.message}) : super(key: key);
  final Message message;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Flushbar(
          title: 'Attempting to get permission to access your location',
          message: 'Please wait a moment...',
          margin: EdgeInsets.all(20.h),
          flushbarPosition: FlushbarPosition.TOP,
          duration: Duration(seconds: 3),
          isDismissible: true,
          backgroundColor: Colors.green,
          borderRadius: 15.h,
        ).show(context);
        var permissionStatus = await _getPermission();

        if (permissionStatus == PermissionStatus.granted) {
          loc.Location location = loc.Location();
          Flushbar(
            title: 'Attempting to retrieve your current location...',
            message: 'Please wait a moment...',
            margin: EdgeInsets.all(20.h),
            flushbarPosition: FlushbarPosition.TOP,
            duration: Duration(seconds: 3),
            isDismissible: true,
            backgroundColor: Colors.green,
            borderRadius: 15.h,
          ).show(context);

          var locationData = await location.getLocation();

          ExtendedNavigator.of(context).push(
            Routes.directionToClient,
            arguments: DirectionToClientArguments(
                sPLocationData: locationData,
                clientLatData: this.message.lat,
                clientLngData: this.message.lng),
          );
        } else {
          Flushbar(
            title: 'Permissions error',
            message:
                'Please enable permission to access your location in the system settings to proceed',
            margin: EdgeInsets.all(20.h),
            flushbarPosition: FlushbarPosition.TOP,
            duration: Duration(seconds: 3),
            isDismissible: true,
            backgroundColor: Color(0xFFFD9726),
            borderRadius: 15.h,
          ).show(context);
        }
      },
      child: ContainerResponsive(
        height: 100,
        width: 100,
        child: Column(
          children: [
            Icon(
              Icons.directions,
              color: kBlueBackgroundColor,
              size: 30.h,
            ),
            TextResponsive(
              'Directions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: kBlueBackgroundColor,
              ),
            )
          ],
        ),
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
