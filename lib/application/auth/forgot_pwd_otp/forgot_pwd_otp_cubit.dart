import 'package:app/domain/auth/service/forgot_pwd_service.dart';
import 'package:app/domain/error/auth_failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';


part 'forgot_pwd_otp_state.dart';
part 'forgot_pwd_otp_cubit.freezed.dart';

@lazySingleton
class ForgotPwdOtpCubit extends Cubit<ForgotPwdOtpState> {
  final ForgotPwdService _forgotPwdService;
  ForgotPwdOtpCubit(this._forgotPwdService)
      : super(const ForgotPwdOtpState.initial());

  Future<void> otpVerify({
    required String email,
    required String otp,
  }) async {
    emit(const ForgotPwdOtpState.loading());

    final resp = await _forgotPwdService.verifyOtp(email.trim(), otp);

    resp.fold(
      (error) => emit(ForgotPwdOtpState.error(error)),
      (success) {
        emit(const ForgotPwdOtpState.success());
      },
    );
  }
}
