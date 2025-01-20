import 'package:app/domain/auth/service/forgot_pwd_service.dart';
import 'package:app/domain/error/auth_failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';


part 'forgot_pwd_reset_state.dart';
part 'forgot_pwd_reset_cubit.freezed.dart';

@lazySingleton
class ForgotPwdResetCubit extends Cubit<ForgotPwdResetState> {
  final ForgotPwdService _forgotPwdService;
  ForgotPwdResetCubit(this._forgotPwdService)
      : super(const ForgotPwdResetState.initial());

  /// Reset password outside the app
  Future<void> resetPassword({
    required String email,
    required String password,
  }) async {
    emit(const ForgotPwdResetState.loading());

    final resp =
        await _forgotPwdService.resetPassword(email.trim(), password.trim());

    resp.fold(
      (error) => emit(ForgotPwdResetState.error(error)),
      (success) {
        emit(const ForgotPwdResetState.success());
      },
    );
  }

  /// Change password inside the app
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    emit(const ForgotPwdResetState.loading());

    final resp = await _forgotPwdService.changePassword(
        oldPassword.trim(), newPassword.trim());

    resp.fold(
      (error) => emit(ForgotPwdResetState.error(error)),
      (success) {
        emit(const ForgotPwdResetState.success());
      },
    );
  }
}
