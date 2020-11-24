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

part 'sp_request_time_extension_state.dart';
part 'sp_request_time_extension_cubit.freezed.dart';

@injectable
class SpRequestTimeExtensionCubit extends Cubit<SpRequestTimeExtensionState> {
  SpRequestTimeExtensionCubit(
      this._iJobJourneyFacade, this._iChatFacade, this._pref)
      : super(SpRequestTimeExtensionState.initial());

  final IJobJourneyFacade _iJobJourneyFacade;
  final IChatFacade _iChatFacade;
  SharedPreferences _pref;

  void workDurationChanged(String workDuration) {
    emit(state.copyWith.call(
      workDuration: workDuration,
      isSubmitting: false,
      sendingFailureOrSuccessOption: none(),
    ));
  }

  void spRequestTimeExtension(
      String workID, ChatRoom chatRoom, Message message) async {
    emit(state.copyWith.call(
      isSubmitting: true,
      sendingFailureOrSuccessOption: none(),
    ));

    Either<JobJourneyFailure, Unit> failureOrSuccess;
    failureOrSuccess = await _iJobJourneyFacade.spRequestTimeExtension(
        workID: workID, workDuration: state.workDuration);

    emit(state.copyWith.call(
      isSubmitting: false,
      sendingFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));

    failureOrSuccess.fold((failure) {}, (unit) async {
      final currentUser = _pref.getString(USER_ID);

      final otherUser = currentUser == chatRoom.users[0]
          ? chatRoom.users[1]
          : chatRoom.users[0];

      final updateMessage = message.copyWith(
        workDurationChanged: state.workDuration,
      );

      await _iChatFacade.upDateMessageDetails(
          chatroomID: chatRoom.chatroomId, message: updateMessage);

      final workDurationExtensionMessage = message.copyWith(
        id: Uuid().v1(),
        sender: SERVER,
        to: otherUser,
        idFrom: currentUser,
        workDurationChanged: state.workDuration,
        serverMessageType: SERVER_MSG_TYPE_REQUEST_MORE_TIME,
        serverMessageStatus: SERVER_MSG_STATUS_REQUEST_TIME_UNCONFIRMED,
        workID: workID,
        time: DateTime.now().millisecondsSinceEpoch.toString(),
      );

      await _iChatFacade.createMessage(
          chatroomID: chatRoom.chatroomId,
          message: workDurationExtensionMessage);

      final updateChatroom = chatRoom.copyWith(
        time: DateTime.now().millisecondsSinceEpoch.toString(),
        currentTextFrom: currentUser,
        text: 'Request time extension',
        unread: true,
      );

      await _iChatFacade.upDateChatRoomDetails(
          chatroomID: chatRoom.chatroomId, chatroom: updateChatroom);
    });
  }

  void clientConfirmsTimeExtension(
      String workID, ChatRoom chatRoom, Message message) async {
    emit(state.copyWith.call(
      isSubmitting: true,
      sendingFailureOrSuccessOption: none(),
    ));

    Either<JobJourneyFailure, Unit> failureOrSuccess;
    failureOrSuccess = await _iJobJourneyFacade.clientConfirmsTimeExtension(
      workID: workID,
    );

    emit(state.copyWith.call(
      isSubmitting: false,
      sendingFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));

    failureOrSuccess.fold((failure) {}, (unit) async {
      final currentUser = _pref.getString(USER_ID);

      final otherUser = currentUser == chatRoom.users[0]
          ? chatRoom.users[1]
          : chatRoom.users[0];

      final workDurationExtensionMessage = message.copyWith(
        sender: SERVER,
        to: otherUser,
        idFrom: currentUser,
        showActionButton: INBOX_ACTION_BUTTON_CLICKED,
        serverMessageType: SERVER_MSG_TYPE_REQUEST_MORE_TIME,
        serverMessageStatus: SERVER_MSG_STATUS_REQUEST_TIME_CONFIRMED,
        workID: workID,
        time: DateTime.now().millisecondsSinceEpoch.toString(),
      );

      await _iChatFacade.upDateMessageDetails(
          chatroomID: chatRoom.chatroomId,
          message: workDurationExtensionMessage);

      final updateChatroom = chatRoom.copyWith(
        time: DateTime.now().millisecondsSinceEpoch.toString(),
        currentTextFrom: currentUser,
        text: 'Time extension confirmed',
        unread: true,
      );

      await _iChatFacade.upDateChatRoomDetails(
          chatroomID: chatRoom.chatroomId, chatroom: updateChatroom);
    });
  }
}
