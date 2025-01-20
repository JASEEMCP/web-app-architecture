import 'dart:async';

import 'package:app/domain/auth/service/forgot_pwd_service.dart';
import 'package:app/domain/auth/service/signup_service.dart';
import 'package:app/domain/error/auth_failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';


part 'resend_otp_state.dart';
part 'resend_otp_cubit.freezed.dart';

@injectable
class ResendOtpCubit extends Cubit<ResendOtpState> {
  final ForgotPwdService _forgotPwdService;
  final SignupService _signupService;
  ResendOtpCubit(this._forgotPwdService, this._signupService)
      : super(const ResendOtpState.timerInitial());

  late Timer _timer;
  bool _isTimerRunning = false;

  //Send otp function
  void startTimer(int duration) async {
    if (_isTimerRunning) {
      _timer.cancel();
    }
    emit(ResendOtpState.timerRunning(duration));
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (timer.tick < duration) {
          emit(ResendOtpState.timerRunning(duration - timer.tick));
        } else {
          emit(const ResendOtpState.timerInitial());
          _isTimerRunning = false;
          _timer.cancel();
        }
      },
    );
    _isTimerRunning = true;
  }

  void reSendOtp(int duration, String phone) async {
    ///prevent handle user press button again when timer is running
    if (!_isTimerRunning) {
      emit(const ResendOtpState.reSendingOtp());
      final result = await _forgotPwdService.forgotPwd(phone.trim());
      result.fold(
        (failure) {
          emit(ResendOtpState.error(failure));
          return;
        },
        (success) => emit(const ResendOtpState.reSendOtpSuccess()),
      );
      startTimer(duration);
    }
  }

  void reSendSignUpOtp(int duration, String email) async {
    ///prevent handle user press button again when timer is running
    if (!_isTimerRunning) {
      emit(const ResendOtpState.reSendingOtp());
      final result = await _signupService.signup(
        email.trim(),
      );
      result.fold((failure) {
        emit(ResendOtpState.error(failure));
      }, (success) {
        emit(const ResendOtpState.reSendOtpSuccess());
      });
      startTimer(duration);
    }
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
