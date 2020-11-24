import 'dart:io';
import 'package:bonyeza_kazi/common/constants/loading_and_error_widget.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/chat/create_message_cubit/create_message_cubit.dart';
import 'package:bonyeza_kazi/src/application/chat/instant_messaging_cubit/instant_messaging_cubit.dart';
import 'package:bonyeza_kazi/src/application/chat/chatroom_update_cubit/chatroom_update_cubit.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/chatroom_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/message_model.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/chat_screen_widgets/chat_screen__action_widgets.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/chat_screen_widgets/chat_screen_widget.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_indicator/loading_indicator.dart' as load;

class ChatScreen extends StatefulWidget {
  final String chatroomID;
  final ChatUser otherUser;
  final bool unread;
  final ChatRoom chatroom;

  ChatScreen({this.chatroomID, this.otherUser, this.unread, this.chatroom});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  _buildMessage(Message message, bool isMe, String userTypeID,
      ChatRoom chatRoom, bool isANewDay) {
    Container msg;
    if (message.sender == "server" &&
        message.serverMessageType == SERVER_MSG_TYPE_ENQUIRY &&
        message.serverMessageStatus == SERVER_MSG_STATUS_ENQUIRY) {
      if (userTypeID == "4") {
        msg = buildJobEnquiryMessage(
            message, context, chatRoom, isMe, isANewDay, userTypeID);
      } else {
        msg = buildEnquirySentMessage(message, isMe, context, isANewDay);
      }
    } else if (message.sender == "server" &&
        message.serverMessageType == SERVER_MSG_TYPE_BOOKING_CONFIRMED &&
        message.serverMessageStatus == SERVER_MSG_STATUS_BOOKING_CONFIRMED) {
      msg = buildBookingConfirmedMessage(
          message, isMe, context, chatRoom, userTypeID, isANewDay);
    } else if (message.sender == "server" &&
        message.serverMessageType == SERVER_MSG_TYPE_BOOKING_DECLINED &&
        message.serverMessageStatus == SERVER_MSG_STATUS_BOOKING_DECLINED) {
      msg = buildBookingDeclinedMessage(
          message, isMe, context, chatRoom, userTypeID, isANewDay);
    } else if (message.sender == "server" &&
        message.serverMessageType == SERVER_MSG_TYPE_BOOKING_CONFIRMED &&
        message.serverMessageStatus == SERVER_MSG_STATUS_PRICE_SET) {
      msg = buildPriceSetMessage(
          message, isMe, context, userTypeID, chatRoom, isANewDay);
    } else if (message.sender == "server" &&
        message.serverMessageType == SERVER_MSG_TYPE_BOOKING_CONFIRMED &&
        message.serverMessageStatus == SERVER_MSG_STATUS_WORK_UNCOMPLETED) {
      msg = buildPriceConfirmedMessage(
          message, isMe, context, userTypeID, chatRoom, isANewDay);
    } else if (message.sender == "server" &&
        message.serverMessageType == SERVER_MSG_TYPE_WORK_COMPLETED &&
        message.serverMessageStatus == SERVER_MSG_STATUS_UNPAID) {
      msg = buildWorkCompletedMessage(
          message, isMe, context, chatRoom, userTypeID, isANewDay);
    } else if (message.sender == "server" &&
            message.serverMessageType == SERVER_MSG_TYPE_REQUEST_MORE_TIME &&
            message.serverMessageStatus ==
                SERVER_MSG_STATUS_REQUEST_TIME_UNCONFIRMED ||
        message.serverMessageStatus ==
            SERVER_MSG_STATUS_REQUEST_TIME_CONFIRMED) {
      if (userTypeID == '4') {
        msg = buildSPTimeExtensionRequestMessage(
            message, isMe, context, chatRoom, isANewDay);
      } else {
        msg = buildClientTimeExtensionRequestMessage(
            message, isMe, context, chatRoom, isANewDay);
      }
    } else if (message.sender == "server" &&
            message.serverMessageType == SERVER_MSG_TYPE_PAYMENT_CONFIRMED &&
            message.serverMessageStatus == SERVER_MSG_STATUS_PAID
        //  ||message.serverMessageStatus == SERVER_MSG_STATUS_RATED
        ) {
      if (userTypeID == "4") {
        msg = buildPaymentMadeNotificationSPMessage(
            message, isMe, context, userTypeID, chatRoom, isANewDay);
      } else {
        msg = buildPaymentMadeNotificationClientMessage(
            message, isMe, context, userTypeID, chatRoom, isANewDay);
      }
    } else if (message.sender == "server" &&
            message.serverMessageType == SERVER_MSG_TYPE_JOB_APPROVAL &&
            message.serverMessageStatus == SERVER_MSG_STATUS_JOB_DISAPPROVED ||
        message.serverMessageStatus == SERVER_MSG_STATUS_JOB_APPROVED) {
      if (userTypeID == "4") {
        msg = buildSPApprovalDisApprovalMessage(
            message, isMe, context, chatRoom, userTypeID, isANewDay);
      } else {
        msg = buildClientApprovalDisApprovalMessage(
            message, isMe, context, chatRoom, userTypeID, isANewDay);
      }
    } else if (message.imageUrl != null ||
        message.serverMessageType == 'image') {
      msg = buildImageMessage(message, isMe, context, isANewDay);
    } else {
      msg = buildNormalMessage(message, isMe, context, isANewDay);
    }

/*
 
*/

    if (isMe) {
      return msg;
    }
    return Row(
      children: <Widget>[
        msg,
      ],
    );
  }

