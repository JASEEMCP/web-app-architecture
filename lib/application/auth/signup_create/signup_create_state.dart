part of 'signup_create_cubit.dart';

@freezed
class SignupCreateState with _$SignupCreateState {
  const factory SignupCreateState.initial() = _Initial;

  const factory SignupCreateState.loading() = _Loading;

  const factory SignupCreateState.error(AuthFailure e) = _Error;

  const factory SignupCreateState.success() = _Success;
}

extension SignupCreateStateX on SignupCreateState {
  bool get isLoading => this is _Loading;
  bool get isError => this is _Error;
  bool get isSuccess => this is _Success;
}
