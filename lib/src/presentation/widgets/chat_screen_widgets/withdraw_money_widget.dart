import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/sp_job_cubit/sp_withdraws_money.dart/sp_withdraws_money_cubit.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/onboarding_page_widgets.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/registration_page_widgets.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bonyeza_kazi/src/application/sp_job_cubit/sp_job_cubit.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart' as load;
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:smart_form/smart_form.dart';

class WithdrawMoneyWidget extends StatefulWidget {
  const WithdrawMoneyWidget({
    Key key,
  }) : super(key: key);

  @override
  _WithdrawMoneyWidgetState createState() => _WithdrawMoneyWidgetState();
}

class _WithdrawMoneyWidgetState extends State<WithdrawMoneyWidget> {
  final _formKey = GlobalKey<SmartFormState>();

  String amount;
  TextEditingController amountController;

  @override
  void initState() {
    amountController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SPWithdrawsMoneyCubit sPWithdrawsMoneyCubit =
        BlocProvider.of<SPWithdrawsMoneyCubit>(context);
    SPJobCubit sPJobCubit = BlocProvider.of<SPJobCubit>(context);

    return BlocConsumer<SPWithdrawsMoneyCubit, SPWithdrawsMoneyState>(
      listener: (context, state) {
        state.maybeMap(
            success: (_) {
              ExtendedNavigator.of(context).pop();
              Flushbar(
                title: 'Completed',
                message: 'Successfully withdrew',
                margin: EdgeInsets.all(20.h),
                flushbarPosition: FlushbarPosition.TOP,
                duration: Duration(seconds: 4),
                isDismissible: true,
                backgroundColor: Colors.green,
                borderRadius: 15.h,
              ).show(context);
              sPJobCubit.getJobStatus();
            },
            error: (state) {
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
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: TextResponsive("Withdraw", style: kAppBarTxtStyle1),
                centerTitle: true,
                backgroundColor: kBlueBackgroundColor,
                elevation: 3.h,
              ),
              body: Center(
                child: SmartForm(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsResponsive.symmetric(horizontal: 20),
                        child: TextField(
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          controller: amountController,
                          onChanged: (value) {
                            amount = value;
                            amountController.text = value;
                          },
                          decoration: InputDecoration(
                            labelText: 'Amount',
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
                      ),
                      SizedBox(height: 20.h),
                      BonyezaButton(
                        backGroundColor: kGreenBackgroundColor,
                        borderRadius: 5,
                        textColor: Colors.white,
                        text: 'WITHDRAW',
                        onButtonPressed: () {
                          var withdrawAmount =
                              int.tryParse(amountController.text);
                          if (amountController.text.isNotEmpty) {
                            sPWithdrawsMoneyCubit
                                .spWithdrawsMoney(withdrawAmount);
                          } else {
                            Flushbar(
                              title: 'Unable to submit',
                              message: 'Provide the missing details to proceed',
                              margin: EdgeInsets.all(20.h),
                              flushbarPosition: FlushbarPosition.TOP,
                              duration: Duration(seconds: 3),
                              isDismissible: true,
                              backgroundColor: Color(0xFFFD9726),
                              borderRadius: 15.h,
                            ).show(context);
                          }
                        },
                      ),
                      SizedBox(height: 100.h),
                      BlocBuilder<SPWithdrawsMoneyCubit, SPWithdrawsMoneyState>(
                          builder: (context, state) {
                        return state.maybeMap(
                            loading: (_) => Center(
                                  child: Container(
                                    height: 50.h,
                                    width: 50.h,
                                    child: load.LoadingIndicator(
                                        indicatorType:
                                            load.Indicator.ballTrianglePath,
                                        color: kBlueBackgroundColor),
                                  ),
                                ),
                            orElse: () => Container());
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
