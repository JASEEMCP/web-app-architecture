import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_failure.freezed.dart';

@freezed
class MainFailure with _$MainFailure {
  const factory MainFailure.serverError() = _ServerError;
  const factory MainFailure.unAuthorized() = _unAuthorized;
  const factory MainFailure.wrongUsernameOrPwd() = _WrongUsernameOrPwd;
  const factory MainFailure.invalidOtp() = _InvalidOtp;
  const factory MainFailure.sessionExpired() = _SessionExpired;
  const factory MainFailure.userAlreadyExist() = _UserAlreadyExist;
  const factory MainFailure.userDoesNotExist() = _UserDoesNotExist;
  const factory MainFailure.noInternet() = _NoInternet;
  const factory MainFailure.unknown() = _Unknown;
  const factory MainFailure.custom(String e) = _Custom;
}

extension MainFailureX on MainFailure {
  String get errorMessage => when(
        serverError: () => 'Something went wrong',
        unAuthorized: () => 'Sorry, your session is expired',
        wrongUsernameOrPwd: () => 'Invalid username or password',
        invalidOtp: () => 'Invalid Otp',
        sessionExpired: () => 'Session expired',
        userAlreadyExist: () => 'Username already taken',
        userDoesNotExist: () =>
            'The username you entered does not match any registered account',
        noInternet: () =>
            'Sorry, there\'s problem with your network connection',
        unknown: () => 'Something went wrong',
        custom: (e) => e,
      );
}
