import 'package:app/domain/error/auth_failure.dart';
import 'package:dartz/dartz.dart';


abstract class ForgotPwdService {
  Future<Either<AuthFailure, String>> forgotPwd(String email);
  Future<Either<AuthFailure, String>> verifyOtp(String email, String otp);
  Future<Either<AuthFailure, String>> resetPassword(
      String email, String password);
  Future<Either<AuthFailure, String>> changePassword(
      String oldPassword, String newPassword);
}
