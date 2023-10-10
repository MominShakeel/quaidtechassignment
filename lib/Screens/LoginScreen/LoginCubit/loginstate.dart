import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginAuthState{}

class LoginAuthInitState extends LoginAuthState{

}

class LoginAuthLoadingState extends LoginAuthState{

}

class LoginAuthSuccessState extends LoginAuthState{
   final User user;
   LoginAuthSuccessState(this.user);

}
class LoginAuthFailedState extends LoginAuthState{
  final String error;
  LoginAuthFailedState(this.error);
}

