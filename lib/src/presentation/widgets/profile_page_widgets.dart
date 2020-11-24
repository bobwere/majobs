import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/common/routes/router.gr.dart';
import 'package:bonyeza_kazi/src/application/chat/instant_messaging_cubit/instant_messaging_cubit.dart';
import 'package:bonyeza_kazi/src/application/sp_job_cubit/sp_job_cubit.dart';
import 'package:bonyeza_kazi/src/application/update_user_profile_cubit/update_user_profile_cubit.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/chatroom_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_paid_jobs.dart';
import 'package:bonyeza_kazi/src/services/get_client_sp_chatroom.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:division/division.dart';
import 'package:flushbar/flushbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:loading_indicator/loading_indicator.dart' as load;
import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  static const String InviteFriends = 'Invite Friends';
  static const String UpdateProfile = 'Update Profile';
  static const String SignOut = 'Sign out';
  static const List<String> choices = <String>[
    InviteFriends,
    UpdateProfile,
    SignOut
  ];
}

class UserProfilePicAndDetails extends StatefulWidget {
  UserProfilePicAndDetails(
      {Key key,
      @required this.username,
      @required this.padding,
      @required this.containerHeight})
      : super(key: key);
  final String username;
  final double padding;
  final double containerHeight;

  @override
  _UserProfilePicAndDetailsState createState() =>
      _UserProfilePicAndDetailsState();
}

class _UserProfilePicAndDetailsState extends State<UserProfilePicAndDetails> {
  String userPhoto;
  File _image;
  final picker = ImagePicker();

