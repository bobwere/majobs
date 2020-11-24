part of 'registration_cubit.dart';

@freezed
abstract class RegistrationState with _$RegistrationState {
  const factory RegistrationState({
    @required String username,
    @required String password,
    @required String city,
    @required String location,
    @required String email,
    @required String phone,
    @required File photo,
    List<Asset> workPhotos,
    @required String dialcode,
    @required bool isSubmitting,
    @required
        Option<Either<AuthFailure, RegistrationUserModel>>
            authFailureOrSuccessOption,
  }) = _RegistrationState;

  factory RegistrationState.initial() => RegistrationState(
        username: '',
        password: '',
        email: '',
        city: '',
        location: '',
        phone: '',
        workPhotos: [],
        photo: File(''),
        dialcode: '+254',
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}
