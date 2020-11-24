import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/chat/chats_list_cubit/chats_list_cubit.dart';
import 'package:bonyeza_kazi/src/presentation/messages_page/recent_messages_widget.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ChatsListCubit>(context)..getChatsList();
    return Scaffold(
      appBar: AppBar(
        title: TextResponsive("Messages", style: kAppBarTxtStyle1),
        centerTitle: true,
        backgroundColor: kBlueBackgroundColor,
        elevation: 3.h,
      ),
      body: RecentMessages(),
    );
  }
}
