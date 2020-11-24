import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/auth_cubit/auth_cubit.dart';
import 'package:bonyeza_kazi/src/application/update_user_profile_cubit/update_user_profile_cubit.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/onboarding_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class SPSelectCategoryPage extends StatefulWidget {
  const SPSelectCategoryPage({Key key}) : super(key: key);

  @override
  _SPSelectCategoryPageState createState() => _SPSelectCategoryPageState();
}

class _SPSelectCategoryPageState extends State<SPSelectCategoryPage> {
  @override
  Widget build(BuildContext context) {
    UpdateUserProfileCubit updateUserProfileCubit =
        BlocProvider.of<UpdateUserProfileCubit>(context);
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

    return BlocListener<UpdateUserProfileCubit, UpdateUserProfileState>(
      listener: (context, state) {
        state.userUpdateFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold((failure) {
                  failure.map(
                    serverError: (_) => flushbarServerFailure.show(context),
                    noInternet: (_) => flushbarNoInternet.show(context),
                  );
                }, (_) {
                  flushbarUpdateProfile.show(context);
                  authCubit.logIn();
                }));
        if (state.isSubmitting) {
          flushbarSubmittingDetails.show(context);
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            SizedBoxResponsive(
              height: 100,
            ),

            //DESCRIPTION
            Padding(
              padding: EdgeInsetsResponsive.symmetric(horizontal: 20),
              child: TextResponsive(
                'Choose the service that best describes what you are interested in',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
              ),
            ),

            SizedBoxResponsive(
              height: 50,
            ),

            //gridview of skills
            _buildGridView(skills),

            SizedBoxResponsive(
              height: 50,
            ),

            //NAVIGATE TO HOMEPAGE
            BonyezaButton(
              backGroundColor: kGreenBackgroundColor,
              borderRadius: 100,
              margin: 60,
              textColor: Colors.white,
              text: 'CONTINUE',
              onButtonPressed: () {
                updateUserProfileCubit.updateServiceProviderProfileSkills();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridView(List items) {
    return ContainerResponsive(
      height: 450,
      child: GridView.builder(
        padding:
            EdgeInsets.only(top: 15.h, left: 20.h, right: 20.h, bottom: 0.h),
        scrollDirection: Axis.vertical,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          String category = items[index];

          return SPSelectCategoryButton(
            categoryName: category,
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 1.3,
            crossAxisSpacing: 0.h,
            mainAxisSpacing: 0.w,
            crossAxisCount: 4),
      ),
    );
  }
}
