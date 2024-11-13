import 'package:bloctest/blocs/internet_bloc/internet_bloc.dart';
import 'package:bloctest/blocs/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocListener<InternetBloc, InternetState>(
            listener: (context, state) {
              if (state is InternetGainedState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Connected!"),
                  backgroundColor: Colors.green,
                ));
              } else if (state is InternetLostState) {
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
