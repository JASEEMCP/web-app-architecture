import 'package:app/domain/auth/token.dart';
import 'package:app/domain/error/auth_failure.dart';
import 'package:dartz/dartz.dart';


abstract class AuthService {
  Future<Either<AuthFailure, Token>> login(String email, String password);
  Future<Either<AuthFailure, Token>> refresh(String refresh);
  Future<Either<AuthFailure, String>> logout(String refresh);
  Future<Either<AuthFailure, String>> deleteAccount(
      String password, String feedback);
}
