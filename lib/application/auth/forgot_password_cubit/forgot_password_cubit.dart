import 'package:app/domain/auth/service/forgot_pwd_service.dart';
import 'package:app/domain/error/auth_failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';


part 'forgot_password_state.dart';

part 'forgot_password_cubit.freezed.dart';

@lazySingleton
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPwdService _forgotPwdService;
  ForgotPasswordCubit(this._forgotPwdService)
      : super(const ForgotPasswordState.initial());

  Future<void> forgotPassword({
    required String email,
  }) async {
    emit(const ForgotPasswordState.loading());

    final resp = await _forgotPwdService.forgotPwd(email.trim());

    resp.fold(
      (error) => emit(ForgotPasswordState.error(error)),
      (success) {
        emit(const ForgotPasswordState.success());
      },
    );
  }
}
