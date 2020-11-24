import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/constants/loading_and_error_widget.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/common/routes/router.gr.dart';
import 'package:bonyeza_kazi/src/application/chat/chats_list_cubit/chats_list_cubit.dart';
import 'package:bonyeza_kazi/src/application/chat/instant_messaging_cubit/instant_messaging_cubit.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/chatroom_model.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/search_page_widgets.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:loading_indicator/loading_indicator.dart' as load;
import 'package:responsive_widgets/responsive_widgets.dart';

class RecentMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    InstantMessagingCubit instantMessagingCubit =
        BlocProvider.of<InstantMessagingCubit>(context);
    ChatsListCubit chatsListCubit = BlocProvider.of<ChatsListCubit>(context);

    return BlocBuilder<ChatsListCubit, ChatsListState>(
      builder: (context, state) {
        return state.map(
            initial: (_) => Container(),
            loading: (_) => LoadingBallIndicator(),
            success: (state) {
              final chatrooms = state.allChats;
              return chatrooms.size != 0
                  ? ListView.builder(
                      padding: EdgeInsets.only(top: 10.h, bottom: 70.h),
                      itemCount: chatrooms.size,
                      itemBuilder: (BuildContext context, int index) {
                        final ChatRoom chatroom = chatrooms[index];
                        bool unread = chatroom.unread &&
                            chatroom.currentTextFrom != state.currentUserID;

                        var date = new DateTime.fromMillisecondsSinceEpoch(
                            int.tryParse(chatroom.time));
                        var time = Jiffy(date).fromNow();

                        ChatUser senderChatUser;

                        if (chatroom.chatUsersDetails[0].id ==
                            state.currentUserID) {
                          senderChatUser = chatroom.chatUsersDetails[1];
                        } else {
                          senderChatUser = chatroom.chatUsersDetails[0];
                        }

                        return GestureDetector(
                          onTap: () {
                            ExtendedNavigator.of(context).push(
                              Routes.chatScreen,
                              arguments: ChatScreenArguments(
                                otherUser: senderChatUser,
                                chatroomID: chatroom.chatroomId,
                                unread: unread,
                                chatroom: chatroom,
                              ),
                            );
                            instantMessagingCubit
                                .getMessages(chatroom.chatroomId);
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 5.h, bottom: 5.h, right: 10.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.h, vertical: 10.h),
                            decoration: BoxDecoration(
                              color: unread
                                  ? kBlueBackgroundColor.withOpacity(0.1)
                                  : Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15.h),
                                bottomRight: Radius.circular(15.h),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    senderChatUser.imageUrl != null
                                        ? CircleAvatar(
                                            radius: 45.h,
                                            backgroundImage: NetworkImage(
                                                senderChatUser.imageUrl),
                                          )
                                        : CircleAvatar(
                                            radius: 45.h,
                                            backgroundColor:
                                                kBlueBackgroundColor,
                                          ),
                                    SizedBox(width: 10.h),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        TextResponsive(
                                          senderChatUser.name,
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 21,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.40,
                                          child: TextResponsive(
                                            chatroom.text ?? " ",
                                            style: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    TextResponsive(
                                      time,
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    unread
                                        ? ContainerResponsive(
                                            padding:
                                                EdgeInsetsResponsive.symmetric(
                                                    horizontal: 10,
                                                    vertical: 10),
                                            decoration: BoxDecoration(
                                              color: kBlueBackgroundColor,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            alignment: Alignment.center,
                                            child: TextResponsive(
                                              'NEW',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        : Text(''),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : NoMessagesFound();
            },
            failure: (failure) {
              return failure.failure.map(serverError: (_) {
                return GestureDetector(
                  onTap: () {
                    chatsListCubit.getChatsList();
                  },
                  child: Container(
                    child: Center(
                      child: ErrorIndicator(
                        message: SERVER_ERROR_MESSAGE,
                      ),
                    ),
                  ),
                );
              }, noInternet: (_) {
                return GestureDetector(
                  onTap: () {
                    chatsListCubit.getChatsList();
                  },
                  child: Container(
                    child: Center(
                      child: ErrorIndicator(
                        message: NO_INTERNET_MESSAGE,
                      ),
                    ),
                  ),
                );
              });
            });
      },
    );
  }
}

class NoMessagesFound extends StatelessWidget {
  const NoMessagesFound({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(LineAwesomeIcons.dropbox, size: 180.sp, color: Color(0xFFA8AEC0)),
        Txt(
          'No Conversations Yet!',
          style: TxtStyle()
            ..textAlign.center()
            ..fontFamily('Avenir')
            ..fontWeight(FontWeight.w800)
            ..fontSize(20.h)
            ..textColor(
              Color(0xFF7F869A),
            ),
        ),
      ],
    ));
  }
}
