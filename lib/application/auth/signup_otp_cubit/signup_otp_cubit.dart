import 'package:app/domain/auth/service/signup_service.dart';
import 'package:app/domain/error/auth_failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';


part 'signup_otp_state.dart';
part 'signup_otp_cubit.freezed.dart';

@lazySingleton
class SignupOtpCubit extends Cubit<SignupOtpState> {
  final SignupService _signupService;
  SignupOtpCubit(this._signupService) : super(const SignupOtpState.initial());

  Future<void> verifyOtp({
    required String otp,
  }) async {
    emit(const SignupOtpState.loading());

    final resp = await _signupService.verifyOtp(otp);

    resp.fold(
      (error) => emit(SignupOtpState.error(error)),
      (success) {
        emit(const SignupOtpState.success());
      },
    );
  }
}
