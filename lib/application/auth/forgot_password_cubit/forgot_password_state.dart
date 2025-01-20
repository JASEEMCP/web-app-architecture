part of 'forgot_password_cubit.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = _Initial;

  const factory ForgotPasswordState.loading() = _Loading;

  const factory ForgotPasswordState.error(AuthFailure e) = _Error;

  const factory ForgotPasswordState.success() = _Success;
}

extension ForgotPasswordStateX on ForgotPasswordState {
  bool get isLoading => this is _Loading;
  bool get isError => this is _Error;
  bool get isSuccess => this is _Success;
}
