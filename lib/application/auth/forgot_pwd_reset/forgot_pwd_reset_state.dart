part of 'forgot_pwd_reset_cubit.dart';

@freezed
class ForgotPwdResetState with _$ForgotPwdResetState {
  const factory ForgotPwdResetState.initial() = _Initial;

  const factory ForgotPwdResetState.loading() = _Loading;

  const factory ForgotPwdResetState.error(AuthFailure e) = _Error;

  const factory ForgotPwdResetState.success() = _Success;
}

extension ForgotPwdResetStateX on ForgotPwdResetState {
  bool get isLoading => this is _Loading;
  bool get isError => this is _Error;
  bool get isSuccess => this is _Success;
}
