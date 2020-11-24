import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/job_journey/sp_request_time_extension_cubit/sp_request_time_extension_cubit.dart';
import 'package:bonyeza_kazi/src/application/job_journey/client_approves_work_cubit/client_approves_work_cubit.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/chatroom_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/message_model.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/registration_page_widgets.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:bonyeza_kazi/src/application/sp_job_cubit/sp_job_cubit.dart';
import 'package:loading_indicator/loading_indicator.dart' as load;

class ClientRejectsWork extends StatefulWidget {
  const ClientRejectsWork(
      {Key key,
      @required this.chatRoom,
      @required this.isMe,
      @required this.message})
      : super(key: key);

  final Message message;
  final bool isMe;
  final ChatRoom chatRoom;

  @override
  _ClientRejectsWorkState createState() => _ClientRejectsWorkState();
}

class _ClientRejectsWorkState extends State<ClientRejectsWork> {
  TextEditingController reasonController;

  @override
  void initState() {
    reasonController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ClientApprovesWorkCubit clientApprovesWorkCubit =
        BlocProvider.of<ClientApprovesWorkCubit>(context);
    SPJobCubit sPJobCubit = BlocProvider.of<SPJobCubit>(context);
    return BlocConsumer<ClientApprovesWorkCubit, ClientApprovesWorkState>(
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
                }, (success) {
                  sPJobCubit.getJobStatus();
                  ExtendedNavigator.of(context).pop();
                }));
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: TextResponsive("Disapprove work done",
                    style: kAppBarTxtStyle1),
                centerTitle: true,
                backgroundColor: kBlueBackgroundColor,
                elevation: 3.h,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsetsResponsive.all(20),
                  child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBoxResponsive(
                        height: 150,
                      ),
                      TextField(
                        minLines: null,
                        onChanged: (value) {
                          reasonController.text = value;
                          clientApprovesWorkCubit.reasonChanged(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Reason',
                          hintText: 'e.g. you have not finished...',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                          ),
                          labelStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade400,
                                width: 1.h,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                          ),
                        ),
                      ),
                      SizedBoxResponsive(height: 20.0),
                      ContainerResponsive(
                        height: 55,
                        widthResponsive: false,
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButtonResponsive(
                            color: kGreenBackgroundColor,
                            child: TextResponsive('Submit',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500)),
                            onPressed: () {
                              if (reasonController.text.isNotEmpty) {
                                clientApprovesWorkCubit.clientDisapprovesWork(
                                    widget.message.workID,
                                    widget.chatRoom,
                                    widget.message);
                              } else {
                                Flushbar(
                                  title: 'An Error Occurred',
                                  message: 'Please provide the missing details',
                                  margin: EdgeInsets.all(20.h),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  duration: Duration(seconds: 3),
                                  isDismissible: true,
                                  backgroundColor: Color(0xFFFD9726),
                                  borderRadius: 15.h,
                                ).show(context);
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SubmittingOverlay(isSubmitting: state.isSubmitting),
            state.isSubmitting
                ? Center(
                    child: Container(
                      height: 50.h,
                      width: 50.h,
                      child: load.LoadingIndicator(
                          indicatorType: load.Indicator.ballTrianglePath,
                          color: kBlueBackgroundColor),
                    ),
                  )
                : Container()
          ],
        );
      },
    );
  }
}
