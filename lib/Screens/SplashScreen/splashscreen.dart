import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quaidtech/Screens/HomeScreen/APICubit/apiCubit.dart';
import 'package:quaidtech/Screens/HomeScreen/HomeUI/home.dart';

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
                  child:  LoginPage(),
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
