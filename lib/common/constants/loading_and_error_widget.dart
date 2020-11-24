import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:loading_indicator/loading_indicator.dart' as load;

class LoadingBallIndicator extends StatelessWidget {
  const LoadingBallIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ContainerResponsive(
        height: 50,
        width: 50,
        child: load.LoadingIndicator(
            indicatorType: load.Indicator.ballTrianglePath,
            color: kBlueBackgroundColor),
      ),
    );
  }
}

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({Key key, @required this.message}) : super(key: key);
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ContainerResponsive(
        width: 300,
        height: 150,
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        margin: EdgeInsets.symmetric(vertical: 50.h),
        decoration: BoxDecoration(
            color: Color(0xFFFD9726),
            borderRadius: BorderRadius.all(Radius.circular(15.h)),
            boxShadow: [
              BoxShadow(
                  color: kBoxShadowColor,
                  offset: kBoxShadowOffset,
                  blurRadius: kBoxShadowBlur)
            ]),
        child: Center(
          child: TextResponsive(
            message + "\nTap to retry",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 21, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
