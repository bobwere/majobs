import 'package:bonyeza_kazi/common/failures/chat_failure.dart';
import 'package:bonyeza_kazi/src/domain/chat/i_chat_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/chatroom_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetChatroomService {
  const GetChatroomService(this._iChatFacade);

  final IChatFacade _iChatFacade;

  Future<Either<ChatFailure, ChatRoom>> getClientSpChatroom(
      {String clientID, String spID}) async {
    var failureOrChatroom = await _iChatFacade.getChatRoomOfClientSP(
        clientID: clientID, spID: spID);

    return failureOrChatroom;
  }
}