  @override
  void initState() {
    getUserPhoto().then((value) => userPhoto = value);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SPJobCubit spJobCubit = BlocProvider.of<SPJobCubit>(context);
    return BlocListener<UpdateUserProfileCubit, UpdateUserProfileState>(
      listener: (context, state) {
        state.userUpdateFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold((failure) {
                  failure.map(
                    serverError: (_) {
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
                    },
                    noInternet: (_) {
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
                    },
                  );
                }, (_) async {
                  Flushbar(
                    title: 'Update Successful',
                    message: ' ',
                    margin: EdgeInsets.all(20.h),
                    flushbarPosition: FlushbarPosition.TOP,
                    duration: Duration(seconds: 3),
                    isDismissible: true,
                    backgroundColor: Colors.green,
                    borderRadius: 15.h,
                  ).show(context);
                  await updateImage();
                }));
        if (state.isSubmitting) {
          Flushbar(
            title: 'Attempting to update your details',
            message: 'Please wait a moment...',
            margin: EdgeInsets.all(20.h),
            flushbarPosition: FlushbarPosition.TOP,
            duration: Duration(seconds: 3),
            isDismissible: true,
            backgroundColor: Colors.green,
            borderRadius: 15.h,
          ).show(context);
        }
      },
      child: ContainerResponsive(
        padding: EdgeInsetsResponsive.only(top: widget.padding),
        height: widget.containerHeight,
        color: kBlueBackgroundColor,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    overflow: Overflow.visible,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.h),
                        child: Parent(
                            style: ParentStyle()
                              ..height(100.h)
                              ..width(100.h)
                              ..borderRadius(all: 12.h)
                              ..background.color(Colors.white),
                            child: FutureBuilder<String>(
                                future: getUserPhoto(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return CachedNetworkImage(
                                        fit: BoxFit.cover, imageUrl: userPhoto);
                                  } else {
                                    return Icon(
                                      LineAwesomeIcons.user_1,
                                      color: kBlueBackgroundColor,
                                      size: 90.h,
                                    );
                                  }
                                })),
                      ),
                      Positioned(
                        bottom: 0.h,
                        right: -20.h,
                        child: GestureDetector(
                          onTap: () async {
                            await getImage(context);
                          },
                          child: Parent(
                            style: ParentStyle()
                              ..width(50.h)
                              ..height(50.h)
                              ..background.color(Colors.white)
                              ..borderRadius(all: 50.h),
                            child: Center(
                              child: Icon(
                                LineAwesomeIcons.camera,
                                size: 40.sp,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 30.h,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Txt(this.widget.username,
                          style: TxtStyle()
                            ..fontWeight(FontWeight.w500)
                            ..textColor(Colors.white)
                            ..fontSize(25.sp)),
                    ],
                  ),
                  Spacer(),
                  BlocBuilder<SPJobCubit, SPJobState>(
                      builder: (context, state) {
                    return state.maybeMap(
                        loading: (_) {
                          return ContainerResponsive();
                        },
                        orElse: () => GestureDetector(
                              onTap: () {
                                Flushbar(
                                  title: 'Refreshing your job status detail',
                                  message: 'Please wait a moment...',
                                  margin: EdgeInsets.all(20.h),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  duration: Duration(seconds: 3),
                                  isDismissible: true,
                                  backgroundColor: Colors.green,
                                  borderRadius: 15.h,
                                ).show(context);
                                spJobCubit.getJobStatus();
                              },
                              child: ContainerResponsive(
                                padding: EdgeInsets.only(right: 20, left: 20),
                                child: Icon(
                                  Icons.refresh,
                                  color: Colors.white,
                                  size: 30.h,
                                ),
                              ),
                            ));
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getImage(BuildContext context) async {
    final UpdateUserProfileCubit updateUserProfileCubit =
        BlocProvider.of<UpdateUserProfileCubit>(context);
    PickedFile pickedFile;
    try {
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    } on Exception catch (e) {
      print(e.toString());
    }
    if (!mounted) return;

    setState(() {
      _image = File(pickedFile.path);
    });
    updateUserProfileCubit.photoChanged(_image);
    updateUserProfileCubit.updateProfilePic();
  }

  Future<void> updateImage() async {
    String userPic = await getUserPhoto();

    setState(() {
      userPhoto = userPic;
    });
  }

  Future<String> getUserPhoto() async {
    final pref = await SharedPreferences.getInstance();
    String username = pref.getString(USER_PHOTO_URL);
    return username;
  }
}

class SPBalanceAndActionButtions extends StatefulWidget {
  SPBalanceAndActionButtions({Key key}) : super(key: key);

  @override
  _SPBalanceAndActionButtionsState createState() =>
      _SPBalanceAndActionButtionsState();
}

class _SPBalanceAndActionButtionsState
    extends State<SPBalanceAndActionButtions> {
  String spBalance = '';

  @override
  Widget build(BuildContext context) {
    return ContainerResponsive(
      height: 140,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          offset: Offset(0, 2),
          blurRadius: kBoxShadowBlur,
          color: kBoxShadowColor.shade300,
        )
      ]),
      padding: EdgeInsetsResponsive.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              TextResponsive(
                'Current Balance',
                style: TextStyle(color: Colors.grey, fontSize: 25),
              ),
              SizedBoxResponsive(
                width: 30,
              ),
              BlocBuilder<SPJobCubit, SPJobState>(builder: (context, state) {
                return state.maybeMap(
                    jobStatus: (state) {
                      spBalance = state.spBalance.toString();
                      return TextResponsive(
                        "Ksh. $spBalance",
                        style: TextStyle(color: Colors.grey, fontSize: 30),
                      );
                    },
                    orElse: () => TextResponsive("Ksh. $spBalance",
                        style: TextStyle(color: Colors.grey, fontSize: 30)));
              }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MaterialButton(
                    color: kBlueBackgroundColor,
                    child: TextResponsive('Transactions',
                        style: TextStyle(color: Colors.white, fontSize: 14)),
                    onPressed: () {}),
              ),
              SizedBoxResponsive(width: 10),
              Expanded(
                child: MaterialButton(
                    color: kBlueBackgroundColor,
                    child: TextResponsive('Deposit',
                        style: TextStyle(color: Colors.white, fontSize: 14)),
                    onPressed: () {}),
              ),
              SizedBoxResponsive(width: 10),
              Expanded(
                child: MaterialButton(
                    color: kGreenBackgroundColor,
                    child: TextResponsive('Withdraw',
                        style: TextStyle(color: Colors.white, fontSize: 14)),
                    onPressed: () {
                      ExtendedNavigator.of(context)
                          .push(Routes.withdrawMoneyWidget);
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}

class JobStatusButtons extends StatefulWidget {
  const JobStatusButtons({Key key}) : super(key: key);

  @override
  _JobStatusButtonsState createState() => _JobStatusButtonsState();
}

class _JobStatusButtonsState extends State<JobStatusButtons> {
  String noNewJobs = '';
  String noJobsPending = '';
  String noRejectedJobs = '';
  String noJobsInProgress = '';
  String noJobsUnpaidg = '';
  String noJobsPaid = '';

  @override
  Widget build(BuildContext context) {
    SPJobCubit spJobCubit = BlocProvider.of<SPJobCubit>(context);
    return ContainerResponsive(
      padding: EdgeInsetsResponsive.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MaterialButton(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextResponsive('New Jobs',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 14)),
                        BlocBuilder<SPJobCubit, SPJobState>(
                            builder: (context, state) {
                          return state.maybeMap(
                              jobStatus: (state) {
                                noNewJobs = state.spNewJobs.toString();
                                return TextResponsive(
                                  noNewJobs,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 14),
                                );
                              },
                              orElse: () => TextResponsive(noNewJobs,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 14)));
                        }),
                      ],
                    ),
                    onPressed: () {
                      spJobCubit.getNewJobs();
                    }),
              ),
              SizedBoxResponsive(width: 10),
              Expanded(
                child: MaterialButton(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextResponsive('Pending',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 14)),
                        BlocBuilder<SPJobCubit, SPJobState>(
                            builder: (context, state) {
                          return state.maybeMap(
                              jobStatus: (state) {
                                noJobsPending = state.spPendingJobs.toString();
                                return TextResponsive(
                                  noJobsPending,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 14),
                                );
                              },
                              orElse: () => TextResponsive(
                                  noJobsPending.toString(),
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 14)));
                        }),
                      ],
                    ),
                    onPressed: () {
                      spJobCubit.getPendingJobs();
                    }),
              ),
              SizedBoxResponsive(width: 10),
              Expanded(
                child: MaterialButton(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextResponsive('Rejected',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 14)),
                        BlocBuilder<SPJobCubit, SPJobState>(
                            builder: (context, state) {
                          return state.maybeMap(
                              jobStatus: (state) {
                                noRejectedJobs =
                                    state.spRejectedJobs.toString();
                                return TextResponsive(
                                  noRejectedJobs,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 14),
                                );
                              },
                              orElse: () => TextResponsive(noRejectedJobs,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 14)));
                        }),
                      ],
                    ),
                    onPressed: () {
                      spJobCubit.getRejectedJobs();
                    }),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MaterialButton(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextResponsive('In Progress',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 14)),
                        BlocBuilder<SPJobCubit, SPJobState>(
                            builder: (context, state) {
                          return state.maybeMap(
                              jobStatus: (state) {
                                noJobsInProgress =
                                    state.spInProgressJobs.toString();
                                return TextResponsive(
                                  noJobsInProgress,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 14),
                                );
                              },
                              orElse: () => TextResponsive(noJobsInProgress,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 14)));
                        }),
                      ],
                    ),
                    onPressed: () {
                      spJobCubit.getInProgressJobs();
                    }),
              ),
              SizedBoxResponsive(width: 10),
              Expanded(
                child: MaterialButton(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextResponsive('Unpaid Jobs',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 14)),
                        BlocBuilder<SPJobCubit, SPJobState>(
                            builder: (context, state) {
                          return state.maybeMap(
                              jobStatus: (state) {
                                noJobsUnpaidg = state.spUnpaidJobs.toString();
                                return TextResponsive(
                                  noJobsUnpaidg,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 14),
                                );
                              },
                              orElse: () => TextResponsive(noJobsUnpaidg,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 14)));
                        }),
                      ],
                    ),
                    onPressed: () {
                      spJobCubit.getUnpaidJobs();
                    }),
              ),
              SizedBoxResponsive(width: 10),
              Expanded(
                child: MaterialButton(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextResponsive('Paid Jobs',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 14)),
                        BlocBuilder<SPJobCubit, SPJobState>(
                            builder: (context, state) {
                          return state.maybeMap(
                              jobStatus: (state) {
                                noJobsPaid = state.spPaidJobs.toString();
                                return TextResponsive(
                                  noJobsPaid,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 14),
                                );
                              },
                              orElse: () => TextResponsive(noJobsPaid,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 14)));
                        }),
                      ],
                    ),
                    onPressed: () {
                      spJobCubit.getPaidJobs();
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class JobStatusInformationList extends StatelessWidget {
  const JobStatusInformationList({Key key, @required this.userTypeID})
      : super(key: key);
  final String userTypeID;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SPJobCubit, SPJobState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          newJob: (state) {
            final list = state.spNewJobs.newJobs;

            return JobsDetailsList(
              jobStageTitle: 'new jobs',
              jobDetails: list,
              userTypeID: userTypeID,
              userID: state.userID,
            );
          },
          pending: (state) {
            final list = state.spPendingJobs.pendingJobs;

            return JobsDetailsList(
              jobStageTitle: 'pending jobs',
              jobDetails: list,
              userTypeID: userTypeID,
              userID: state.userID,
            );
          },
          rejected: (state) {
            final list = state.spRejectedJobs.rejectedJobs;

            return JobsDetailsList(
              jobStageTitle: 'rejected jobs',
              jobDetails: list,
              userTypeID: userTypeID,
              userID: state.userID,
            );
          },
          inProgress: (state) {
            final list = state.spInProgressJobs.inProgressJobs;

            return JobsDetailsList(
              jobStageTitle: 'in progress jobs',
              jobDetails: list,
              userTypeID: userTypeID,
              userID: state.userID,
            );
          },
          unpaid: (state) {
            final list = state.spUnpaidJobs.unpaidJobs;

            return JobsDetailsList(
              jobStageTitle: 'unpaid jobs',
              jobDetails: list,
              userTypeID: userTypeID,
              userID: state.userID,
            );
          },
          paid: (state) {
            List<PaidJob> list = state.spPaidJobs.paidJobs;
            return JobsDetailsList(
              jobStageTitle: 'paid jobs',
              jobDetails: list,
              userTypeID: userTypeID,
              userID: state.userID,
            );
          },
          loading: (state) {
            return Expanded(
              child: Center(
                child: Container(
                  height: 50.h,
                  width: 50.h,
                  child: load.LoadingIndicator(
                      indicatorType: load.Indicator.ballTrianglePath,
                      color: kBlueBackgroundColor),
                ),
              ),
            );
          },
          error: (state) {
            return state.failure.map(serverError: (_) {
              return Container();
            }, noInternet: (_) {
              return Container();
            });
          },
          jobStatus: (_) => Container(),
        );
      },
    );
  }
}

