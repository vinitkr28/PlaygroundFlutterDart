import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In with Email"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            children: const [
              Text(
                "Error will show up here",
                style: TextStyle(color: Colors.red),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Email Address"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
