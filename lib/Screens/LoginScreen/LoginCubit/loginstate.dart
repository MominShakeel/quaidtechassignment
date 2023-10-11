import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginAuthState{}

class LoginAuthInitState extends LoginAuthState{

}

class LoginAuthLoggedInState extends LoginAuthState{
final User? currentUser;
LoginAuthLoggedInState(this. currentUser);
}
class LoginAuthLoggedOutState extends LoginAuthState{
  final User? currentUser;
  LoginAuthLoggedOutState(this. currentUser);
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

