import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/routes/router.gr.dart';
import 'package:bonyeza_kazi/src/application/job_journey/clients_pays_worker_cubit/client_pays_worker_cubit.dart';
import 'package:bonyeza_kazi/src/application/job_journey/sp_sets_price_cubit/sp_sets_price_cubit.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/chatroom_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

Widget buildAgreedPriceButton(Message message, bool isMe, BuildContext context,
    String userTypeID, ChatRoom chatRoom) {
  return Positioned(
    top: 10.h,
    right: 20.h,
    child: MaterialButton(
      onPressed: () {
        ExtendedNavigator.of(context).push(Routes.setAgreedPrice,
            arguments: SetAgreedPriceArguments(
                chatRoom: chatRoom, message: message, isMe: isMe));
      },
      color: kGreenBackgroundColor,
      child: Text('Set Agreed Price', style: TextStyle(color: Colors.white)),
    ),
  );
}

Widget buildConfirmPriceButton(Message message, bool isMe, BuildContext context,
    String userTypeID, ChatRoom chatRoom) {
  SpSetsPriceeCubit sPSetsPriceeCubit =
      BlocProvider.of<SpSetsPriceeCubit>(context);

  return BlocBuilder<SpSetsPriceeCubit, SpSetsPriceeState>(
    builder: (context, state) {
      if (state.isSubmitting) {
        return Positioned(
          top: 10.h,
          right: 20.h,
          child: MaterialButton(
            onPressed: () {},
            color: kGreenBackgroundColor,
            child: Text('Submitting...', style: TextStyle(color: Colors.white)),
          ),
        );
      } else {
        return Positioned(
          top: 10.h,
          right: 20.h,
          child: MaterialButton(
            onPressed: () {
              sPSetsPriceeCubit.clientConfirmsPrice(
                  message.workID, chatRoom, message);
            },
            color: kGreenBackgroundColor,
            child: Text('Confirm Agreed Price',
                style: TextStyle(color: Colors.white)),
          ),
        );
      }
    },
  );
}

Widget buildWorkCompleteButton(Message message, bool isMe, BuildContext context,
    String userTypeID, ChatRoom chatRoom) {
  return Positioned(
    top: 10.h,
    right: 20.h,
    child: MaterialButton(
      onPressed: () {
        ExtendedNavigator.of(context).push(
          Routes.workCompletedWidget,
          arguments: WorkCompletedWidgetArguments(
              chatRoom: chatRoom, isMe: isMe, message: message),
        );
      },
      color: kGreenBackgroundColor,
      child: Text(
        'Work Completed',
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}

Widget buildPayNowButton(Message message, bool isMe, BuildContext context,
    String userTypeID, ChatRoom chatRoom) {
  ClientPaysWorkerCubit clientPaysWorkerCubit =
      BlocProvider.of<ClientPaysWorkerCubit>(context);
  return Positioned(
    top: 10.h,
    right: 20.h,
    child: MaterialButton(
      onPressed: () {
        clientPaysWorkerCubit.clientPaysWorker(
            message.workID, chatRoom, message);
      },
      color: kGreenBackgroundColor,
      child: Text('Pay Now', style: TextStyle(color: Colors.white)),
    ),
  );
}

Widget buildLeaveAReviewButton(Message message, bool isMe, BuildContext context,
    String userTypeID, ChatRoom chatRoom) {
  return Positioned(
    top: 10.h,
    right: 20.h,
    child: MaterialButton(
      onPressed: () {
        ExtendedNavigator.of(context).push(
          Routes.sendRatingWidget,
          arguments: SendRatingWidgetArguments(
              chatRoom: chatRoom,
              message: message,
              isMe: isMe,
              userTypeID: userTypeID),
        );
      },
      color: kGreenBackgroundColor,
      child: Text('Leave a review', style: TextStyle(color: Colors.white)),
    ),
  );
}
