import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/auth_cubit/auth_cubit.dart';
import 'package:bonyeza_kazi/src/application/registration_cubit/registration_cubit.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/onboarding_page_widgets.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/registration_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:smart_form/smart_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClientRegistrationBody extends StatefulWidget {
  const ClientRegistrationBody({Key key, @required this.state})
      : super(key: key);
  final RegistrationState state;

  @override
  _ClientRegistrationBodyState createState() => _ClientRegistrationBodyState();
}

class _ClientRegistrationBodyState extends State<ClientRegistrationBody> {
  final _formKey = GlobalKey<SmartFormState>();
  String password;
  String confirmpassword;

  @override
  Widget build(BuildContext context) {
    final RegistrationCubit registrationCubit =
        BlocProvider.of<RegistrationCubit>(context);
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

    return Stack(
      children: [
        SmartForm(
          key: _formKey,
          autovalidate: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBoxResponsive(
                  height: 90,
                ),

                //IMAGE OF NYAKUA
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: Image.asset(
                      'assets/images/NYAKUA.png',
                      width: 500.w,
                      height: 190.h,
                    ),
                  ),
                ),

                SizedBoxResponsive(
                  height: 50,
                ),

                //INPUT USERNAME
                BonyezaRegistrationField(
                  hintText: 'Your Name',
                  validationErrorText: 'Please enter username',
                  onChanged: (value) {
                    registrationCubit.usernameChanged(value);
                  },
                ),

                SizedBoxResponsive(
                  height: 20,
                ),

                //INPUT COUNTRY CODE AND PHONE NUMBER
                Row(
                  children: [
                    CountryCodeField(),
                    Expanded(
                      child: BonyezaRegistrationField(
                        hintText: '7** *** ***',
                        validationErrorText: 'Please enter phone',
                        onChanged: (value) {
                          registrationCubit.phoneChanged(value);
                        },
                      ),
                    ),
                  ],
                ),

                SizedBoxResponsive(
                  height: 20,
                ),

                //INPUT EMAIL ADDRESS
                BonyezaRegistrationField(
                  hintText: 'Email address',
                  validationErrorText: 'Please enter email address',
                  onChanged: (value) {
                    registrationCubit.emailChanged(value);
                  },
                ),

                SizedBoxResponsive(
                  height: 20,
                ),

                //INPUT PASSWORD
                BonyezaRegistrationField(
                  hintText: 'Password',
                  validationErrorText: 'Please enter password',
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                ),

                SizedBoxResponsive(
                  height: 20,
                ),

                //INPUT PASSWORD CONFIRMATION
                BonyezaRegistrationField(
                  hintText: 'Confirm Password',
                  validationErrorText: 'Please enter password',
                  obscureText: true,
                  onChanged: (value) {
                    confirmpassword = value;
                    registrationCubit.passwordChanged(value);
                  },
                ),

                SizedBoxResponsive(
                  height: 20,
                ),

                //REGISTRATION BUTTON
                BonyezaButton(
                  backGroundColor: kGreenBackgroundColor,
                  textColor: Colors.white,
                  borderRadius: 100,
                  text: 'Register',
                  onButtonPressed: () {
                    if (password != confirmpassword) {
                      flushbarPasswordNotMatching.show(context);
                    } else {
                      if (_formKey.currentState.validate()) {
                        registrationCubit
                            .registerAsClientWithUsernameAndPassword();
                      } else {
                        flushbarMissingDetail.show(context);
                      }
                    }
                  },
                ),

                SizedBoxResponsive(
                  height: 7,
                ),

                //REGISTER AS SERVICE PROVIDER
                Align(
                  alignment: Alignment.center,
                  child: SizedBoxResponsive(
                    height: 40,
                    child: RaisedButtonResponsive(
                      splashColor: Colors.white,
                      highlightColor: Colors.white,
                      hoverColor: Colors.white,
                      highlightElevation: 0,
                      hoverElevation: 0,
                      elevation: 0,
                      child: Center(
                        child: TextResponsive(
                            '- Or Register as Service Provider -',
                            style: TextStyle(
                              fontSize: 21,
                              color: Colors.grey.shade600,
                            )),
                      ),
                      color: Colors.white,
                      onPressed: () {
                        authCubit.registerSP();
                      },
                    ),
                  ),
                ),

                //HAS ACCOUNT NAVIGATE TO LOGIN PAGE
                SizedBoxResponsive(
                  height: 40,
                  child: AlreadyHaveAnAccount(
                    onTextPressed: () {
                      authCubit.loginInUser();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),

        //IF LOADING SHOW LOADING INDICATOR ELSE SHOW EMPTY COONTAINER
        Positioned(
          bottom: 215.h,
          left: 220.w,
          child: BlocBuilder<RegistrationCubit, RegistrationState>(
            builder: (context, state) {
              if (state.isSubmitting) {
                return Container(
                  height: 50.h,
                  width: 50.h,
                  child: LoadingIndicator(
                      indicatorType: Indicator.ballTrianglePath,
                      color: kBlueBackgroundColor),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ],
    );
  }
}
