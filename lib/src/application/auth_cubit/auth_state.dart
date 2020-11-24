part of 'auth_cubit.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.uninitialized() = Uninitialized;
  const factory AuthState.authenticated(
      {LoginUserModel user,
      String userTypeId,
      String username,
      ServiceProvider serviceProvider}) = Authenticated;
  const factory AuthState.unauthenticated() = UnAuthenticated;
  const factory AuthState.onboarding(List<String> listOfCategories) =
      Onboarding;
  const factory AuthState.searchingFor() = SearchingFor;
  const factory AuthState.login() = Login;
  const factory AuthState.unregisteredClient() = UnregisteredClient;
  const factory AuthState.unregisteredSp() = UnregisteredSp;
  const factory AuthState.unauthenticatedButLoginedIn(
      List<String> listOfCategories) = UnauthenticatedButLoginedIn;

  const factory AuthState.spSelectsCategory(List<String> listOfCategories) =
      SpSelectsCategory;
}
