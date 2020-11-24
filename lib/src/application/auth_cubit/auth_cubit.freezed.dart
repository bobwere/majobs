// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AuthStateTearOff {
  const _$AuthStateTearOff();

// ignore: unused_element
  Uninitialized uninitialized() {
    return const Uninitialized();
  }

// ignore: unused_element
  Authenticated authenticated(
      {LoginUserModel user,
      String userTypeId,
      String username,
      ServiceProvider serviceProvider}) {
    return Authenticated(
      user: user,
      userTypeId: userTypeId,
      username: username,
      serviceProvider: serviceProvider,
    );
  }

// ignore: unused_element
  UnAuthenticated unauthenticated() {
    return const UnAuthenticated();
  }

// ignore: unused_element
  Onboarding onboarding(List<String> listOfCategories) {
    return Onboarding(
      listOfCategories,
    );
  }

// ignore: unused_element
  SearchingFor searchingFor() {
    return const SearchingFor();
  }

// ignore: unused_element
  Login login() {
    return const Login();
  }

// ignore: unused_element
  UnregisteredClient unregisteredClient() {
    return const UnregisteredClient();
  }

// ignore: unused_element
  UnregisteredSp unregisteredSp() {
    return const UnregisteredSp();
  }

// ignore: unused_element
  UnauthenticatedButLoginedIn unauthenticatedButLoginedIn(
      List<String> listOfCategories) {
    return UnauthenticatedButLoginedIn(
      listOfCategories,
    );
  }

// ignore: unused_element
  SpSelectsCategory spSelectsCategory(List<String> listOfCategories) {
    return SpSelectsCategory(
      listOfCategories,
    );
  }
}

// ignore: unused_element
const $AuthState = _$AuthStateTearOff();

mixin _$AuthState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result uninitialized(),
    @required
        Result authenticated(LoginUserModel user, String userTypeId,
            String username, ServiceProvider serviceProvider),
    @required Result unauthenticated(),
    @required Result onboarding(List<String> listOfCategories),
    @required Result searchingFor(),
    @required Result login(),
    @required Result unregisteredClient(),
    @required Result unregisteredSp(),
    @required Result unauthenticatedButLoginedIn(List<String> listOfCategories),
    @required Result spSelectsCategory(List<String> listOfCategories),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result uninitialized(),
    Result authenticated(LoginUserModel user, String userTypeId,
        String username, ServiceProvider serviceProvider),
    Result unauthenticated(),
    Result onboarding(List<String> listOfCategories),
    Result searchingFor(),
    Result login(),
    Result unregisteredClient(),
    Result unregisteredSp(),
    Result unauthenticatedButLoginedIn(List<String> listOfCategories),
    Result spSelectsCategory(List<String> listOfCategories),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result uninitialized(Uninitialized value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(UnAuthenticated value),
    @required Result onboarding(Onboarding value),
    @required Result searchingFor(SearchingFor value),
    @required Result login(Login value),
    @required Result unregisteredClient(UnregisteredClient value),
    @required Result unregisteredSp(UnregisteredSp value),
    @required
        Result unauthenticatedButLoginedIn(UnauthenticatedButLoginedIn value),
    @required Result spSelectsCategory(SpSelectsCategory value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result uninitialized(Uninitialized value),
    Result authenticated(Authenticated value),
    Result unauthenticated(UnAuthenticated value),
    Result onboarding(Onboarding value),
    Result searchingFor(SearchingFor value),
    Result login(Login value),
    Result unregisteredClient(UnregisteredClient value),
    Result unregisteredSp(UnregisteredSp value),
    Result unauthenticatedButLoginedIn(UnauthenticatedButLoginedIn value),
    Result spSelectsCategory(SpSelectsCategory value),
    @required Result orElse(),
  });
}

abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

abstract class $UninitializedCopyWith<$Res> {
  factory $UninitializedCopyWith(
          Uninitialized value, $Res Function(Uninitialized) then) =
      _$UninitializedCopyWithImpl<$Res>;
}

class _$UninitializedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $UninitializedCopyWith<$Res> {
  _$UninitializedCopyWithImpl(
      Uninitialized _value, $Res Function(Uninitialized) _then)
      : super(_value, (v) => _then(v as Uninitialized));

  @override
  Uninitialized get _value => super._value as Uninitialized;
}

class _$Uninitialized implements Uninitialized {
  const _$Uninitialized();

