part of 'signup_cubit.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState.initial() = _Initial;

  const factory SignupState.loading() = _Loading;

  const factory SignupState.error(AuthFailure e) = _Error;

  const factory SignupState.success() = _Success;
}

extension SignupStateX on SignupState {
  bool get isLoading => this is _Loading;
  bool get isError => this is _Error;
  bool get isSuccess => this is _Success;
}