  _buildActionButtons(state, allMessages, ChatRoom chatRoom) {
    for (var message in allMessages.asList()) {
      final bool isMe = message.sender == state.currentUserID;
      final userTypeID = state.userTypeID;
      if (message.sender == "server" &&
          userTypeID == '4' &&
          message.serverMessageType == SERVER_MSG_TYPE_BOOKING_CONFIRMED &&
          message.serverMessageStatus == SERVER_MSG_STATUS_BOOKING_CONFIRMED &&
          message.showActionButton != INBOX_ACTION_BUTTON_CLICKED) {
        return buildAgreedPriceButton(
            message, isMe, context, userTypeID, chatRoom);
      } else if (message.sender == "server" &&
          userTypeID == '5' &&
          message.serverMessageType == SERVER_MSG_TYPE_BOOKING_CONFIRMED &&
          message.serverMessageStatus == SERVER_MSG_STATUS_PRICE_SET &&
          message.showActionButton != INBOX_ACTION_BUTTON_CLICKED) {
        return buildConfirmPriceButton(
            message, isMe, context, userTypeID, chatRoom);
      } else if (message.sender == "server" &&
          userTypeID == '4' &&
          message.serverMessageType == SERVER_MSG_TYPE_BOOKING_CONFIRMED &&
          message.serverMessageStatus == SERVER_MSG_STATUS_WORK_UNCOMPLETED &&
          message.showActionButton != INBOX_ACTION_BUTTON_CLICKED) {
        return buildWorkCompleteButton(
            message, isMe, context, userTypeID, chatRoom);
      } else if (message.sender == "server" &&
          userTypeID == '5' &&
          message.serverMessageType == SERVER_MSG_TYPE_PAYMENT_CONFIRMED &&
          message.serverMessageStatus == SERVER_MSG_STATUS_PAID &&
          message.showActionButton != INBOX_ACTION_BUTTON_CLICKED) {
        return buildLeaveAReviewButton(
            message, isMe, context, userTypeID, chatRoom);
      } else if (message.sender == "server" &&
          userTypeID == '4' &&
          message.serverMessageType == SERVER_MSG_TYPE_PAYMENT_CONFIRMED &&
          message.serverMessageStatus == SERVER_MSG_STATUS_PAID &&
          message.spRated != INBOX_ACTION_BUTTON_CLICKED) {
        return buildLeaveAReviewButton(
            message, isMe, context, userTypeID, chatRoom);
      }
    }
  }

