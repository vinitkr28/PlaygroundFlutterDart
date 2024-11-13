import 'package:blockforvalidation/sign_in/bloc/sign_in_bloc.dart';
import 'package:blockforvalidation/sign_in/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: CupertinoButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => SignInBloc(),
                          child: SignInScreen(),
                        ),
                      ),
                    );
                  },
                  color: Colors.blue,
                  child: Text("Sign In with Email."),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: CupertinoButton(
                  onPressed: () => {},
                  color: Colors.blue,
                  child: Text("Sign In with Google."),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
