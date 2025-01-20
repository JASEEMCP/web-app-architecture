// ignore_for_file: depend_on_referenced_packages

import 'package:app/application/auth/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:app/application/auth/forgot_pwd_otp/forgot_pwd_otp_cubit.dart';
import 'package:app/application/auth/forgot_pwd_reset/forgot_pwd_reset_cubit.dart';
import 'package:app/application/auth/login_cubit/login_cubit.dart';
import 'package:app/application/auth/resend_otp_cubit/resend_otp_cubit.dart';
import 'package:app/application/auth/signup_create/signup_create_cubit.dart';
import 'package:app/application/auth/signup_cubit/signup_cubit.dart';
import 'package:app/application/auth/signup_otp_cubit/signup_otp_cubit.dart';
import 'package:app/application/common/theme_cubit/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';

import 'package:app/resource/injectable.dart';

class RegisterCubits {
  List<SingleChildWidget> register() {
    return [
      /*Common providers*/
      BlocProvider(create: (context) => getIt<ThemeCubit>()),

      /*Auth providers*/
      BlocProvider(create: (context) => getIt<LoginCubit>()),
      BlocProvider(create: (context) => getIt<SignupCreateCubit>()),
      BlocProvider(create: (context) => getIt<SignupCubit>()),
      BlocProvider(create: (context) => getIt<SignupOtpCubit>()),
      BlocProvider(create: (context) => getIt<ForgotPasswordCubit>()),
      BlocProvider(create: (context) => getIt<ForgotPwdOtpCubit>()),
      BlocProvider(create: (context) => getIt<ForgotPwdResetCubit>()),
      BlocProvider(create: (context) => getIt<ResendOtpCubit>()),
    ];
  }
}
