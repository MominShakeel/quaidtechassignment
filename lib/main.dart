import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quaidtech/Screens/HomeScreen/APIDate/Repository/photosRepository.dart';
import 'package:quaidtech/Screens/LoginScreen/LoginCubit/logincubit.dart';

import 'Screens/HomeScreen/APICubit/apiCubit.dart';
import 'Screens/HomeScreen/APIDate/Models/photosModel.dart';
import 'Screens/LoginScreen/LoginUI/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Screens/SplashScreen/splashscreen.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();



  // await Firebase.initializeApp();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {


  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home:  SplashScreen()

    );
  }
}


