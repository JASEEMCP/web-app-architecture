import 'package:app/domain/auth/service/signup_service.dart';
import 'package:app/domain/error/auth_failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'signup_state.dart';
part 'signup_cubit.freezed.dart';

@lazySingleton
class SignupCubit extends Cubit<SignupState> {
  final SignupService _signupService;
  SignupCubit(this._signupService) : super(const SignupState.initial());

  Future<void> signup({
    required String email,
  }) async {
    emit(const SignupState.loading());

    final resp = await _signupService.signup(email.trim());

    resp.fold(
      (error) => emit(SignupState.error(error)),
      (success) {
        emit(const SignupState.success());
      },
    );
  }
}
