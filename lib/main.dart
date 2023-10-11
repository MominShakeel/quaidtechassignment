
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quaidtech/Screens/HomeScreen/APICubit/apiCubit.dart';
import 'package:quaidtech/Screens/LoginScreen/LoginCubit/logincubit.dart';

import 'Screens/SplashScreen/splashscreen.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(


    );
  }
  catch(e){
    print(e.toString());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {


  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (context)=>LoginAuthCubit()),
        BlocProvider(create: (context)=>PhotosCubit()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(

            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home:  SplashScreen()

      ),
    );
  }
}


