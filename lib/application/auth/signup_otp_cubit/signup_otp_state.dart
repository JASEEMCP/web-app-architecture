part of 'signup_otp_cubit.dart';

@freezed
class SignupOtpState with _$SignupOtpState {
  const factory SignupOtpState.initial() = _Initial;

  const factory SignupOtpState.loading() = _Loading;

  const factory SignupOtpState.error(AuthFailure e) = _Error;

  const factory SignupOtpState.success() = _Success;
}

extension SignupOtpStateX on SignupOtpState {
  bool get isLoading => this is _Loading;
  bool get isError => this is _Error;
  bool get isSuccess => this is _Success;
}
