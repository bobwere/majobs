import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/auth_cubit/auth_cubit.dart';
import 'package:bonyeza_kazi/src/application/chat/chats_list_cubit/chats_list_cubit.dart';
import 'package:bonyeza_kazi/src/application/favourites_cubit/favourites_cubit.dart';
import 'package:bonyeza_kazi/src/application/login_cubit/login_cubit.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/login_page_widgets.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/onboarding_page_widgets.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/registration_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:smart_form/smart_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    final ChatsListCubit chatsListCubit =
        BlocProvider.of<ChatsListCubit>(context);
    final FavouritesCubit favouritesCubit =
        BlocProvider.of<FavouritesCubit>(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              failure.map(
                  serverError: (_) => flushbarServerFailure.show(context),
                  noInternet: (_) => flushbarNoInternet.show(context),
                  userNotFound: (_) => flushbarUserNotFound.show(context),
                  formValidation: (_) {});
            },
            (success) {
              flushbarLoginSuccess.show(context);
              //LOG THE USER IN
              authCubit.logIn();
              //FETCH RECENT CHATS
              chatsListCubit.getChatsList();
              //FETCH FAVOURITE SERVICE PROVIDERS OF THE USER
              favouritesCubit.getMyFavourites();
            },
          ),
        );
        if (state.isSubmitting) {
          flushbarLoginAttempt.show(context);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            //LOGIN FORM
            LoginBody(state: state),
            //SHOW DARKEN OVERLAY IF SUBMITING FORM INFORMATION
            SubmittingOverlay(isSubmitting: state.isSubmitting)
          ],
        );
      },
    );
  }
}

class LoginBody extends StatefulWidget {
  LoginBody({Key key, @required this.state}) : super(key: key);
  final LoginState state;

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _formKey = GlobalKey<SmartFormState>();

  @override
  Widget build(BuildContext context) {
    final LoginCubit loginCubit = BlocProvider.of<LoginCubit>(context);
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SmartForm(
          key: _formKey,
          autovalidate: widget.state.showErrorMessages,
          child: Column(
            children: [
              SizedBoxResponsive(height: 80),

              //IMAGE OG NYAKUA
              Align(
                alignment: Alignment.center,
                child: Container(
                  child: Image.asset(
                    'assets/images/NYAKUA.png',
                    width: 500.w,
                    height: 180.h,
                  ),
                ),
              ),

              SizedBoxResponsive(height: 40),

              //INPUT USERNAME
              BonyezaField(
                hintText: 'Username',
                validationErrorText: 'Please enter username',
                onChanged: (value) {
                  loginCubit.usernameChanged(value);
                },
              ),

              SizedBoxResponsive(height: 20),

              //INPUT PASSWORD
              BonyezaField(
                hintText: 'Password',
                validationErrorText: 'Please enter password',
                obscureText: true,
                onChanged: (value) {
                  loginCubit.passwordChanged(value);
                },
              ),

              SizedBoxResponsive(height: 20),

              //LOGIN BUTTON
              BonyezaButton(
                backGroundColor: kGreenBackgroundColor,
                borderRadius: 100,
                textColor: Colors.white,
                text: 'Sign In',
                onButtonPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (_formKey.currentState.validate()) {
                    loginCubit.signInWithUsernameAndPassword();
                  } else {
                    flushbarUnableToLogin.show(context);
                  }
                },
              ),

              //FORGOT PASSWORD BUTTON
              Align(
                alignment: Alignment.center,
                child: RaisedButtonResponsive(
                  splashColor: Colors.white,
                  highlightColor: Colors.white,
                  hoverColor: Colors.white,
                  highlightElevation: 0,
                  hoverElevation: 0,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Center(
                    child: TextResponsive(
                      'Forgot your password?',
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () async {
                    //LAUNCH URL TO RESET PASSWORD
                    await prompt('https://bonyezakazi.com/password/reset');
                  },
                ),
              ),

              //DIVIDER
              BonyezaDivider(),

              //IF LOADING SHOW INDICATOR ELSE SHOW EMPTY CONTAINER
              BlocBuilder<LoginCubit, LoginState>(
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
                    return Container(
                      height: 50.h,
                    );
                  }
                },
              ),

              //LOGIN WITH GMAIL CREDENTIALS
              BonyezaButton(
                backGroundColor: kRedBackgroundColor,
                borderRadius: 100,
                textColor: Colors.white,
                text: 'Sign In with gmail',
                onButtonPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (_formKey.currentState.validate()) {
                    // loginCubit.signInWithUsernameAndPassword();
                  }
                },
              ),

              SizedBoxResponsive(height: 20),

              //LOGIN WITH FACEBOOK CREDENTIALS
              BonyezaButton(
                backGroundColor: kDarkBlueBackgroundColor,
                borderRadius: 100,
                textColor: Colors.white,
                text: 'Sign In with Facebook',
                onButtonPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (_formKey.currentState.validate()) {
                    // loginCubit.signInWithUsernameAndPassword();
                  }
                },
              ),

              //DONT HAVE ACCOUNT NAVIGATE TO REGISTRATION PAGE
              DontHaveAnAccount(
                onTextPressed: () {
                  authCubit.registerClient();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> prompt(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
