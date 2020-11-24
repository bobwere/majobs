import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/common/routes/router.gr.dart';
import 'package:bonyeza_kazi/src/application/reviews_cubit/reviews_cubit.dart';
import 'package:bonyeza_kazi/src/application/service_provider_details_cubit/sp_details_cubit.dart';
import 'package:bonyeza_kazi/src/infrastructure/categories/models/service_provider_search_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/kt.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListOfServiceProvidersWidget extends StatefulWidget {
  ListOfServiceProvidersWidget({Key key, @required this.serviceProviders})
      : super(key: key);
  final KtList<ServiceProvider> serviceProviders;

  @override
  _ListOfServiceProvidersWidgetState createState() =>
      _ListOfServiceProvidersWidgetState();
}

class _ListOfServiceProvidersWidgetState
    extends State<ListOfServiceProvidersWidget> {
  List<ServiceProvider> newListOfServiceProviders = [];

  @override
  Widget build(BuildContext context) {
    SPDetailsCubit spDetailsCubit = BlocProvider.of<SPDetailsCubit>(context);
    ReviewsCubit reviewsCubit = BlocProvider.of<ReviewsCubit>(context);
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      itemCount: widget.serviceProviders.size,
      itemBuilder: (context, index) {
        final serviceProvider = widget.serviceProviders[index];

        return GestureDetector(
          onTap: () {
            ExtendedNavigator.of(context).push(
              Routes.serviceProviderDetailPage,
              arguments: ServiceProviderDetailPageArguments(
                  serviceProvider: serviceProvider),
            );
            spDetailsCubit.getServiceProviderDetails(id: serviceProvider.id);
            reviewsCubit.getServiceProviderReviews(id: serviceProvider.id);
          },
          child: Container(
            padding: EdgeInsets.only(
                top: 0.h, bottom: 10.h, left: 10.h, right: 10.h),
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15.h)),
                    child: Container(
                      height: 100.h,
                      width: 100.w,
                      child: CachedNetworkImage(
                        width: double.infinity,
                        height: 250.h,
                        imageUrl: serviceProvider.photo,
                        fadeOutDuration: const Duration(milliseconds: 250),
                        fadeInDuration: const Duration(milliseconds: 250),
                        placeholder: (context, url) =>
                            Container(color: randomChoice(kPlaceHolderColors)),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.h,
                  ),
                  Column(
                    children: [
                      SPDetails(
                        name: serviceProvider.username,
                        rating: serviceProvider.clientRating,
                        skills: serviceProvider.skills,
                        location: serviceProvider.location,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Divider(
                height: 2.h,
              )
            ]),
          ),
        );
      },
    );
  }
}

class SPDetails extends StatelessWidget {
  const SPDetails(
      {Key key,
      @required this.name,
      @required this.rating,
      @required this.skills,
      @required this.location})
      : super(key: key);
  final String name;
  final String rating;
  final String skills;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 280.w),
            child: TextResponsive(
              this.name == null ? " " : this.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87),
            ),
          ),
          this.rating == "null"
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextResponsive("No Reviews",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF757575))),
                    SizedBoxResponsive(
                      width: 7,
                    ),
                    ContainerResponsive(
                      height: 4,
                      width: 4,
                      decoration: BoxDecoration(
                          color: Color(0xFF757575),
                          borderRadius: BorderRadius.circular(100)),
                    ),
                    SizedBoxResponsive(
                      width: 7,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 220.w),
                      child: TextResponsive(
                        this.skills == null ? " " : this.skills,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF757575),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextResponsive(this.rating.padRight(2, '.0'),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: kYellowStarColor)),
                    Container(
                      height: 27.h,
                      child: Center(
                        child: SmoothStarRating(
                          starCount: 5,
                          isReadOnly: true,
                          size: 23.sp,
                          rating: (this.rating == "null")
                              ? 0.0
                              : double.tryParse(this.rating),
                          color: kYellowStarColor,
                          borderColor: kYellowStarColor,
                        ),
                      ),
                    ),
                    SizedBoxResponsive(
                      width: 7,
                    ),
                    ContainerResponsive(
                      height: 4,
                      width: 4,
                      decoration: BoxDecoration(
                          color: Color(0xFF757575),
                          borderRadius: BorderRadius.circular(100)),
                    ),
                    SizedBoxResponsive(
                      width: 7,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 150.w),
                      child: TextResponsive(
                        this.skills == null ? " " : this.skills,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF757575),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
        ]);
  }
}