class JobsDetailsList extends StatelessWidget {
  const JobsDetailsList({
    Key key,
    @required this.jobStageTitle,
    @required this.jobDetails,
    @required this.userTypeID,
    @required this.userID,
  }) : super(key: key);
  final String jobStageTitle;
  final List<dynamic> jobDetails;
  final String userTypeID;
  final String userID;

  @override
  Widget build(BuildContext context) {
    GetChatroomService getChatroomService =
        Provider.of<GetChatroomService>(context);
    InstantMessagingCubit instantMessagingCubit =
        BlocProvider.of<InstantMessagingCubit>(context);
    return jobDetails.length != 0
        ? Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 0, bottom: 70.h),
              itemCount: jobDetails.length,
              itemBuilder: (context, index) {
                final job = jobDetails[index];
                String title = job.workTitle;
                String workTitle;
                List<String> listoOfStrings = title.split("_");
                if (userTypeID == '4') {
                  workTitle = listoOfStrings[1];
                } else {
                  workTitle = listoOfStrings[0];
                }
                return GestureDetector(
                  onTap: () async {
                    var chatroomOrFailure =
                        await getChatroomService.getClientSpChatroom(
                            clientID: job.clientId, spID: job.workerId);
                    chatroomOrFailure.fold((l) => Container(),
                        (ChatRoom chatroom) {
                      ChatUser senderChatUser;
                      bool unread =
                          chatroom.unread && chatroom.currentTextFrom != userID;

                      if (chatroom.chatUsersDetails[0].id == userID) {
                        senderChatUser = chatroom.chatUsersDetails[1];
                      } else {
                        senderChatUser = chatroom.chatUsersDetails[0];
                      }
                      ExtendedNavigator.of(context).push(
                        Routes.chatScreen,
                        arguments: ChatScreenArguments(
                          otherUser: senderChatUser,
                          chatroomID: chatroom.chatroomId,
                          unread: unread,
                          chatroom: chatroom,
                        ),
                      );
                      instantMessagingCubit.getMessages(chatroom.chatroomId);
                    });
                  },
                  child: ListTile(
                    dense: true,
                    title: TextResponsive(
                      workTitle,
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    subtitle: TextResponsive(job.location,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54)),
                  ),
                );
              },
            ),
          )
        : NoJobsFound(typeOfJob: jobStageTitle);
  }
}

class NoJobsFound extends StatelessWidget {
  const NoJobsFound({Key key, @required this.typeOfJob}) : super(key: key);
  final String typeOfJob;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(LineAwesomeIcons.dropbox, size: 180.sp, color: Color(0xFFA8AEC0)),
        TextResponsive('No $typeOfJob found!',
            style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w500,
                color: Color(0xFF7F869A))),
      ],
    ));
  }
}
