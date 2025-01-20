import 'package:app/application/auth/token_cubit/token_cubit.dart';
import 'package:app/domain/auth/service/signup_service.dart';
import 'package:app/domain/error/auth_failure.dart';
import 'package:app/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';


part 'signup_create_state.dart';
part 'signup_create_cubit.freezed.dart';

@lazySingleton
class SignupCreateCubit extends Cubit<SignupCreateState> {
  final SignupService _signupService;
  final TokenCubit _tokenCubit;
  SignupCreateCubit(this._signupService, this._tokenCubit)
      : super(const SignupCreateState.initial());

  Future<void> createUserAccount({
    required String username,
    required String phone,
    required String password,
  }) async {
    emit(const SignupCreateState.loading());

    final resp = await _signupService.createProfile(
        username.trim(), password.trim(), phone.trim());

    resp.fold(
      (error) => emit(SignupCreateState.error(error)),
      (success) {
        pref.token.value = success.copyWith(
          isProfileCreated: true,
        );
        _tokenCubit.updateToken(pref.token.value);
        emit(const SignupCreateState.success());
      },
    );
  }
}
