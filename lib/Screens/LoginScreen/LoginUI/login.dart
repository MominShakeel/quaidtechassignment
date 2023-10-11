import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quaidtech/Screens/HomeScreen/HomeUI/home.dart';
import 'package:quaidtech/Screens/LoginScreen/LoginCubit/logincubit.dart';
import 'package:quaidtech/Screens/LoginScreen/LoginCubit/loginstate.dart';

import '../../HomeScreen/APICubit/apiCubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});


  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Login Page'),centerTitle: true,),
    body:
      Container(
        height: 600,

        child: BlocConsumer<LoginAuthCubit,LoginAuthState>(
            listener: (context,state){
          if(state is LoginAuthSuccessState){

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>BlocProvider(
              create: (context)=>PhotosCubit(),
              child: const HomeScreen(),
            )));

          }
        },
            builder: (context,state){

              if(state is LoginAuthLoadingState){
                return Center(child: CircularProgressIndicator(),);
              }
              else {
                return ElevatedButton(onPressed: () {

                  state is LoginAuthLoadingState?null:()=>context.read<LoginAuthCubit>().login();

                },
                    child:
                    Text("Login with Gmail",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
                );
              }

          }
        ),
      )
  );
  }
}
