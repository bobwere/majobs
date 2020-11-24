import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ReviewsDetailCard extends StatelessWidget {
  const ReviewsDetailCard({
    Key key,
    @required this.title,
    @required this.rating,
    @required this.comments,
  }) : super(key: key);
  final String title;
  final String rating;
  final String comments;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
      shadowColor: kBoxShadowColor.shade300,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.h),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: TextResponsive(this.title ?? " ",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 21,
                    color: Colors.black87)),
          ),
          SizedBox(
            height: 10.h,
          ),
          this.rating == null
              ? Container()
              : Padding(
                  padding: EdgeInsetsResponsive.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextResponsive(
                        this.rating.padRight(2, '.0'),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: kYellowStarColor),
                      ),
                      Container(
                        height: 27.h,
                        child: Center(
                          child: SmoothStarRating(
                            starCount: 5,
                            isReadOnly: true,
                            size: 23.sp,
                            rating: (this.rating == null)
                                ? 0.0
                                : double.tryParse(this.rating),
                            color: kYellowStarColor,
                            borderColor: kYellowStarColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          SizedBox(
            height: 10.h,
          ),
          this.comments == null
              ? Container()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: TextResponsive(this.comments ?? " ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 21,
                          color: Colors.black54)),
                ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
