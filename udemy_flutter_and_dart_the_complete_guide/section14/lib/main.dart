
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:section14/firebase_options.dart';
import 'package:section14/screens/auth.dart';
import 'package:section14/screens/chat.dart';
import 'package:section14/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Great Places',
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 63, 17, 177))
      ),
      home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (ctx, snapshot){

        if(snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen();
        }

        if(snapshot.hasData) {
        return ChatScreen();
        } else {
          return AuthScreen();
        }
      }),
      // home: AuthScreen()
    );
  }
}