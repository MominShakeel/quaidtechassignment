import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quaidtech/Screens/HomeScreen/APICubit/apiCubit.dart';
import 'package:quaidtech/Screens/HomeScreen/HomeUI/home.dart';
import 'package:quaidtech/Screens/LoginScreen/LoginCubit/loginstate.dart';

import '../LoginScreen/LoginCubit/logincubit.dart';
import '../LoginScreen/LoginUI/login.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is Splash Screen',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            ElevatedButton(
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>BlocProvider(
                  create: (context)=>LoginAuthCubit(),
                  child:  BlocBuilder<LoginAuthCubit,LoginAuthState>(
                    builder: (context,state) {

                      if(state is LoginAuthLoggedInState){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BlocProvider(
                          create: (context)=>PhotosCubit(),
                          child: const HomeScreen(),
                        )));
                      }
                      else if(state is LoginAuthLoggedOutState){
                         LoginPage();
                      }

                        return Scaffold();


                    }
                  ),
                )));
              },
              child: Text('Lets Start'),
            ),
          ],
        ),
      ),
    );
  }
}
