import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quaidtech/Screens/LoginScreen/LoginCubit/loginstate.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginAuthCubit extends Cubit<LoginAuthState>{
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final auth = FirebaseAuth.instance;
  LoginAuthCubit():super(LoginAuthInitState()){
    User? currentUser = auth.currentUser!;

    if(currentUser != null){
      emit(LoginAuthLoggedInState(currentUser));
    }
    else{
      emit(LoginAuthLoggedOutState(currentUser));
    }

  }






  void login() async{

    emit(LoginAuthLoadingState());

    try{
final userAccount = await _googleSignIn.signIn();

if(userAccount == null){
  return ;
}

final GoogleSignInAuthentication googleAuth = await userAccount.authentication;

final credential = GoogleAuthProvider.credential(
  accessToken: googleAuth.accessToken,
  idToken: googleAuth.idToken
);
final userCredential = await auth.signInWithCredential(credential);

emit(LoginAuthSuccessState(userCredential.user!));



    }catch(e){
      emit(LoginAuthFailedState(e.toString()));
    }

  }

}