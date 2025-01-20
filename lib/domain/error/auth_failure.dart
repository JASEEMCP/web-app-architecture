import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.serverError() = _ServerError;
  const factory AuthFailure.unAuthorized() = _unAuthorized;
  const factory AuthFailure.wrongUsernameOrPwd() = _WrongUsernameOrPwd;
  const factory AuthFailure.invalidOtp() = _InvalidOtp;
  const factory AuthFailure.sessionExpired() = _SessionExpired;
  const factory AuthFailure.userAlreadyExist() = _UserAlreadyExist;
  const factory AuthFailure.userDoesNotExist() = _UserDoesNotExist;
  const factory AuthFailure.phoneDoesNotExist() = _PhoneDoesNotExist;
  const factory AuthFailure.noInternet() = _NoInternet;
  const factory AuthFailure.unknown() = _Unknown;
  const factory AuthFailure.custom(String e) = _Custom;
}

extension AuthFailureX on AuthFailure {
  String get errorMessage => when(
        custom: (e) => e,
        phoneDoesNotExist: () =>
            'The Email you entered does not match any registered account',
        serverError: () => 'Something went wrong',
        unAuthorized: () => 'Sorry, your session is expired',
        wrongUsernameOrPwd: () => 'Invalid username or password',
        invalidOtp: () => 'Invalid Otp',
        sessionExpired: () => 'Session expired',
        userAlreadyExist: () => 'User already exist',
        userDoesNotExist: () =>
            'The username you entered does not match any registered account',
        noInternet: () =>
            'Sorry, there\'s problem with your network connection',
        unknown: () => 'Something went wrong',
      );
}
