import 'dart:developer';

import 'package:blockforvalidation/sign_in/bloc/sign_in_bloc.dart';
import 'package:blockforvalidation/sign_in/bloc/sign_in_event.dart';
import 'package:blockforvalidation/sign_in/bloc/sign_in_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In with Email"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          child: ListView(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            children: [
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInErrorState) {
                    return Text(
                      state.errorMessage,
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailController,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangeEvent(
                          emailController.text, passwordController.text));
                },
                decoration: InputDecoration(
                  hintText: "Email Address",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordController,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangeEvent(
                          emailController.text, passwordController.text));
                },
                decoration: InputDecoration(hintText: "Password"),
              ),
              SizedBox(
                height: 20,
              ),
              /*BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
                if (state is SignInLoadingState) {
                  return CircularProgressIndicator();
                }
                return CupertinoButton(
                  child: Text("Sign In"),
                  color:
                      (state is SignInValidState) ? Colors.blue : Colors.grey,
                  onPressed: () {
                    if(state is SignInValidState) {
                      BlocProvider.of<SignInBloc>(context).add(
                          SignInSubmittedEvent(
                              emailController.text, passwordController.text));
                    }
                  },
                );
              }),*/
              BlocConsumer<SignInBloc, SignInState>(
                listener: (context, state) {
                  log("BlocConsumer:listener:- state: $state", name: "SignInScreen");
                }, builder: (context, state) {

                log("BlocConsumer:builder:- state: $state", name: "SignInScreen");
                if (state is SignInLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }
                return CupertinoButton(
                  child: Text("Sign In"),
                  color:
                  (state is SignInValidState) ? Colors.blue : Colors.grey,
                  onPressed: () {
                    if(state is SignInValidState) {
                      BlocProvider.of<SignInBloc>(context).add(
                          SignInSubmittedEvent(
                              emailController.text, passwordController.text));
                    }
                  },
                );
              },
              )
            ],
          ),
        ),
      ),
    );
  }
}
