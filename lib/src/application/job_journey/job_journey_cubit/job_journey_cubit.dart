import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/failures/job_journey_failure.dart';
import 'package:bonyeza_kazi/src/domain/chat/i_chat_interface.dart';
import 'package:bonyeza_kazi/src/domain/job_journey/i_job_journey_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/chatroom_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/message_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

part 'job_journey_state.dart';
part 'job_journey_cubit.freezed.dart';

@injectable
class JobJourneyCubit extends Cubit<JobJourneyState> {
  JobJourneyCubit(
    this._iJobJourneyFacade,
    this._iChatFacade,
    this._pref,
  ) : super(JobJourneyState.initial());

  IJobJourneyFacade _iJobJourneyFacade;

  IChatFacade _iChatFacade;
  SharedPreferences _pref;

  void spAcceptsJob(String workID, ChatRoom chatRoom, Message message) async {
    emit(JobJourneyState.loading());
    final failureOrSuccess =
        await _iJobJourneyFacade.spAcceptsJob(workID: workID);
    failureOrSuccess.fold((failure) {
      emit(JobJourneyState.failure(failure));
    }, (unit) async {
      final currentUser = _pref.getString(USER_ID);

      final otherUser = currentUser == chatRoom.users[0]
          ? chatRoom.users[1]
          : chatRoom.users[0];

      final updatedMessage = message.copyWith(
        showActionButton: INBOX_ACTION_BUTTON_CLICKED,
      );

      await _iChatFacade.upDateMessageDetails(
          chatroomID: chatRoom.chatroomId, message: updatedMessage);

      final bookingConfirmedMessage = message.copyWith(
        id: Uuid().v1(),
        sender: SERVER,
        to: otherUser,
        idFrom: currentUser,
        serverMessageType: SERVER_MSG_TYPE_BOOKING_CONFIRMED,
        serverMessageStatus: SERVER_MSG_STATUS_BOOKING_CONFIRMED,
        workID: workID,
        time: DateTime.now().millisecondsSinceEpoch.toString(),
      );

      await _iChatFacade.createMessage(
          chatroomID: chatRoom.chatroomId, message: bookingConfirmedMessage);

      emit(JobJourneyState.success(unit));

      final updateChatroom = chatRoom.copyWith(
        time: DateTime.now().millisecondsSinceEpoch.toString(),
        currentTextFrom: currentUser,
        text: 'Booking Confirmed',
        unread: true,
      );

      await _iChatFacade.upDateChatRoomDetails(
          chatroomID: chatRoom.chatroomId, chatroom: updateChatroom);
    });
  }

  void spDeclinesJob(
      String reason, String workID, ChatRoom chatRoom, Message message) async {
    emit(JobJourneyState.loading());

    final failureOrSuccess =
        await _iJobJourneyFacade.spRejectsJob(workID: workID, reason: reason);

    failureOrSuccess.fold((failure) {
      emit(JobJourneyState.failure(failure));
    }, (unit) async {
      final currentUser = _pref.getString(USER_ID);

      final otherUser = currentUser == chatRoom.users[0]
          ? chatRoom.users[1]
          : chatRoom.users[0];

      final updatedMessage = message.copyWith(
        showActionButton: INBOX_ACTION_BUTTON_CLICKED,
      );

      await _iChatFacade.upDateMessageDetails(
          chatroomID: chatRoom.chatroomId, message: updatedMessage);

      final bookingDeclinedMessage = message.copyWith(
        id: Uuid().v1(),
        sender: SERVER,
        to: otherUser,
        idFrom: currentUser,
        reasonForDeclinedJob: reason,
        serverMessageType: SERVER_MSG_TYPE_BOOKING_DECLINED,
        serverMessageStatus: SERVER_MSG_STATUS_BOOKING_DECLINED,
        workID: workID,
        time: DateTime.now().millisecondsSinceEpoch.toString(),
      );

      await _iChatFacade.createMessage(
          chatroomID: chatRoom.chatroomId, message: bookingDeclinedMessage);

      emit(JobJourneyState.success(unit));

      final updateChatroom = chatRoom.copyWith(
        time: DateTime.now().millisecondsSinceEpoch.toString(),
        currentTextFrom: currentUser,
        text: 'Booking Declined',
        unread: true,
      );

      await _iChatFacade.upDateChatRoomDetails(
          chatroomID: chatRoom.chatroomId, chatroom: updateChatroom);
    });
  }
}
