part of 'forgot_pwd_otp_cubit.dart';

@freezed
class ForgotPwdOtpState with _$ForgotPwdOtpState {
  const factory ForgotPwdOtpState.initial() = _Initial;

  const factory ForgotPwdOtpState.loading() = _Loading;

  const factory ForgotPwdOtpState.error(AuthFailure e) = _Error;

  const factory ForgotPwdOtpState.success() = _Success;
}

extension ForgotPwdOtpStateX on ForgotPwdOtpState {
  bool get isLoading => this is _Loading;
  bool get isError => this is _Error;
  bool get isSuccess => this is _Success;
}
