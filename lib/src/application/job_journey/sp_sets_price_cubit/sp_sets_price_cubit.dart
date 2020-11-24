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

part 'sp_sets_price_state.dart';
part 'sp_sets_price_cubit.freezed.dart';

@injectable
class SpSetsPriceeCubit extends Cubit<SpSetsPriceeState> {
  SpSetsPriceeCubit(this._iJobJourneyFacade, this._iChatFacade, this._pref)
      : super(SpSetsPriceeState.initial());

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

  void agreedPriceChanged(String agreedPrice) {
    emit(state.copyWith.call(
      agreedPrice: agreedPrice,
      isSubmitting: false,
      sendingFailureOrSuccessOption: none(),
    ));
  }

  void spSetsPrice(String workID, ChatRoom chatRoom, Message message) async {
    emit(state.copyWith.call(
      isSubmitting: true,
      sendingFailureOrSuccessOption: none(),
    ));

    Either<JobJourneyFailure, Unit> failureOrSuccess;
    failureOrSuccess = await _iJobJourneyFacade.spSetsPriceOfJob(
        workID: workID,
        agreedPrice: state.agreedPrice,
        workDuration: state.workDuration);

    emit(state.copyWith.call(
      isSubmitting: false,
      sendingFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));

    failureOrSuccess.fold((failure) {}, (unit) async {
      final currentUser = _pref.getString(USER_ID);

      final otherUser = currentUser == chatRoom.users[0]
          ? chatRoom.users[1]
          : chatRoom.users[0];

      final updatedMessage =
          message.copyWith(showActionButton: INBOX_ACTION_BUTTON_CLICKED);

      await _iChatFacade.upDateMessageDetails(
          chatroomID: chatRoom.chatroomId, message: updatedMessage);

      final priceSetMessage = message.copyWith(
        id: Uuid().v1(),
        sender: SERVER,
        to: otherUser,
        idFrom: currentUser,
        workDuration: state.workDuration,
        agreedPrice: state.agreedPrice,
        serverMessageType: SERVER_MSG_TYPE_BOOKING_CONFIRMED,
        serverMessageStatus: SERVER_MSG_STATUS_PRICE_SET,
        workID: workID,
        time: DateTime.now().millisecondsSinceEpoch.toString(),
      );

      await _iChatFacade.createMessage(
          chatroomID: chatRoom.chatroomId, message: priceSetMessage);

      final updateChatroom = chatRoom.copyWith(
        time: DateTime.now().millisecondsSinceEpoch.toString(),
        currentTextFrom: currentUser,
        text: 'Agreed price',
        unread: true,
      );

      await _iChatFacade.upDateChatRoomDetails(
          chatroomID: chatRoom.chatroomId, chatroom: updateChatroom);
    });
  }

  void clientConfirmsPrice(
      String workID, ChatRoom chatRoom, Message message) async {
    emit(state.copyWith.call(
      isSubmitting: true,
      sendingFailureOrSuccessOption: none(),
    ));

    Either<JobJourneyFailure, Unit> failureOrSuccess;
    failureOrSuccess = await _iJobJourneyFacade.clientConfirmsPriceOfJob(
      workID: message.workID,
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

      final updatedMessage =
          message.copyWith(showActionButton: INBOX_ACTION_BUTTON_CLICKED);

      await _iChatFacade.upDateMessageDetails(
          chatroomID: chatRoom.chatroomId, message: updatedMessage);

      final priceSetMessage = message.copyWith(
        id: Uuid().v1(),
        sender: SERVER,
        to: otherUser,
        idFrom: currentUser,
        serverMessageType: SERVER_MSG_TYPE_BOOKING_CONFIRMED,
        serverMessageStatus: SERVER_MSG_STATUS_WORK_UNCOMPLETED,
        workID: workID,
        time: DateTime.now().millisecondsSinceEpoch.toString(),
      );

      await _iChatFacade.createMessage(
          chatroomID: chatRoom.chatroomId, message: priceSetMessage);

      final updateChatroom = chatRoom.copyWith(
        time: DateTime.now().millisecondsSinceEpoch.toString(),
        currentTextFrom: currentUser,
        text: 'Price confirmed',
        unread: true,
      );

      await _iChatFacade.upDateChatRoomDetails(
          chatroomID: chatRoom.chatroomId, chatroom: updateChatroom);
    });
  }
}
