import 'package:bloctest/cubits/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetCubit, InternetState>(
            builder: (context, state) {
              if (state == InternetState.Gained) {
                return const Text(
                  "Connected!",
                );
              } else if (state == InternetState.Lost) {
                return const Text("Not Connected!");
              } else {
                return const Text(
                  "Loading...",
                );
              }
            },
            listener: (context, state) {
              if (state == InternetState.Gained) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Connected!"),
                  backgroundColor: Colors.green,
                ));
              } else if (state == InternetState.Lost) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Not Connected!"),
                  backgroundColor: Colors.red,
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Connecting..."),
                  backgroundColor: Colors.blue,
                ));
              }
            },
          ),
        ),
      ),
    );
  }
}

//== to check value
// is to check data type
//int a = 2;
//if(a == 2)
//if(a is int)
