// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../application/auth/forgot_password_cubit/forgot_password_cubit.dart'
    as _i121;
import '../application/auth/forgot_pwd_otp/forgot_pwd_otp_cubit.dart' as _i204;
import '../application/auth/forgot_pwd_reset/forgot_pwd_reset_cubit.dart'
    as _i330;
import '../application/auth/login_cubit/login_cubit.dart' as _i726;
import '../application/auth/resend_otp_cubit/resend_otp_cubit.dart' as _i609;
import '../application/auth/signup_create/signup_create_cubit.dart' as _i266;
import '../application/auth/signup_cubit/signup_cubit.dart' as _i344;
import '../application/auth/signup_otp_cubit/signup_otp_cubit.dart' as _i968;
import '../application/auth/token_cubit/token_cubit.dart' as _i98;
import '../application/common/theme_cubit/theme_cubit.dart' as _i509;
import '../domain/app_logic.dart' as _i659;
import '../domain/auth/service/auth_service.dart' as _i368;
import '../domain/auth/service/forgot_pwd_service.dart' as _i73;
import '../domain/auth/service/signup_service.dart' as _i471;
import '../infrastructure/env/auth/auth_repo.dart' as _i501;
import '../infrastructure/env/auth/forgot_pwd_repo.dart' as _i952;
import '../infrastructure/env/auth/signup_repo.dart' as _i226;
import 'api/dio_client.dart' as _i891;
import 'db/pref_info.dart' as _i29;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i509.ThemeCubit>(() => _i509.ThemeCubit());
  gh.lazySingleton<_i29.PrefInfo>(() => _i29.PrefInfo());
  gh.lazySingleton<_i659.AppLogic>(() => _i659.AppLogic());
  gh.lazySingleton<_i368.AuthService>(() => _i501.AuthRepo());
  gh.lazySingleton<_i471.SignupService>(() => _i226.SignupRepo());
  gh.lazySingleton<_i98.TokenCubit>(
      () => _i98.TokenCubit(gh<_i368.AuthService>()));
  gh.lazySingleton<_i73.ForgotPwdService>(() => _i952.ForgotPwdRepo());
  gh.lazySingleton<_i968.SignupOtpCubit>(
      () => _i968.SignupOtpCubit(gh<_i471.SignupService>()));
  gh.lazySingleton<_i344.SignupCubit>(
      () => _i344.SignupCubit(gh<_i471.SignupService>()));
  gh.lazySingleton<_i726.LoginCubit>(() => _i726.LoginCubit(
        gh<_i368.AuthService>(),
        gh<_i98.TokenCubit>(),
      ));
  gh.lazySingleton<_i891.DioClient>(
      () => _i891.DioClient(gh<_i98.TokenCubit>()));
  gh.lazySingleton<_i330.ForgotPwdResetCubit>(
      () => _i330.ForgotPwdResetCubit(gh<_i73.ForgotPwdService>()));
  gh.lazySingleton<_i204.ForgotPwdOtpCubit>(
      () => _i204.ForgotPwdOtpCubit(gh<_i73.ForgotPwdService>()));
  gh.lazySingleton<_i121.ForgotPasswordCubit>(
      () => _i121.ForgotPasswordCubit(gh<_i73.ForgotPwdService>()));
  gh.lazySingleton<_i266.SignupCreateCubit>(() => _i266.SignupCreateCubit(
        gh<_i471.SignupService>(),
        gh<_i98.TokenCubit>(),
      ));
  gh.factory<_i609.ResendOtpCubit>(() => _i609.ResendOtpCubit(
        gh<_i73.ForgotPwdService>(),
        gh<_i471.SignupService>(),
      ));
  return getIt;
}
