part of 'login_bloc.dart';


abstract class LoginEvent {}

class LoginUser extends LoginEvent {
  final LoginRequestModel loginRequest;

  LoginUser({
    required this.loginRequest,
  });
}