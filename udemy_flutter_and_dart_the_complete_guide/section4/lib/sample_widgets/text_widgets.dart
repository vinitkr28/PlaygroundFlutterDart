import 'package:flutter/material.dart';

class TextWidgetsSample1 extends StatelessWidget {
  const TextWidgetsSample1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo'),
      ),
      backgroundColor: Colors.white,
      body: Theme(
        data: ThemeData(
            primaryColor: const Color(0xFF623CEA),
            fontFamily: 'Manrope',
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.grey.withOpacity(0.4),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0),
              ),
              labelStyle: const TextStyle(color: Colors.black45),
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.25)),
              iconColor: Colors.grey,
            )),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextField(
                decoration: InputDecoration(
                    hintText: 'TextField', prefixIcon: Icon(Icons.person)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextWidgetsSample2 extends StatelessWidget {
  const TextWidgetsSample2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sample Text field")),
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10)),
            child: const TextField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                border: InputBorder.none,
                hintText: "Full name",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
