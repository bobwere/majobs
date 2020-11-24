import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/src/domain/auth/i_auth_inteface.dart';
import 'package:bonyeza_kazi/src/infrastructure/auth/models/login_user_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/categories/models/service_provider_search_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._iAuthFacade, this._pref) : super(AuthState.uninitialized());

  final IAuthFacade _iAuthFacade;

  final SharedPreferences _pref;

  ServiceProvider _serviceProvider;

  void appStarted() async {
    final userOption = _iAuthFacade.getSignedInUser();

    //time for splash screen to animate first then proceed
    await Future.delayed(Duration(seconds: 3));

    final value = _pref.getBool(ONBOARDING_PAGE_SEEN) ?? false;
    if (!value) {
      var listOfCategories = _pref.getStringList(LIST_OF_CATEGORIES) ?? [];

      emit(AuthState.onboarding(listOfCategories));
    } else {
      final userTypeId = _pref.getString(USER_TYPE_ID);
      final userName = _pref.getString(USER_NAME);
      userOption.fold(
          () => emit(AuthState.unauthenticated()),
          (user) => emit(AuthState.authenticated(
              user: user,
              userTypeId: userTypeId,
              username: userName,
              serviceProvider: _serviceProvider)));
    }
  }

  void logIn() {
    final userTypeId = _pref.getString(USER_TYPE_ID);
    final userName = _pref.getString(USER_NAME);
    final userOption = _iAuthFacade.getSignedInUser();
    final user = userOption.getOrElse(() => null);

    user != null
        ? emit(AuthState.authenticated(
            user: user,
            userTypeId: userTypeId,
            username: userName,
            serviceProvider: _serviceProvider))
        : emit(AuthState.unauthenticated());

    _serviceProvider = null;
  }

  void registerClient() {
    emit(AuthState.unregisteredClient());
  }

  void spClientWasLookingAt({ServiceProvider serviceProvider}) {
    _serviceProvider = serviceProvider;
  }

  void registerSP() {
    emit(AuthState.unregisteredSp());
  }

  void searchFor() {
    emit(AuthState.searchingFor());
  }

  void clientUnauthenticatedButLogin() {
    var listOfCategories = _pref.getStringList(LIST_OF_CATEGORIES);
    if (listOfCategories == null) {
      listOfCategories = [];
    }
    emit(AuthState.unauthenticatedButLoginedIn(listOfCategories));
  }

  void loginInUser() {
    emit(AuthState.login());
  }

  void spSelectsCategory() {
    var listOfCategories = _pref.getStringList(LIST_OF_CATEGORIES);
    if (listOfCategories == null) {
      listOfCategories = [];
    }
    emit(AuthState.spSelectsCategory(listOfCategories));
  }

  void logOut() async {
    await _iAuthFacade.signOut();
    emit(AuthState.unauthenticated());
  }
}