  _buildMessageComposer(CreateMessageCubit createMessageCubit) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      height: 80.h,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          BlocBuilder<CreateMessageCubit, CreateMessageState>(
            builder: (context, state) {
              if (state.isSubmittingImage) {
                return Container(
                  height: 40.h,
                  width: 40.h,
                  child: load.LoadingIndicator(
                      indicatorType: load.Indicator.ballTrianglePath,
                      color: kBlueBackgroundColor),
                );
              } else {
                return IconButton(
                  icon: Icon(Icons.photo),
                  iconSize: 40.h,
                  color: kBlueBackgroundColor,
                  onPressed: () {
                    _openPictureDialog(context, createMessageCubit);
                  },
                );
              }
            },
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              controller: _textEditingController,
              onChanged: (value) {
                createMessageCubit.messageChanged(value);
              },
              maxLines: null,
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message...',
                hintStyle: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 20.sp,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          BlocBuilder<CreateMessageCubit, CreateMessageState>(
            builder: (context, state) {
              if (state.isSubmittingText) {
                return IconButton(
                  icon: Icon(Icons.send),
                  iconSize: 40.h,
                  color: Colors.grey,
                  onPressed: () {},
                );
              } else {
                return IconButton(
                  icon: Icon(Icons.send),
                  iconSize: 40.h,
                  color: kBlueBackgroundColor,
                  onPressed: () {
                    _send(context, _textEditingController.text,
                        createMessageCubit);
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    CreateMessageCubit createMessageCubit =
        BlocProvider.of<CreateMessageCubit>(context);
    ChatroomUpdateCubit chatroomUpdateCubit =
        BlocProvider.of<ChatroomUpdateCubit>(context);
    InstantMessagingCubit instantMessagingCubit =
        BlocProvider.of<InstantMessagingCubit>(context);

    ChatRoom updateChatroom = widget.chatroom.copyWith(unread: false);

    if (widget.unread == true) {
      chatroomUpdateCubit.upDateChatRoomDetails(
          widget.chatroomID, updateChatroom);
    }

    return BlocListener<CreateMessageCubit, CreateMessageState>(
      listener: (context, state) {
        state.sendingFailureOrSuccessOption.fold(
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
                }, (_) {
                  _textEditingController.text = "";
                }));
      },
      child: Scaffold(
        appBar: AppBar(
          title: TextResponsive(widget.otherUser.name, style: kAppBarTxtStyle1),
          backgroundColor: kBlueBackgroundColor,
          elevation: 3.h,
        ),
        body: Column(
          children: <Widget>[
            BlocBuilder<InstantMessagingCubit, InstantMessagingState>(
              builder: (context, state) {
                return state.map(
                    initial: (_) => Expanded(child: Container()),
                    loading: (_) => LoadingBallIndicator(),
                    success: (state) {
                      final allMessages = state.allMessages;

                      return Expanded(
                        child: Stack(
                          children: [
                            Container(
                              //height: 500,
                              child: ListView.builder(
                                reverse: true,
                                padding: EdgeInsets.only(top: 15.h),
                                itemCount: allMessages.size,
                                itemBuilder: (BuildContext context, int index) {
                                  final message = allMessages[index];

                                  int previousIndex;
                                  previousIndex = index + 1 == allMessages.size
                                      ? index
                                      : index + 1;
                                  final previousMessage =
                                      allMessages[previousIndex];
                                  final bool isMe =
                                      message.sender == state.currentUserID;
                                  final bool isANewDay =
                                      isAnewDay(message, previousMessage);

                                  final userTypeID = state.userTypeID;

                                  return _buildMessage(message, isMe,
                                      userTypeID, widget.chatroom, isANewDay);
                                },
                              ),
                            ),
                            _buildActionButtons(state, state.allMessages,
                                    widget.chatroom) ??
                                Container()
                          ],
                        ),
                      );
                    },
                    failure: (failure) {
                      return failure.failure.map(serverError: (_) {
                        return Expanded(
                            child: Container(
                                child: GestureDetector(
                          onTap: () {
                            instantMessagingCubit
                                .getMessages(widget.chatroom.chatroomId);
                          },
                          child: Container(
                            child: Center(
                              child: ErrorIndicator(
                                message: SERVER_ERROR_MESSAGE,
                              ),
                            ),
                          ),
                        )));
                      }, noInternet: (_) {
                        return Expanded(
                            child: Container(
                                child: GestureDetector(
                          onTap: () {
                            instantMessagingCubit
                                .getMessages(widget.chatroom.chatroomId);
                          },
                          child: Container(
                            child: Center(
                              child: ErrorIndicator(
                                message: SERVER_ERROR_MESSAGE,
                              ),
                            ),
                          ),
                        )));
                      });
                    });
              },
            ),
            _buildMessageComposer(createMessageCubit),
          ],
        ),
      ),
    );
  }

  void _openPictureDialog(
      BuildContext context, CreateMessageCubit createMessageCubit) async {
    File target =
        File((await ImagePicker().getImage(source: ImageSource.gallery)).path);
    if (target != null) {
      createMessageCubit.photoChanged(target);
      createMessageCubit.sendImage(widget.chatroomID, widget.chatroom);
    }
  }

  void _send(BuildContext context, String text,
      CreateMessageCubit createMessageCubit) {
    if (text.isNotEmpty) {
      createMessageCubit.sendText(widget.chatroomID, widget.chatroom);
    }
  }

  bool isAnewDay(Message message, Message previousMessage) {
    final DateTime timeStamp =
        DateTime.fromMillisecondsSinceEpoch(int.parse(message.time));

    final time = DateFormat("EEEE, d MMM y").format(timeStamp);

    final DateTime previousTimeStamp =
        DateTime.fromMillisecondsSinceEpoch(int.parse(previousMessage.time));

    final prevoiusTime = DateFormat("EEEE, d MMM y").format(previousTimeStamp);

    return prevoiusTime == time ? false : true;
  }
}
