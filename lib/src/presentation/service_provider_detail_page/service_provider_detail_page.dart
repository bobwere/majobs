import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/favourites_cubit/favourites_creation_cubit.dart';
import 'package:bonyeza_kazi/src/infrastructure/categories/models/service_provider_search_model.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/service_provider_detail_page_widgets/overview_tab_widget.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/service_provider_detail_page_widgets/photos_tab_widget.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/service_provider_detail_page_widgets/reviews_tab_widget.dart';
import 'package:bonyeza_kazi/src/application/chat/instant_messaging_cubit/instant_messaging_cubit.dart';
import 'package:bonyeza_kazi/src/application/job_journey/client_job_description_cubit/job_description_cubit.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/chatroom_model.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/src/services/get_client_sp_chatroom.dart';
import 'package:bonyeza_kazi/common/routes/router.gr.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:division/division.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class ServiceProviderDetailPage extends StatefulWidget {
  const ServiceProviderDetailPage({Key key, @required this.serviceProvider})
      : super(key: key);
  final ServiceProvider serviceProvider;
  @override
  _ServiceProviderDetailPageState createState() =>
      _ServiceProviderDetailPageState();
}

class _ServiceProviderDetailPageState extends State<ServiceProviderDetailPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GetChatroomService getChatroomService =
        Provider.of<GetChatroomService>(context);
    InstantMessagingCubit instantMessagingCubit =
        BlocProvider.of<InstantMessagingCubit>(context);
    return Scaffold(
        body: BlocListener<JobDescriptionCubit, JobDescriptionState>(
      listener: (context, state) {
        state.bookingFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {},
            (jobDescription) async {
              var chatroomOrFailure =
                  await getChatroomService.getClientSpChatroom(
                      clientID: jobDescription.clientId,
                      spID: jobDescription.workerId);
              chatroomOrFailure.fold((l) => Container(), (ChatRoom chatroom) {
                ChatUser senderChatUser;
                bool unread = chatroom.unread &&
                    chatroom.currentTextFrom != jobDescription.workerId;

                if (chatroom.chatUsersDetails[0].id ==
                    jobDescription.workerId) {
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
          ),
        );
      },
      child: BlocListener<FavouritesCreationCubit, FavouritesCreationState>(
          listener: (context, state) {
            state.maybeMap(
                successfullyCreated: (_) {
                  Flushbar(
                    title: 'Successfully Saved',
                    message: 'Added to your favourites',
                    margin: EdgeInsets.all(20.h),
                    flushbarPosition: FlushbarPosition.TOP,
                    duration: Duration(seconds: 3),
                    isDismissible: true,
                    backgroundColor: Colors.green,
                    borderRadius: 15.h,
                  ).show(context);
                },
                failure: (state) {
                  state.failure.map(serverError: (_) {
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
                },
                orElse: () {});
          },
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              List<String> imageUrls = [];
              try {
                if (widget.serviceProvider.images.contains("|")) {
                  final imageUrlStr =
                      widget.serviceProvider.images.split(" ").join("");

                  final imageUrlls = imageUrlStr.split(("|"));

                  imageUrls.addAll(imageUrlls);
                } else {
                  imageUrls.add(widget.serviceProvider.images);
                }
              } catch (e) {}

              return <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    title: TextResponsive(
                        widget.serviceProvider.username ?? " ",
                        style: kAppBarTxtStyle2),
                    backgroundColor: Colors.white,
                    iconTheme: ThemeData()
                        .primaryIconTheme
                        .copyWith(color: Colors.black87),
                    pinned: true,
                    expandedHeight: 400.h,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBoxResponsive(height: 90),
                              SizedBoxResponsive(
                                height: 190,
                                child: ListView.builder(
                                  padding: EdgeInsets.fromLTRB(
                                      20.h, 20.h, 0.h, 20.h),
                                  itemCount: imageUrls.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Parent(
                                      style: ParentStyle()
                                        ..boxShadow(
                                          color: kBoxShadowColor,
                                          offset: kBoxShadowOffset,
                                          blur: kBoxShadowBlur,
                                        )
                                        ..width(200.h)
                                        ..borderRadius(all: 15.h)
                                        ..margin(right: 20.h)
                                        ..background.color(Colors.green),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.h)),
                                        child: CachedNetworkImage(
                                          width: double.infinity,
                                          height: 200.h,
                                          imageUrl: imageUrls[index],
                                          placeholder: (context, url) {
                                            return Container(
                                              color: randomChoice<Color>(
                                                  kPlaceHolderColors),
                                            );
                                          },
                                          fadeOutDuration:
                                              const Duration(milliseconds: 250),
                                          fadeInDuration:
                                              const Duration(milliseconds: 250),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsResponsive.symmetric(
                                            horizontal: 20),
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  80.w),
                                          child: TextResponsive(
                                            widget.serviceProvider.username ??
                                                " ",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBoxResponsive(height: 5),
                                      Padding(
                                        padding: EdgeInsetsResponsive.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            TextResponsive(
                                                widget.serviceProvider
                                                            .clientRating !=
                                                        "null"
                                                    ? widget.serviceProvider
                                                        .clientRating
                                                        .padRight(2, '.0')
                                                    : 'No Reviews',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400,
                                                    color: kYellowStarColor)),
                                            SizedBoxResponsive(width: 10),
                                            Container(
                                              height: 27.h,
                                              child: Center(
                                                child: SmoothStarRating(
                                                  starCount: 5,
                                                  isReadOnly: true,
                                                  size: 23.sp,
                                                  rating: (widget
                                                              .serviceProvider
                                                              .clientRating ==
                                                          "null")
                                                      ? 0.0
                                                      : double.tryParse(widget
                                                          .serviceProvider
                                                          .clientRating),
                                                  color: kYellowStarColor,
                                                  borderColor: kYellowStarColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBoxResponsive(height: 5),
                                      Padding(
                                        padding: EdgeInsetsResponsive.symmetric(
                                            horizontal: 20),
                                        child: ConstrainedBox(
                                          constraints:
                                              BoxConstraints(maxWidth: 300.h),
                                          child: TextResponsive(
                                              widget.serviceProvider.skills ??
                                                  ' ',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.grey.shade700)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  widget.serviceProvider.photo != null
                                      ? Padding(
                                          padding:
                                              EdgeInsetsResponsive.symmetric(
                                                  horizontal: 20),
                                          child: CircleAvatar(
                                            radius: 45.h,
                                            backgroundImage: NetworkImage(
                                                widget.serviceProvider.photo),
                                          ),
                                        )
                                      : Padding(
                                          padding:
                                              EdgeInsetsResponsive.symmetric(
                                                  horizontal: 20),
                                          child: CircleAvatar(
                                            radius: 45.h,
                                            backgroundColor:
                                                kBlueBackgroundColor,
                                          ),
                                        ),
                                ],
                              ),
                            ],
                          )),
                    ),
                    forceElevated: innerBoxIsScrolled,
                    bottom: TabBar(
                      controller: _controller,
                      indicator: MaterialIndicator(
                        color: kBlueBackgroundColor,
                      ),
                      indicatorColor: kBlueBackgroundColor,
                      labelColor: kBlueBackgroundColor,
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                      unselectedLabelColor: CupertinoColors.systemGrey,
                      isScrollable: true,
                      tabs: <Widget>[
                        Tab(
                          text: "OVERVIEW",
                        ),
                        Tab(
                          text: "PHOTOS",
                        ),
                        Tab(
                          text: "REVIEWS",
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(controller: _controller, children: [
              OverviewTab(
                serviceProvider: widget.serviceProvider,
              ),
              PhotosTabWidget(
                serviceProvider: widget.serviceProvider,
              ),
              ReviewsTabWidget(serviceProvider: widget.serviceProvider),
            ]),
          )),
    ));
  }
}
