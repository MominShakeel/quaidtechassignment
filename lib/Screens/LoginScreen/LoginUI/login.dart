import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quaidtech/Screens/HomeScreen/HomeUI/home.dart';
import 'package:quaidtech/Screens/LoginScreen/LoginCubit/logincubit.dart';
import 'package:quaidtech/Screens/LoginScreen/LoginCubit/loginstate.dart';

import '../../HomeScreen/APICubit/apiCubit.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Login Page'),centerTitle: true,),
    body:
      Center(
        child: BlocConsumer<LoginAuthCubit,LoginAuthState>(
            listener: (context,state){
          if(state is LoginAuthSuccessState){

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>BlocProvider(
              create: (_)=>PhotosCubit(),
              child: const HomeScreen(),
            )));

          }
        },
            builder: (context,state){
            return ElevatedButton(onPressed: () {

              state is LoginAuthLoadingState?null:()=>context.read<LoginAuthCubit>().login();

              },
                child:state is LoginAuthLoadingState?
                Center(child: CircularProgressIndicator()):
                Text("Login with Gmail",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
            );
          }
        ),
      )
  );
  }
}
