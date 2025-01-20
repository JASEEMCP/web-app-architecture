import 'package:app/application/auth/token_cubit/token_cubit.dart';
import 'package:app/domain/auth/service/auth_service.dart';
import 'package:app/domain/error/auth_failure.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@lazySingleton
class LoginCubit extends Cubit<LoginState> {
  final AuthService _authService;
  final TokenCubit _tokenCubit;
  LoginCubit(this._authService, this._tokenCubit)
      : super(const LoginState.initial());

  Future<void> login({required String email, required String password}) async {
    emit(const LoginState.loading());

    final resp = await _authService.login(email.trim(), password.trim());

    resp.fold(
      (error) => emit(LoginState.error(error)),
      (success) {
        /// Updating token
        emit(const LoginState.success());
        pref.token.value = success;

        _tokenCubit.updateToken(success);
      },
    );
  }

  Future<void> deleteAccount(
      {required String password, required String feedback}) async {
    emit(const LoginState.loading());
    final resp =
        await _authService.deleteAccount(password.trim(), feedback.trim());

    resp.fold(
      (error) => emit(LoginState.error(error)),
      (success) {
        /// Updating token
        emit(const LoginState.success());
      },
    );
  }

  logoutUser(BuildContext ctx) async {
    // final result =
    //     await _authService.logout(pref.token.value.refreshToken ?? '');
    // result.fold(
    //   (e) => ctx.hideLoading(ctx),
    //   (s) {
    //     tokenCubit.logoutUser();

    //     /// Clear app data
    //     pref.token.value = Token();

    //   },
    // );
  }
}
