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

part 'client_pays_worker_state.dart';
part 'client_pays_worker_cubit.freezed.dart';

@injectable
class ClientPaysWorkerCubit extends Cubit<ClientPaysWorkerState> {
  ClientPaysWorkerCubit(this._iJobJourneyFacade, this._iChatFacade, this._pref)
      : super(ClientPaysWorkerState.initial());

  final IJobJourneyFacade _iJobJourneyFacade;
  final IChatFacade _iChatFacade;
  SharedPreferences _pref;

  void clientPaysWorker(
      String workID, ChatRoom chatRoom, Message message) async {
    emit(state.copyWith.call(
      isSubmitting: true,
      sendingFailureOrSuccessOption: none(),
    ));

    Either<JobJourneyFailure, Unit> failureOrSuccess;
    failureOrSuccess = await _iJobJourneyFacade.clientPaysWorker(
        amount: message.agreedPrice,
        msisdn: message.workerPhone,
        workID: message.workID);

    emit(state.copyWith.call(
      isSubmitting: false,
      sendingFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));

    failureOrSuccess.fold((failure) {}, (unit) async {
      final currentUser = _pref.getString(USER_ID);

      final otherUser = currentUser == chatRoom.users[0]
          ? chatRoom.users[1]
          : chatRoom.users[0];

      final updatedMessage = message.copyWith(
        showActionButton: INBOX_ACTION_BUTTON_CLICKED,
        showActionApprovalButton: INBOX_ACTION_BUTTON_CLICKED,
      );

      await _iChatFacade.upDateMessageDetails(
          chatroomID: chatRoom.chatroomId, message: updatedMessage);

      final payNowMessage = message.copyWith(
        id: Uuid().v1(),
        sender: SERVER,
        to: otherUser,
        idFrom: currentUser,
        serverMessageType: SERVER_MSG_TYPE_PAYMENT_CONFIRMED,
        serverMessageStatus: SERVER_MSG_STATUS_PAID,
        workID: workID,
        time: DateTime.now().millisecondsSinceEpoch.toString(),
      );

      await _iChatFacade.createMessage(
          chatroomID: chatRoom.chatroomId, message: payNowMessage);

      final updateChatroom = chatRoom.copyWith(
        time: DateTime.now().millisecondsSinceEpoch.toString(),
        currentTextFrom: currentUser,
        text: 'Payment to be made',
        unread: true,
      );

      await _iChatFacade.upDateChatRoomDetails(
          chatroomID: chatRoom.chatroomId, chatroom: updateChatroom);
    });
  }
}
