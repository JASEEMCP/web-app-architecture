import 'package:app/domain/auth/token.dart';
import 'package:app/domain/error/auth_failure.dart';
import 'package:dartz/dartz.dart';


abstract class SignupService {
  Future<Either<AuthFailure, String>> signup(String email);
  Future<Either<AuthFailure, String>> verifyOtp(String otp);
  Future<Either<AuthFailure, Token>> createProfile(
      String username, String password, String phone);
}

class AgentDataModel {
  final String agencyName;
  final String designation;
  final String licenseNumber;

  AgentDataModel(this.agencyName, this.designation, this.licenseNumber);
}