  @override
  String toString() {
    return 'AuthState.uninitialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Uninitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result uninitialized(),
    @required
        Result authenticated(LoginUserModel user, String userTypeId,
            String username, ServiceProvider serviceProvider),
    @required Result unauthenticated(),
    @required Result onboarding(List<String> listOfCategories),
    @required Result searchingFor(),
    @required Result login(),
    @required Result unregisteredClient(),
    @required Result unregisteredSp(),
    @required Result unauthenticatedButLoginedIn(List<String> listOfCategories),
    @required Result spSelectsCategory(List<String> listOfCategories),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(login != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    assert(unauthenticatedButLoginedIn != null);
    assert(spSelectsCategory != null);
    return uninitialized();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result uninitialized(),
    Result authenticated(LoginUserModel user, String userTypeId,
        String username, ServiceProvider serviceProvider),
    Result unauthenticated(),
    Result onboarding(List<String> listOfCategories),
    Result searchingFor(),
    Result login(),
    Result unregisteredClient(),
    Result unregisteredSp(),
    Result unauthenticatedButLoginedIn(List<String> listOfCategories),
    Result spSelectsCategory(List<String> listOfCategories),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (uninitialized != null) {
      return uninitialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result uninitialized(Uninitialized value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(UnAuthenticated value),
    @required Result onboarding(Onboarding value),
    @required Result searchingFor(SearchingFor value),
    @required Result login(Login value),
    @required Result unregisteredClient(UnregisteredClient value),
    @required Result unregisteredSp(UnregisteredSp value),
    @required
        Result unauthenticatedButLoginedIn(UnauthenticatedButLoginedIn value),
    @required Result spSelectsCategory(SpSelectsCategory value),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(login != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    assert(unauthenticatedButLoginedIn != null);
    assert(spSelectsCategory != null);
    return uninitialized(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result uninitialized(Uninitialized value),
    Result authenticated(Authenticated value),
    Result unauthenticated(UnAuthenticated value),
    Result onboarding(Onboarding value),
    Result searchingFor(SearchingFor value),
    Result login(Login value),
    Result unregisteredClient(UnregisteredClient value),
    Result unregisteredSp(UnregisteredSp value),
    Result unauthenticatedButLoginedIn(UnauthenticatedButLoginedIn value),
    Result spSelectsCategory(SpSelectsCategory value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (uninitialized != null) {
      return uninitialized(this);
    }
    return orElse();
  }
}

abstract class Uninitialized implements AuthState {
  const factory Uninitialized() = _$Uninitialized;
}

abstract class $AuthenticatedCopyWith<$Res> {
  factory $AuthenticatedCopyWith(
          Authenticated value, $Res Function(Authenticated) then) =
      _$AuthenticatedCopyWithImpl<$Res>;
  $Res call(
      {LoginUserModel user,
      String userTypeId,
      String username,
      ServiceProvider serviceProvider});
}

class _$AuthenticatedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthenticatedCopyWith<$Res> {
  _$AuthenticatedCopyWithImpl(
      Authenticated _value, $Res Function(Authenticated) _then)
      : super(_value, (v) => _then(v as Authenticated));

  @override
  Authenticated get _value => super._value as Authenticated;

  @override
  $Res call({
    Object user = freezed,
    Object userTypeId = freezed,
    Object username = freezed,
    Object serviceProvider = freezed,
  }) {
    return _then(Authenticated(
      user: user == freezed ? _value.user : user as LoginUserModel,
      userTypeId:
          userTypeId == freezed ? _value.userTypeId : userTypeId as String,
      username: username == freezed ? _value.username : username as String,
      serviceProvider: serviceProvider == freezed
          ? _value.serviceProvider
          : serviceProvider as ServiceProvider,
    ));
  }
}

class _$Authenticated implements Authenticated {
  const _$Authenticated(
      {this.user, this.userTypeId, this.username, this.serviceProvider});

  @override
  final LoginUserModel user;
  @override
  final String userTypeId;
  @override
  final String username;
  @override
  final ServiceProvider serviceProvider;

  @override
  String toString() {
    return 'AuthState.authenticated(user: $user, userTypeId: $userTypeId, username: $username, serviceProvider: $serviceProvider)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Authenticated &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.userTypeId, userTypeId) ||
                const DeepCollectionEquality()
                    .equals(other.userTypeId, userTypeId)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.serviceProvider, serviceProvider) ||
                const DeepCollectionEquality()
                    .equals(other.serviceProvider, serviceProvider)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(userTypeId) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(serviceProvider);

  @override
  $AuthenticatedCopyWith<Authenticated> get copyWith =>
      _$AuthenticatedCopyWithImpl<Authenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result uninitialized(),
    @required
        Result authenticated(LoginUserModel user, String userTypeId,
            String username, ServiceProvider serviceProvider),
    @required Result unauthenticated(),
    @required Result onboarding(List<String> listOfCategories),
    @required Result searchingFor(),
    @required Result login(),
    @required Result unregisteredClient(),
    @required Result unregisteredSp(),
    @required Result unauthenticatedButLoginedIn(List<String> listOfCategories),
    @required Result spSelectsCategory(List<String> listOfCategories),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(login != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    assert(unauthenticatedButLoginedIn != null);
    assert(spSelectsCategory != null);
    return authenticated(user, userTypeId, username, serviceProvider);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result uninitialized(),
    Result authenticated(LoginUserModel user, String userTypeId,
        String username, ServiceProvider serviceProvider),
    Result unauthenticated(),
    Result onboarding(List<String> listOfCategories),
    Result searchingFor(),
    Result login(),
    Result unregisteredClient(),
    Result unregisteredSp(),
    Result unauthenticatedButLoginedIn(List<String> listOfCategories),
    Result spSelectsCategory(List<String> listOfCategories),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authenticated != null) {
      return authenticated(user, userTypeId, username, serviceProvider);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result uninitialized(Uninitialized value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(UnAuthenticated value),
    @required Result onboarding(Onboarding value),
    @required Result searchingFor(SearchingFor value),
    @required Result login(Login value),
    @required Result unregisteredClient(UnregisteredClient value),
    @required Result unregisteredSp(UnregisteredSp value),
    @required
        Result unauthenticatedButLoginedIn(UnauthenticatedButLoginedIn value),
    @required Result spSelectsCategory(SpSelectsCategory value),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(login != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    assert(unauthenticatedButLoginedIn != null);
    assert(spSelectsCategory != null);
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result uninitialized(Uninitialized value),
    Result authenticated(Authenticated value),
    Result unauthenticated(UnAuthenticated value),
    Result onboarding(Onboarding value),
    Result searchingFor(SearchingFor value),
    Result login(Login value),
    Result unregisteredClient(UnregisteredClient value),
    Result unregisteredSp(UnregisteredSp value),
    Result unauthenticatedButLoginedIn(UnauthenticatedButLoginedIn value),
    Result spSelectsCategory(SpSelectsCategory value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class Authenticated implements AuthState {
  const factory Authenticated(
      {LoginUserModel user,
      String userTypeId,
      String username,
      ServiceProvider serviceProvider}) = _$Authenticated;

  LoginUserModel get user;
  String get userTypeId;
  String get username;
  ServiceProvider get serviceProvider;
  $AuthenticatedCopyWith<Authenticated> get copyWith;
}

abstract class $UnAuthenticatedCopyWith<$Res> {
  factory $UnAuthenticatedCopyWith(
          UnAuthenticated value, $Res Function(UnAuthenticated) then) =
      _$UnAuthenticatedCopyWithImpl<$Res>;
}

class _$UnAuthenticatedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $UnAuthenticatedCopyWith<$Res> {
  _$UnAuthenticatedCopyWithImpl(
      UnAuthenticated _value, $Res Function(UnAuthenticated) _then)
      : super(_value, (v) => _then(v as UnAuthenticated));

  @override
  UnAuthenticated get _value => super._value as UnAuthenticated;
}

class _$UnAuthenticated implements UnAuthenticated {
  const _$UnAuthenticated();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UnAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result uninitialized(),
    @required
        Result authenticated(LoginUserModel user, String userTypeId,
            String username, ServiceProvider serviceProvider),
    @required Result unauthenticated(),
    @required Result onboarding(List<String> listOfCategories),
    @required Result searchingFor(),
    @required Result login(),
    @required Result unregisteredClient(),
    @required Result unregisteredSp(),
    @required Result unauthenticatedButLoginedIn(List<String> listOfCategories),
    @required Result spSelectsCategory(List<String> listOfCategories),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(login != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    assert(unauthenticatedButLoginedIn != null);
    assert(spSelectsCategory != null);
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result uninitialized(),
    Result authenticated(LoginUserModel user, String userTypeId,
        String username, ServiceProvider serviceProvider),
    Result unauthenticated(),
    Result onboarding(List<String> listOfCategories),
    Result searchingFor(),
    Result login(),
    Result unregisteredClient(),
    Result unregisteredSp(),
    Result unauthenticatedButLoginedIn(List<String> listOfCategories),
    Result spSelectsCategory(List<String> listOfCategories),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result uninitialized(Uninitialized value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(UnAuthenticated value),
    @required Result onboarding(Onboarding value),
    @required Result searchingFor(SearchingFor value),
    @required Result login(Login value),
    @required Result unregisteredClient(UnregisteredClient value),
    @required Result unregisteredSp(UnregisteredSp value),
    @required
        Result unauthenticatedButLoginedIn(UnauthenticatedButLoginedIn value),
    @required Result spSelectsCategory(SpSelectsCategory value),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(login != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    assert(unauthenticatedButLoginedIn != null);
    assert(spSelectsCategory != null);
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result uninitialized(Uninitialized value),
    Result authenticated(Authenticated value),
    Result unauthenticated(UnAuthenticated value),
    Result onboarding(Onboarding value),
    Result searchingFor(SearchingFor value),
    Result login(Login value),
    Result unregisteredClient(UnregisteredClient value),
    Result unregisteredSp(UnregisteredSp value),
    Result unauthenticatedButLoginedIn(UnauthenticatedButLoginedIn value),
    Result spSelectsCategory(SpSelectsCategory value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class UnAuthenticated implements AuthState {
  const factory UnAuthenticated() = _$UnAuthenticated;
}

abstract class $OnboardingCopyWith<$Res> {
  factory $OnboardingCopyWith(
          Onboarding value, $Res Function(Onboarding) then) =
      _$OnboardingCopyWithImpl<$Res>;
  $Res call({List<String> listOfCategories});
}

class _$OnboardingCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $OnboardingCopyWith<$Res> {
  _$OnboardingCopyWithImpl(Onboarding _value, $Res Function(Onboarding) _then)
      : super(_value, (v) => _then(v as Onboarding));

  @override
  Onboarding get _value => super._value as Onboarding;

  @override
  $Res call({
    Object listOfCategories = freezed,
  }) {
    return _then(Onboarding(
      listOfCategories == freezed
          ? _value.listOfCategories
          : listOfCategories as List<String>,
    ));
  }
}

class _$Onboarding implements Onboarding {
  const _$Onboarding(this.listOfCategories) : assert(listOfCategories != null);

  @override
  final List<String> listOfCategories;

  @override
  String toString() {
    return 'AuthState.onboarding(listOfCategories: $listOfCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Onboarding &&
            (identical(other.listOfCategories, listOfCategories) ||
                const DeepCollectionEquality()
                    .equals(other.listOfCategories, listOfCategories)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(listOfCategories);

  @override
  $OnboardingCopyWith<Onboarding> get copyWith =>
      _$OnboardingCopyWithImpl<Onboarding>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result uninitialized(),
    @required
        Result authenticated(LoginUserModel user, String userTypeId,
            String username, ServiceProvider serviceProvider),
    @required Result unauthenticated(),
    @required Result onboarding(List<String> listOfCategories),
    @required Result searchingFor(),
    @required Result login(),
    @required Result unregisteredClient(),
    @required Result unregisteredSp(),
    @required Result unauthenticatedButLoginedIn(List<String> listOfCategories),
    @required Result spSelectsCategory(List<String> listOfCategories),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(login != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    assert(unauthenticatedButLoginedIn != null);
    assert(spSelectsCategory != null);
    return onboarding(listOfCategories);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result uninitialized(),
    Result authenticated(LoginUserModel user, String userTypeId,
        String username, ServiceProvider serviceProvider),
    Result unauthenticated(),
    Result onboarding(List<String> listOfCategories),
    Result searchingFor(),
    Result login(),
    Result unregisteredClient(),
    Result unregisteredSp(),
    Result unauthenticatedButLoginedIn(List<String> listOfCategories),
    Result spSelectsCategory(List<String> listOfCategories),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (onboarding != null) {
      return onboarding(listOfCategories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result uninitialized(Uninitialized value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(UnAuthenticated value),
    @required Result onboarding(Onboarding value),
    @required Result searchingFor(SearchingFor value),
    @required Result login(Login value),
    @required Result unregisteredClient(UnregisteredClient value),
    @required Result unregisteredSp(UnregisteredSp value),
    @required
        Result unauthenticatedButLoginedIn(UnauthenticatedButLoginedIn value),
    @required Result spSelectsCategory(SpSelectsCategory value),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(login != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    assert(unauthenticatedButLoginedIn != null);
    assert(spSelectsCategory != null);
    return onboarding(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result uninitialized(Uninitialized value),
    Result authenticated(Authenticated value),
    Result unauthenticated(UnAuthenticated value),
    Result onboarding(Onboarding value),
    Result searchingFor(SearchingFor value),
    Result login(Login value),
    Result unregisteredClient(UnregisteredClient value),
    Result unregisteredSp(UnregisteredSp value),
    Result unauthenticatedButLoginedIn(UnauthenticatedButLoginedIn value),
    Result spSelectsCategory(SpSelectsCategory value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (onboarding != null) {
      return onboarding(this);
    }
    return orElse();
  }
}

abstract class Onboarding implements AuthState {
  const factory Onboarding(List<String> listOfCategories) = _$Onboarding;

  List<String> get listOfCategories;
  $OnboardingCopyWith<Onboarding> get copyWith;
}

abstract class $SearchingForCopyWith<$Res> {
  factory $SearchingForCopyWith(
          SearchingFor value, $Res Function(SearchingFor) then) =
      _$SearchingForCopyWithImpl<$Res>;
}

class _$SearchingForCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $SearchingForCopyWith<$Res> {
  _$SearchingForCopyWithImpl(
      SearchingFor _value, $Res Function(SearchingFor) _then)
      : super(_value, (v) => _then(v as SearchingFor));

  @override
  SearchingFor get _value => super._value as SearchingFor;
}

class _$SearchingFor implements SearchingFor {
  const _$SearchingFor();

  @override
  String toString() {
    return 'AuthState.searchingFor()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SearchingFor);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result uninitialized(),
    @required
        Result authenticated(LoginUserModel user, String userTypeId,
            String username, ServiceProvider serviceProvider),
    @required Result unauthenticated(),
    @required Result onboarding(List<String> listOfCategories),
    @required Result searchingFor(),
    @required Result login(),
    @required Result unregisteredClient(),
    @required Result unregisteredSp(),
    @required Result unauthenticatedButLoginedIn(List<String> listOfCategories),
    @required Result spSelectsCategory(List<String> listOfCategories),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(login != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    assert(unauthenticatedButLoginedIn != null);
    assert(spSelectsCategory != null);
    return searchingFor();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result uninitialized(),
    Result authenticated(LoginUserModel user, String userTypeId,
        String username, ServiceProvider serviceProvider),
    Result unauthenticated(),
    Result onboarding(List<String> listOfCategories),
    Result searchingFor(),
    Result login(),
    Result unregisteredClient(),
    Result unregisteredSp(),
    Result unauthenticatedButLoginedIn(List<String> listOfCategories),
    Result spSelectsCategory(List<String> listOfCategories),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (searchingFor != null) {
      return searchingFor();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result uninitialized(Uninitialized value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(UnAuthenticated value),
    @required Result onboarding(Onboarding value),
    @required Result searchingFor(SearchingFor value),
    @required Result login(Login value),
    @required Result unregisteredClient(UnregisteredClient value),
    @required Result unregisteredSp(UnregisteredSp value),
    @required
        Result unauthenticatedButLoginedIn(UnauthenticatedButLoginedIn value),
    @required Result spSelectsCategory(SpSelectsCategory value),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(login != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    assert(unauthenticatedButLoginedIn != null);
    assert(spSelectsCategory != null);
    return searchingFor(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result uninitialized(Uninitialized value),
    Result authenticated(Authenticated value),
    Result unauthenticated(UnAuthenticated value),
    Result onboarding(Onboarding value),
    Result searchingFor(SearchingFor value),
    Result login(Login value),
    Result unregisteredClient(UnregisteredClient value),
    Result unregisteredSp(UnregisteredSp value),
    Result unauthenticatedButLoginedIn(UnauthenticatedButLoginedIn value),
    Result spSelectsCategory(SpSelectsCategory value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (searchingFor != null) {
      return searchingFor(this);
    }
    return orElse();
  }
}

abstract class SearchingFor implements AuthState {
  const factory SearchingFor() = _$SearchingFor;
}

abstract class $LoginCopyWith<$Res> {
  factory $LoginCopyWith(Login value, $Res Function(Login) then) =
      _$LoginCopyWithImpl<$Res>;
}

class _$LoginCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $LoginCopyWith<$Res> {
  _$LoginCopyWithImpl(Login _value, $Res Function(Login) _then)
      : super(_value, (v) => _then(v as Login));

  @override
  Login get _value => super._value as Login;
}

class _$Login implements Login {
  const _$Login();

  @override
  String toString() {
    return 'AuthState.login()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Login);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result uninitialized(),
    @required
        Result authenticated(LoginUserModel user, String userTypeId,
            String username, ServiceProvider serviceProvider),
    @required Result unauthenticated(),
    @required Result onboarding(List<String> listOfCategories),
    @required Result searchingFor(),
    @required Result login(),
    @required Result unregisteredClient(),
    @required Result unregisteredSp(),
    @required Result unauthenticatedButLoginedIn(List<String> listOfCategories),
    @required Result spSelectsCategory(List<String> listOfCategories),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(login != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    assert(unauthenticatedButLoginedIn != null);
    assert(spSelectsCategory != null);
    return login();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result uninitialized(),
    Result authenticated(LoginUserModel user, String userTypeId,
        String username, ServiceProvider serviceProvider),
    Result unauthenticated(),
    Result onboarding(List<String> listOfCategories),
    Result searchingFor(),
    Result login(),
    Result unregisteredClient(),
    Result unregisteredSp(),
    Result unauthenticatedButLoginedIn(List<String> listOfCategories),
    Result spSelectsCategory(List<String> listOfCategories),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (login != null) {
      return login();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result uninitialized(Uninitialized value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(UnAuthenticated value),
    @required Result onboarding(Onboarding value),
    @required Result searchingFor(SearchingFor value),
    @required Result login(Login value),
    @required Result unregisteredClient(UnregisteredClient value),
    @required Result unregisteredSp(UnregisteredSp value),
    @required
        Result unauthenticatedButLoginedIn(UnauthenticatedButLoginedIn value),
    @required Result spSelectsCategory(SpSelectsCategory value),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(login != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    assert(unauthenticatedButLoginedIn != null);
    assert(spSelectsCategory != null);
    return login(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result uninitialized(Uninitialized value),
    Result authenticated(Authenticated value),
    Result unauthenticated(UnAuthenticated value),
    Result onboarding(Onboarding value),
    Result searchingFor(SearchingFor value),
    Result login(Login value),
    Result unregisteredClient(UnregisteredClient value),
    Result unregisteredSp(UnregisteredSp value),
    Result unauthenticatedButLoginedIn(UnauthenticatedButLoginedIn value),
    Result spSelectsCategory(SpSelectsCategory value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class Login implements AuthState {
  const factory Login() = _$Login;
}

abstract class $UnregisteredClientCopyWith<$Res> {
  factory $UnregisteredClientCopyWith(
          UnregisteredClient value, $Res Function(UnregisteredClient) then) =
      _$UnregisteredClientCopyWithImpl<$Res>;
}

class _$UnregisteredClientCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements $UnregisteredClientCopyWith<$Res> {
  _$UnregisteredClientCopyWithImpl(
      UnregisteredClient _value, $Res Function(UnregisteredClient) _then)
      : super(_value, (v) => _then(v as UnregisteredClient));

  @override
  UnregisteredClient get _value => super._value as UnregisteredClient;
}

class _$UnregisteredClient implements UnregisteredClient {
  const _$UnregisteredClient();

  @override
  String toString() {
    return 'AuthState.unregisteredClient()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UnregisteredClient);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result uninitialized(),
    @required
        Result authenticated(LoginUserModel user, String userTypeId,
            String username, ServiceProvider serviceProvider),
    @required Result unauthenticated(),
    @required Result onboarding(List<String> listOfCategories),
    @required Result searchingFor(),
    @required Result login(),
    @required Result unregisteredClient(),
    @required Result unregisteredSp(),
    @required Result unauthenticatedButLoginedIn(List<String> listOfCategories),
    @required Result spSelectsCategory(List<String> listOfCategories),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(login != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    assert(unauthenticatedButLoginedIn != null);
    assert(spSelectsCategory != null);
    return unregisteredClient();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result uninitialized(),
    Result authenticated(LoginUserModel user, String userTypeId,
        String username, ServiceProvider serviceProvider),
    Result unauthenticated(),
    Result onboarding(List<String> listOfCategories),
    Result searchingFor(),
    Result login(),
    Result unregisteredClient(),
    Result unregisteredSp(),
    Result unauthenticatedButLoginedIn(List<String> listOfCategories),
    Result spSelectsCategory(List<String> listOfCategories),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unregisteredClient != null) {
      return unregisteredClient();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result uninitialized(Uninitialized value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(UnAuthenticated value),
    @required Result onboarding(Onboarding value),
    @required Result searchingFor(SearchingFor value),
    @required Result login(Login value),
    @required Result unregisteredClient(UnregisteredClient value),
    @required Result unregisteredSp(UnregisteredSp value),
    @required
        Result unauthenticatedButLoginedIn(UnauthenticatedButLoginedIn value),
    @required Result spSelectsCategory(SpSelectsCategory value),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(login != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    assert(unauthenticatedButLoginedIn != null);
    assert(spSelectsCategory != null);
    return unregisteredClient(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result uninitialized(Uninitialized value),
    Result authenticated(Authenticated value),
    Result unauthenticated(UnAuthenticated value),
    Result onboarding(Onboarding value),
    Result searchingFor(SearchingFor value),
    Result login(Login value),
    Result unregisteredClient(UnregisteredClient value),
    Result unregisteredSp(UnregisteredSp value),
    Result unauthenticatedButLoginedIn(UnauthenticatedButLoginedIn value),
    Result spSelectsCategory(SpSelectsCategory value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unregisteredClient != null) {
      return unregisteredClient(this);
    }
    return orElse();
  }
}

abstract class UnregisteredClient implements AuthState {
  const factory UnregisteredClient() = _$UnregisteredClient;
}

abstract class $UnregisteredSpCopyWith<$Res> {
  factory $UnregisteredSpCopyWith(
          UnregisteredSp value, $Res Function(UnregisteredSp) then) =
      _$UnregisteredSpCopyWithImpl<$Res>;
}

class _$UnregisteredSpCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $UnregisteredSpCopyWith<$Res> {
  _$UnregisteredSpCopyWithImpl(
      UnregisteredSp _value, $Res Function(UnregisteredSp) _then)
      : super(_value, (v) => _then(v as UnregisteredSp));

  @override
  UnregisteredSp get _value => super._value as UnregisteredSp;
}

class _$UnregisteredSp implements UnregisteredSp {
  const _$UnregisteredSp();

  @override
  String toString() {
    return 'AuthState.unregisteredSp()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UnregisteredSp);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result uninitialized(),
    @required
        Result authenticated(LoginUserModel user, String userTypeId,
            String username, ServiceProvider serviceProvider),
    @required Result unauthenticated(),
    @required Result onboarding(List<String> listOfCategories),
    @required Result searchingFor(),
    @required Result login(),
    @required Result unregisteredClient(),
    @required Result unregisteredSp(),
    @required Result unauthenticatedButLoginedIn(List<String> listOfCategories),
    @required Result spSelectsCategory(List<String> listOfCategories),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(login != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    assert(unauthenticatedButLoginedIn != null);
    assert(spSelectsCategory != null);
    return unregisteredSp();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result uninitialized(),
    Result authenticated(LoginUserModel user, String userTypeId,
        String username, ServiceProvider serviceProvider),
    Result unauthenticated(),
    Result onboarding(List<String> listOfCategories),
    Result searchingFor(),
    Result login(),
    Result unregisteredClient(),
    Result unregisteredSp(),
    Result unauthenticatedButLoginedIn(List<String> listOfCategories),
    Result spSelectsCategory(List<String> listOfCategories),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unregisteredSp != null) {
      return unregisteredSp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result uninitialized(Uninitialized value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(UnAuthenticated value),
    @required Result onboarding(Onboarding value),
    @required Result searchingFor(SearchingFor value),
    @required Result login(Login value),
    @required Result unregisteredClient(UnregisteredClient value),
    @required Result unregisteredSp(UnregisteredSp value),
    @required
        Result unauthenticatedButLoginedIn(UnauthenticatedButLoginedIn value),
    @required Result spSelectsCategory(SpSelectsCategory value),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(login != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    assert(unauthenticatedButLoginedIn != null);
    assert(spSelectsCategory != null);
    return unregisteredSp(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result uninitialized(Uninitialized value),
    Result authenticated(Authenticated value),
    Result unauthenticated(UnAuthenticated value),
    Result onboarding(Onboarding value),
    Result searchingFor(SearchingFor value),
    Result login(Login value),
    Result unregisteredClient(UnregisteredClient value),
    Result unregisteredSp(UnregisteredSp value),
    Result unauthenticatedButLoginedIn(UnauthenticatedButLoginedIn value),
    Result spSelectsCategory(SpSelectsCategory value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unregisteredSp != null) {
      return unregisteredSp(this);
    }
    return orElse();
  }
}

abstract class UnregisteredSp implements AuthState {
  const factory UnregisteredSp() = _$UnregisteredSp;
}

abstract class $UnauthenticatedButLoginedInCopyWith<$Res> {
  factory $UnauthenticatedButLoginedInCopyWith(
          UnauthenticatedButLoginedIn value,
          $Res Function(UnauthenticatedButLoginedIn) then) =
      _$UnauthenticatedButLoginedInCopyWithImpl<$Res>;
  $Res call({List<String> listOfCategories});
}

class _$UnauthenticatedButLoginedInCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements $UnauthenticatedButLoginedInCopyWith<$Res> {
  _$UnauthenticatedButLoginedInCopyWithImpl(UnauthenticatedButLoginedIn _value,
      $Res Function(UnauthenticatedButLoginedIn) _then)
      : super(_value, (v) => _then(v as UnauthenticatedButLoginedIn));

  @override
  UnauthenticatedButLoginedIn get _value =>
      super._value as UnauthenticatedButLoginedIn;

  @override
  $Res call({
    Object listOfCategories = freezed,
  }) {
    return _then(UnauthenticatedButLoginedIn(
      listOfCategories == freezed
          ? _value.listOfCategories
          : listOfCategories as List<String>,
    ));
  }
}

class _$UnauthenticatedButLoginedIn implements UnauthenticatedButLoginedIn {
  const _$UnauthenticatedButLoginedIn(this.listOfCategories)
      : assert(listOfCategories != null);

  @override
  final List<String> listOfCategories;

  @override
  String toString() {
    return 'AuthState.unauthenticatedButLoginedIn(listOfCategories: $listOfCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UnauthenticatedButLoginedIn &&
            (identical(other.listOfCategories, listOfCategories) ||
                const DeepCollectionEquality()
                    .equals(other.listOfCategories, listOfCategories)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(listOfCategories);

  @override
  $UnauthenticatedButLoginedInCopyWith<UnauthenticatedButLoginedIn>
      get copyWith => _$UnauthenticatedButLoginedInCopyWithImpl<
          UnauthenticatedButLoginedIn>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result uninitialized(),
    @required
        Result authenticated(LoginUserModel user, String userTypeId,
            String username, ServiceProvider serviceProvider),
    @required Result unauthenticated(),
    @required Result onboarding(List<String> listOfCategories),
    @required Result searchingFor(),
    @required Result login(),
    @required Result unregisteredClient(),
    @required Result unregisteredSp(),
    @required Result unauthenticatedButLoginedIn(List<String> listOfCategories),
    @required Result spSelectsCategory(List<String> listOfCategories),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(login != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    assert(unauthenticatedButLoginedIn != null);
    assert(spSelectsCategory != null);
    return unauthenticatedButLoginedIn(listOfCategories);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result uninitialized(),
    Result authenticated(LoginUserModel user, String userTypeId,
        String username, ServiceProvider serviceProvider),
    Result unauthenticated(),
    Result onboarding(List<String> listOfCategories),
    Result searchingFor(),
    Result login(),
    Result unregisteredClient(),
    Result unregisteredSp(),
    Result unauthenticatedButLoginedIn(List<String> listOfCategories),
    Result spSelectsCategory(List<String> listOfCategories),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticatedButLoginedIn != null) {
      return unauthenticatedButLoginedIn(listOfCategories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result uninitialized(Uninitialized value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(UnAuthenticated value),
    @required Result onboarding(Onboarding value),
    @required Result searchingFor(SearchingFor value),
    @required Result login(Login value),
    @required Result unregisteredClient(UnregisteredClient value),
    @required Result unregisteredSp(UnregisteredSp value),
    @required
        Result unauthenticatedButLoginedIn(UnauthenticatedButLoginedIn value),
    @required Result spSelectsCategory(SpSelectsCategory value),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(login != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    assert(unauthenticatedButLoginedIn != null);
    assert(spSelectsCategory != null);
    return unauthenticatedButLoginedIn(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result uninitialized(Uninitialized value),
    Result authenticated(Authenticated value),
    Result unauthenticated(UnAuthenticated value),
    Result onboarding(Onboarding value),
    Result searchingFor(SearchingFor value),
    Result login(Login value),
    Result unregisteredClient(UnregisteredClient value),
    Result unregisteredSp(UnregisteredSp value),
    Result unauthenticatedButLoginedIn(UnauthenticatedButLoginedIn value),
    Result spSelectsCategory(SpSelectsCategory value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticatedButLoginedIn != null) {
      return unauthenticatedButLoginedIn(this);
    }
    return orElse();
  }
}

abstract class UnauthenticatedButLoginedIn implements AuthState {
  const factory UnauthenticatedButLoginedIn(List<String> listOfCategories) =
      _$UnauthenticatedButLoginedIn;

  List<String> get listOfCategories;
  $UnauthenticatedButLoginedInCopyWith<UnauthenticatedButLoginedIn>
      get copyWith;
}

abstract class $SpSelectsCategoryCopyWith<$Res> {
  factory $SpSelectsCategoryCopyWith(
          SpSelectsCategory value, $Res Function(SpSelectsCategory) then) =
      _$SpSelectsCategoryCopyWithImpl<$Res>;
  $Res call({List<String> listOfCategories});
}

class _$SpSelectsCategoryCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements $SpSelectsCategoryCopyWith<$Res> {
  _$SpSelectsCategoryCopyWithImpl(
      SpSelectsCategory _value, $Res Function(SpSelectsCategory) _then)
      : super(_value, (v) => _then(v as SpSelectsCategory));

  @override
  SpSelectsCategory get _value => super._value as SpSelectsCategory;

  @override
  $Res call({
    Object listOfCategories = freezed,
  }) {
    return _then(SpSelectsCategory(
      listOfCategories == freezed
          ? _value.listOfCategories
          : listOfCategories as List<String>,
    ));
  }
}

class _$SpSelectsCategory implements SpSelectsCategory {
  const _$SpSelectsCategory(this.listOfCategories)
      : assert(listOfCategories != null);

  @override
  final List<String> listOfCategories;

  @override
  String toString() {
    return 'AuthState.spSelectsCategory(listOfCategories: $listOfCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SpSelectsCategory &&
            (identical(other.listOfCategories, listOfCategories) ||
                const DeepCollectionEquality()
                    .equals(other.listOfCategories, listOfCategories)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(listOfCategories);

  @override
  $SpSelectsCategoryCopyWith<SpSelectsCategory> get copyWith =>
      _$SpSelectsCategoryCopyWithImpl<SpSelectsCategory>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result uninitialized(),
    @required
        Result authenticated(LoginUserModel user, String userTypeId,
            String username, ServiceProvider serviceProvider),
    @required Result unauthenticated(),
    @required Result onboarding(List<String> listOfCategories),
    @required Result searchingFor(),
    @required Result login(),
    @required Result unregisteredClient(),
    @required Result unregisteredSp(),
    @required Result unauthenticatedButLoginedIn(List<String> listOfCategories),
    @required Result spSelectsCategory(List<String> listOfCategories),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(login != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    assert(unauthenticatedButLoginedIn != null);
    assert(spSelectsCategory != null);
    return spSelectsCategory(listOfCategories);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result uninitialized(),
    Result authenticated(LoginUserModel user, String userTypeId,
        String username, ServiceProvider serviceProvider),
    Result unauthenticated(),
    Result onboarding(List<String> listOfCategories),
    Result searchingFor(),
    Result login(),
    Result unregisteredClient(),
    Result unregisteredSp(),
    Result unauthenticatedButLoginedIn(List<String> listOfCategories),
    Result spSelectsCategory(List<String> listOfCategories),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (spSelectsCategory != null) {
      return spSelectsCategory(listOfCategories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result uninitialized(Uninitialized value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(UnAuthenticated value),
    @required Result onboarding(Onboarding value),
    @required Result searchingFor(SearchingFor value),
    @required Result login(Login value),
    @required Result unregisteredClient(UnregisteredClient value),
    @required Result unregisteredSp(UnregisteredSp value),
    @required
        Result unauthenticatedButLoginedIn(UnauthenticatedButLoginedIn value),
    @required Result spSelectsCategory(SpSelectsCategory value),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(login != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    assert(unauthenticatedButLoginedIn != null);
    assert(spSelectsCategory != null);
    return spSelectsCategory(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result uninitialized(Uninitialized value),
    Result authenticated(Authenticated value),
    Result unauthenticated(UnAuthenticated value),
    Result onboarding(Onboarding value),
    Result searchingFor(SearchingFor value),
    Result login(Login value),
    Result unregisteredClient(UnregisteredClient value),
    Result unregisteredSp(UnregisteredSp value),
    Result unauthenticatedButLoginedIn(UnauthenticatedButLoginedIn value),
    Result spSelectsCategory(SpSelectsCategory value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (spSelectsCategory != null) {
      return spSelectsCategory(this);
    }
    return orElse();
  }
}

abstract class SpSelectsCategory implements AuthState {
  const factory SpSelectsCategory(List<String> listOfCategories) =
      _$SpSelectsCategory;

  List<String> get listOfCategories;
  $SpSelectsCategoryCopyWith<SpSelectsCategory> get copyWith;
}
